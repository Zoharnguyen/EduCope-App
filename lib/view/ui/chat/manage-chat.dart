import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_cope/dto/chat-overview-dto.dart';
import 'package:edu_cope/dto/response-entity.dart';
import 'package:edu_cope/service/api-account.dart';
import 'package:edu_cope/view/ui/common/conversation_list.dart';
import 'package:edu_cope/view/ui/common/widget-utils.dart';
import 'package:edu_cope/view/ui/homepage-T-and-P.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double width = CommonUtils.width;
double height = CommonUtils.height;
var userId = CommonUtils.currentUserId;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManageChat(),
    );
  }
}

class ManageChat extends StatefulWidget {
  @override
  _ManageChatState createState() => _ManageChatState();
}

class _ManageChatState extends State<ManageChat> {
  List<ChatOverviewDto> chatOverviewDtos = initializeListChatOverviewDto();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(WidgetUtils.valueColorAppBar),
        title: Container(
          margin: EdgeInsets.only(
            right: width * 0.2 / 2,
          ),
          child: Align(
            child: Text(
              'Quản lý tin nhắn',
              style: TextStyle(
                color: Colors.white,
                fontSize: CommonUtils.getUnitPx() * 20,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageTandP(userId)));
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Search chat
            // Padding(
            //   padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: "Tìm kiếm ...",
            //       hintStyle: TextStyle(color: Colors.grey.shade600),
            //       prefixIcon: Icon(
            //         Icons.search,
            //         color: Colors.grey.shade600,
            //         size: 20,
            //       ),
            //       filled: true,
            //       fillColor: Colors.grey.shade100,
            //       contentPadding: EdgeInsets.all(8),
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(20),
            //           borderSide: BorderSide(color: Colors.grey.shade100)),
            //     ),
            //   ),
            // ),
            Container(
              child: FutureBuilder<List<ChatOverviewDto>>(
                future: getListChat(userId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ChatOverviewDto> listChat =
                        snapshot.data ?? <ChatOverviewDto>[];
                    return showListChat(listChat);
                  } else
                    return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Container showListChat(List<ChatOverviewDto> chatOverviewDtos) {
  return Container(
      child: ListView.builder(
    itemCount: chatOverviewDtos.length,
    shrinkWrap: true,
    padding: EdgeInsets.only(top: height * 0.01 / 5),
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return ConversationList(
        name: CommonUtils.catchCaseStringNull(
            chatOverviewDtos[index].partnerName),
        messageText: CommonUtils.catchCaseStringNull(
            chatOverviewDtos[index].messageContent),
        imageUrl: CommonUtils.catchCaseStringNull(
            chatOverviewDtos[index].partnerImage),
        time: CommonUtils.catchCaseStringNull(
            CommonUtils.getDayMonthYearFromDateString(
                chatOverviewDtos[index].timeSend)),
        chatId: CommonUtils.catchCaseStringNull(chatOverviewDtos[index].chatId),
        partnerName: CommonUtils.catchCaseStringNull(chatOverviewDtos[index].partnerName),
        partnerId: CommonUtils.catchCaseStringNull(chatOverviewDtos[index].partnerId),
        isMessageRead: (index == 0 || index == 3) ? true : false,
      );
    },
  ));
}

List<ChatOverviewDto> initializeListChatOverviewDto() {
  List<ChatOverviewDto> chatOverviewDtos = <ChatOverviewDto>[];
  chatOverviewDtos.add(initializeChatOverviewDto());
  chatOverviewDtos.add(initializeChatOverviewDto());
  chatOverviewDtos.add(initializeChatOverviewDto());
  chatOverviewDtos.add(initializeChatOverviewDto());
  chatOverviewDtos.add(initializeChatOverviewDto());
  return chatOverviewDtos;
}

ChatOverviewDto initializeChatOverviewDto() {
  ChatOverviewDto chatOverviewDto = new ChatOverviewDto();
  chatOverviewDto.partnerName = 'Nguyen Van B';
  chatOverviewDto.messageContent = 'Xin chao ban';
  chatOverviewDto.timeSend = 'Hom nay';
  chatOverviewDto.partnerImage = '';
  return chatOverviewDto;
}

Future<List<ChatOverviewDto>> getListChat(String userId) async {
  APIAcountClient apiAcountClient =
      APIAcountClient(Dio(BaseOptions(contentType: "application/json")));
  ResponseEntity responseEntity = await apiAcountClient.getListChat(userId);
  if (responseEntity.getStatus == HttpStatus.ok) {
    List listDecoded = responseEntity.data;
    ChatOverviewDto response = ChatOverviewDto.fromJson(responseEntity.data[0]);
    print('Id: ' + response.chatId.toString());
    return listDecoded
        .map((chatOverviewDto) => new ChatOverviewDto.fromJson(chatOverviewDto))
        .toList();
  } else {

    print('Error: ' + responseEntity.getException.toString());
  }
  return <ChatOverviewDto>[];
}
