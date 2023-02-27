import 'package:chatflutter/models/messages_model.dart';
import 'package:chatflutter/models/send_message_model.dart';
import 'package:chatflutter/screen/auth/profile_screen.dart';
import 'package:chatflutter/screen/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatflutter/service/api.dart';
import 'dart:async';

import '../auth/login_screen.dart';
import '../home/home_screen.dart';

class MessageScreen extends StatefulWidget {
  final String imageUrl;
  final int userId;
  final String name;

  const MessageScreen(
      {Key? key,
      required this.userId,
      required this.name,
      required this.imageUrl})
      : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late Timer _timer;
  final ApiService _apiService = ApiService();

  List<MessageModel> Messages = [];
  List<SendMessageModel> sendMessages = [];
  List<MessageModel> reversedMessages = [];
  bool favorite = false;
  String? imageUrl = null;
  @override
  void initState() {
    // Star(widget.userId);
    super.initState();
    if (mounted) {
      _timer = new Timer.periodic(const Duration(seconds: 2), (timer) {
        getMessages(widget.userId);
      });
    }
  }

  void Star(int id) {
    _apiService.Star(id).then(
      (value) {
        setState(() {
          favorite = value!;
        });
      },
    );
  }

  void getMessages(int id) {
    _apiService.getMessages(id).then((value) {
      setState(() {
        Messages = value!;
        reversedMessages = Messages.reversed.toList();
      });
    });
  }

  void sendMessage(int id, String type, String message, String temporaryMsgId) {
    _apiService.sendMessage(id, type, message, temporaryMsgId).then((value) {
      setState(() {
        messageController.clear();
        getMessages(widget.userId);
      });
    });
  }

  void logout() {
    _apiService.logout().then((value) {});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        top: 3, bottom: 3, left: 10, right: 10)),
                Container(
                  child: IconButton(
                    icon: Image.network(
                        'http://wh.saas.test/geniusBankWallet/assets/images/GZrLGJFQ1674480311.jpg'),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                ),
                Spacer(),
                Container(
                  padding:
                      EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                  decoration: const BoxDecoration(
                      color: Colors.transparent, shape: BoxShape.rectangle),
                  child: PopupMenuButton(
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(20), // Image radius
                        child: Image.network((imageUrl == null ||
                                imageUrl == "")
                            ? 'http://wh.saas.test/geniusBankWallet/assets/user/img/user.jpg'
                            : 'http://wh.saas.test/geniusBankWallet/assets/images/${imageUrl}'),
                      ),
                    ),
                    color: Colors.white, // color setting

                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text(
                          "Edit Profile",
                        ),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text("Module"),
                        value: 2,
                      ),
                      PopupMenuItem(
                        child: InkWell(
                            onTap: () {
                              print("here");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen()),
                              );
                            },
                            child: Text("Chat")),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text("Change Password"),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text("Pricing Plan"),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text("Security"),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text("Login Activity"),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text("AML/KYC"),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text("Pincode"),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: InkWell(
                            onTap: () {
                              print("logout");
                              logout();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            child: Text("Logout")),
                        value: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen()));
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_left_sharp,
                        color: Colors.blue,
                        size: 25,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage((widget.imageUrl == "null" ||
                            widget.imageUrl.isEmpty)
                        ? 'http://wh.saas.test/geniusBankWallet/assets/user/img/user.jpg'
                        : 'http://wh.saas.test/geniusBankWallet/assets/images/${widget.imageUrl}'),
                    radius: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.name.replaceRange(8, widget.name.length, '...'),
                    style: const TextStyle(
                      fontFamily: 'OpenSansBold',
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                favorite == false
                    ? Padding(
                        padding: EdgeInsets.all(4),
                        child: InkWell(
                          onTap: () {
                            favorite = true;
                            // Star(widget.userId);
                          },
                          child: const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 236, 204, 63),
                            size: 23,
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.all(4),
                        child: InkWell(
                          onTap: () {
                            favorite = false;
                            // Star(widget.userId);
                          },
                          child: const Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 23,
                          ),
                        ),
                      ),
                // const Padding(
                //   padding: EdgeInsets.all(4),
                //   child: Icon(
                //     Icons.house,
                //     color: Colors.blue,
                //     size: 23,
                //   ),
                // ),
                Padding(
                    padding: EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen(
                                  userId: widget.userId,
                                  name: widget.name.toString(),
                                  imageUrl: widget.imageUrl.toString())),
                        );
                      },
                      child: const Icon(
                        Icons.info_rounded,
                        color: Colors.blue,
                        size: 20,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          // ListView.builder(
          //   itemCount: Messages.length,
          //   shrinkWrap: true,
          //   padding: EdgeInsets.only(top: 10, bottom: 10),
          //   physics: NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, index) {
          //     return Container(
          //       padding:
          //           EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          //       child: Align(
          //         alignment: (Messages[index].fromId == widget.userId
          //             ? Alignment.topLeft
          //             : Alignment.topRight),
          //         child: Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20),
          //             color: (Messages[index].fromId == widget.userId
          //                 ? Colors.grey.shade200
          //                 : Colors.blue[200]),
          //           ),
          //           padding: EdgeInsets.all(16),
          //           child: Text(
          //             Messages[index].body,
          //             style: TextStyle(fontSize: 15),
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
          SingleChildScrollView(
            child: Column(
              children: [
                for (var element in reversedMessages)
                  Container(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 10, bottom: 10),
                    child: Align(
                      alignment: (element.fromId == widget.userId
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (element.fromId == widget.userId
                              ? Colors.grey.shade200
                              : Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          element.body,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 100,
                ),
              ],
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
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      sendMessage(widget.userId, "user",
                          messageController.text.toString(), "temp_1");
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
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
