import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_amqp/dart_amqp.dart';
import 'package:dio/dio.dart';
import 'package:edu_cope/constant/from-screen.dart';
import 'package:edu_cope/dto/chat-detail-dto.dart';
import 'package:edu_cope/dto/chat-overview-dto.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/service/api-chat.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:uuid/uuid.dart';

import 'manage-chat.dart';

void main() {
  runApp(MyApp());
}

double width = CommonUtils.width;
double height = CommonUtils.height;
// Use for send and receive chat message
String senderId = CommonUtils.currentUserId;
String receiverIdGlobal = CommonUtils.tempUserId;
// Use for update last message to list chat
String ownerIdGlobal = CommonUtils.currentUserId;
String partnerIdGlobal = CommonUtils.tempUserId;
String chatIdGlobal = '';
List<ChatDetailDto> messages = <ChatDetailDto>[];
ChatDetailDto chatDetailDtoGlobal = initailizeChateDetailSend();
String previousScreenGlobal = '';
String partnerNameGlobal = '';
String partnerImageGlobal = '';
Image? profileImageGlobal = null;
final String tokenType = "Bearer ";

final socketUrl = 'ws://192.168.1.212:8081/ws-message';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailChat(previousScreenGlobal, chatIdGlobal, partnerNameGlobal,
          partnerIdGlobal, profileImageGlobal),
    );
  }
}

class DetailChat extends StatefulWidget {
  DetailChat(String previousScreen, String chatId, String partnerName,
      String partnerId, Image? profileImageParter) {
    previousScreenGlobal = previousScreen;
    chatIdGlobal = chatId;
    partnerNameGlobal = partnerName;
    partnerIdGlobal = partnerId;
    receiverIdGlobal = partnerId;
    profileImageGlobal = profileImageParter;
  }

  @override
  _DetailChatState createState() => _DetailChatState();
}

Future _scrollToIndex(
    AutoScrollController autoScrollController, int position) async {
  await autoScrollController.scrollToIndex(position,
      preferPosition: AutoScrollPosition.begin);
}

class _DetailChatState extends State<DetailChat> {
  // Set up for connection with socket
  late StompClient stompClient;
  late AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;
  bool firstIn = true;
  String messageContent = '';
  late Client clientMQ;
  int messageSizeStart = 0;
  int messageSizeEnd = 0;

  var _headers = <String, String>{};

  // '/chat/' + chatId
  void onConnect(StompFrame frame) {
    // Add token to header
    _headers.putIfAbsent("Authorization", () => tokenType + CommonUtils.userToken);
    stompClient.subscribe(
        destination: '/chat/' + chatIdGlobal,
        // headers: _headers,
        callback: (StompFrame frame) {
          if (frame.body != null) {
            Map<String, dynamic> result = json.decode(frame.body ?? '');
            print(result['messageContent']);
            setState(() {
              ChatDetailDto chatDetailDto = ChatDetailDto.fromJson(result);
              messages.add(chatDetailDto);
              if (messages.length > 0)
                _scrollToIndex(_autoScrollController, messages.length - 1);
            });
          }
        });
  }

  @override
  initState() {
    super.initState();

    // Gen chatId if chatId is empty
    if (chatIdGlobal == null || chatIdGlobal == '') {
      var uuid = Uuid();
      chatIdGlobal = uuid.v1();
      print("chatID: " + chatIdGlobal);
      chatDetailDtoGlobal = initailizeChateDetailSend();
    }

    // Get all old message of chatId from server
    setValueForMessages();
    messageSizeStart = messages.length;

    // Config for Client of socket connection
    if (firstIn) {
      stompClient = StompClient(
          config: StompConfig(
        url: socketUrl,
        onConnect: onConnect,
        onWebSocketError: (dynamic error) => print(error.toString()),
      ));

      stompClient.activate();
      firstIn = false;
    }

    // Auto scroll to last message
    _autoScrollController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);

    // Initialize Client of connection rabbitMQ
    ConnectionSettings settings = ConnectionSettings(
        host: '192.168.1.212',
        port: 5672,
        authProvider: PlainAuthenticator("admin", "admin"));
    clientMQ = Client(settings: settings);
  }

  final nameHolder = TextEditingController();

  setValueForMessages() async {
    await getMessagesByChatId(chatIdGlobal).then((value) {
      setState(() {
        print("Size of messages: " + messages.length.toString());
        messages = value;
        if (messages.length > 0)
          _scrollToIndex(_autoScrollController, messages.length - 1);
      });
    });
  }

  clearTextInput() {
    nameHolder.clear();
  }

  setLastMessage() {
    messageSizeEnd = messages.length;
    // Check if have any new message in Chat then will update last message for listChat
    if (messageSizeStart != messageSizeEnd) {
      ChatOverviewDto chatOverviewDto = initializeChatOverviewDto();
      chatOverviewDto.messageContent = messages.last.messageContent;
      sendMessageToQueue(clientMQ, chatOverviewDto);
    }
  }

  @override
  void dispose() {
    setLastMessage();

    if (stompClient != null) {
      stompClient.deactivate();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () async {
                    // Check if previous screen is manage chat then will back to this screen and
                    // refresh this screen to load latest message.
                    if (FromScreen.fromScreenManageChat ==
                        previousScreenGlobal) {
                      // Set lastMessage
                      setLastMessage();
                      // Set delay time when message send to RabbitMQ and receive message from RabbitMQ
                      await Future.delayed(const Duration(milliseconds: 50));
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ManageChat()))
                          .then((value) => setState(() {}));
                    } else {
                      Navigator.pop(context, true);
                    }
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  radius: height * 0.16 / 5,
                  backgroundColor: Color(0xFFe1f5f2),
                  child: CircleAvatar(
                    radius: height * 0.15 / 5,
                    backgroundImage: profileImageGlobal != null
                        ? profileImageGlobal!.image
                        : NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        CommonUtils.catchCaseStringNull(partnerNameGlobal),
                        style: TextStyle(
                            fontSize: CommonUtils.getUnitPx() * 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Truc tuyen",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: CommonUtils.getUnitPx() * 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: height * 3.97 / 5,
            child: ListView.builder(
              scrollDirection: scrollDirection,
              controller: _autoScrollController,
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              itemBuilder: (context, index) {
                return showMessageElement(messages[index], index,
                    messages.length, _autoScrollController);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: false,
                      controller: nameHolder,
                      onChanged: (value) {
                        messageContent = value;
                        chatDetailDtoGlobal.messageContent = value;
                      },
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      clearTextInput();
                      stompClient.send(
                          destination: '/edu-cope/sendMessage',
                          body: json.encode(chatDetailDtoGlobal.toJson()),
                          headers: {});
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Color(0xFF1298e0),
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container showMessageElement(ChatDetailDto message, int index,
    int messagesLength, AutoScrollController autoScrollController) {
  return Container(
      child: AutoScrollTag(
          key: ValueKey(index),
          controller: autoScrollController,
          index: index,
          child: Container(
            padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
            child: Align(
              alignment: (message.senderId != senderId
                  ? Alignment.topLeft
                  : Alignment.topRight),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (message.senderId != senderId
                      ? Colors.grey.shade200
                      : Colors.blue[200]),
                ),
                padding: EdgeInsets.all(16),
                child: Text(
                  message.messageContent ?? '',
                  style: TextStyle(fontSize: CommonUtils.getUnitPx() * 15),
                ),
              ),
            ),
          )));
}

Future<void> sendMessageToQueue(
    Client clientMQ, ChatOverviewDto chatOverviewDto) async {
  Channel channel = await clientMQ.channel();
  Exchange exchange = await channel.exchange(
      "educope.manage-chat.exchange", ExchangeType.DIRECT,
      durable: true);
  String routingKey = "educope.manage-chat.routingkey";
  String chatOverviewDtoJson = jsonEncode(chatOverviewDto);
  // Config properties for message
  MessageProperties messageProperties = new MessageProperties();
  messageProperties.contentType = 'text/plain';
  messageProperties.contentEncoding = 'UTF-8';
  // Publish message to queue by routingKey
  exchange.publish(chatOverviewDtoJson, routingKey,
      properties: messageProperties);
  print(
      "Send message: " + chatOverviewDtoJson + " to routingKey: " + routingKey);
  clientMQ.close();
}

ChatDetailDto initailizeChateDetailSend() {
  ChatDetailDto chatDetailDtoGlobal = new ChatDetailDto();
  chatDetailDtoGlobal.chatId = chatIdGlobal;
  chatDetailDtoGlobal.senderId = senderId;
  chatDetailDtoGlobal.receiverId = receiverIdGlobal;
  return chatDetailDtoGlobal;
}

ChatOverviewDto initializeChatOverviewDto() {
  ChatOverviewDto chatOverviewDto = new ChatOverviewDto();
  chatOverviewDto.chatId = chatIdGlobal;
  chatOverviewDto.ownerId = ownerIdGlobal;
  chatOverviewDto.partnerId = partnerIdGlobal;
  return chatOverviewDto;
}

Future<List<ChatDetailDto>> getMessagesByChatId(String chatId) async {
  APIChatClient apiChatClient =
      APIChatClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity =
      await apiChatClient.getMessagesByChatId(chatId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    List listDecoded = responseEntity.data;
    ChatDetailDto response = ChatDetailDto.fromJson(responseEntity.data[0]);
    print('Id: ' + response.id.toString());
    return listDecoded
        .map((chatDetailDto) => new ChatDetailDto.fromJson(chatDetailDto))
        .toList();
  } else {
    print('Error: ' + responseEntity.getException.toString());
  }
  return <ChatDetailDto>[];
}
