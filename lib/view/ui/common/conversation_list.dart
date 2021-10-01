import 'package:edu_cope/constant/from-screen.dart';
import 'package:edu_cope/view/ui/chat/detail-chat.dart';
import 'package:edu_cope/view/utils/common-utils.dart';
import 'package:flutter/material.dart';

import 'widget-utils.dart';

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  String chatId;
  String partnerName;
  bool isMessageRead;
  String partnerId;

  ConversationList(
      {required this.name,
      required this.messageText,
      required this.imageUrl,
      required this.time,
      required this.chatId,
      required this.partnerName,
      required this.isMessageRead,
      required this.partnerId});

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    Image? profileImage = null;
    if (widget.imageUrl != null && widget.imageUrl != ' ') {
      profileImage =
          new Image.memory(WidgetUtils.dataFromBase64String(widget.imageUrl));
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailChat(
                    FromScreen.fromScreenManageChat,
                    widget.chatId,
                    widget.partnerName,
                    widget.partnerId,
                    profileImage)));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: CommonUtils.height * 0.18 / 5,
                    backgroundColor: Color(0xFFe1f5f2),
                    child: CircleAvatar(
                      radius: CommonUtils.height * 0.17 / 5,
                      backgroundImage: profileImage != null
                          ? profileImage.image
                          : NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontSize: CommonUtils.getUnitPx() * 16),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.messageText,
                            style: TextStyle(
                                fontSize: CommonUtils.getUnitPx() * 13,
                                color: Colors.grey.shade600,
                                fontWeight: widget.isMessageRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: CommonUtils.getUnitPx() * 12,
                  fontWeight: widget.isMessageRead
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
