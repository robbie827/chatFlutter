import 'package:chatflutter/screen/chat/message_screen.dart';
import 'package:flutter/material.dart';

class ConversationList extends StatefulWidget {
  String name;
  String? messageText;
  String? imageUrl;
  String? time;
  int id;

  ConversationList({
    required this.name,
    required this.id,
    this.messageText,
    this.imageUrl,
    this.time,
  });

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MessageScreen(
                  userId: widget.id,
                  name: widget.name,
                  imageUrl: widget.imageUrl.toString())),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 10),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage((widget.imageUrl == null ||
                      widget.imageUrl!.isEmpty)
                  ? 'http://wh.saas.test/geniusBankWallet/assets/user/img/user.jpg'
                  : 'http://wh.saas.test/geniusBankWallet/assets/images/${widget.imageUrl!}'),
              maxRadius: 22,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                // widget.name.replaceRange(10, widget.name.length, '...'),
                widget.name,
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
