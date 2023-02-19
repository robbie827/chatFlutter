import 'package:chatflutter/components/people_screen.dart';
import 'package:chatflutter/components/groups_screen.dart';
import 'package:chatflutter/models/chatUsersModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FocusNode _focus = FocusNode();
  bool isTapped = false;
  TextEditingController controller = TextEditingController(text: "");
  List<ChatUser> userList = [
    ChatUser(
        name: "Alek",
        messageText: "Awesome Setup",
        imageURL: "assets/images/avatar1.jpg",
        time: "Now"),
    ChatUser(
        name: "Robbie",
        messageText: "That's great",
        imageURL: "assets/images/Florian.npg",
        time: "Yesterday"),
    ChatUser(
        name: "Joy",
        messageText: "How are u?",
        imageURL: "assets/images/avatar1.jpg",
        time: "31 Jan"),
    ChatUser(
        name: "Robbie123",
        messageText: "Who are u?",
        imageURL: "assets/images/avatar1.jpg",
        time: "25 Jan"),
    ChatUser(
        name: "Robbie12345",
        messageText: "What is this?",
        imageURL: "assets/images/avatar1.jpg",
        time: "19 Jan")
  ];

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
    if (_focus.hasFocus == true) {
      setState(() {
        isTapped = true;
      });
    } else {
      setState(() {
        isTapped = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              toolbarHeight: 90,
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.inbox,
                          color: Colors.blue,
                          size: 18,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'MESSAGES',
                          style: TextStyle(
                            fontFamily: 'OpenSansBold',
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const ProfileScreen()),
                            // );
                          },
                          child: const Icon(
                            Icons.settings,
                            color: Colors.blue,
                            size: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CupertinoSearchTextField(
                      controller: controller,
                      focusNode: _focus,
                      onChanged: (value) {},
                      onSubmitted: (value) {},
                      autocorrect: true,
                    ),
                  ),
                ],
              ),
              bottom: const TabBar(tabs: [
                Tab(
                    icon: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.blue,
                    ),
                    child: Text(
                      'People',
                      style: TextStyle(
                        fontFamily: 'OpenSansBold',
                        fontSize: 15.0,
                        color: Colors.blue,
                      ),
                    )),
                Tab(
                    icon: Icon(
                      Icons.groups,
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Groups',
                      style: TextStyle(
                        fontFamily: 'OpenSansBold',
                        fontSize: 15.0,
                        color: Colors.blue,
                      ),
                    ))
              ]),
            ),
            body: TabBarView(children: [
              isTapped == false
                  ? PeopleScreen()
                  : Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 26,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/avatar1.jpg'),
                                  radius: 24,
                                ),
                              ),
                              Text(userList[index].name),
                            ],
                          );
                        },
                      ),
                    ),
              GroupsScreen(),
            ])));
  }
}
