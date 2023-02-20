import 'package:chatflutter/components/conversationList.dart';
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
  // final FocusNode _focus = FocusNode();
  bool isTapped = false;
  var issearching;
  List<ChatUser> searchresult = [];

  TextEditingController controller = TextEditingController(text: "");
  List<ChatUser> chatUser = [
    ChatUser(
        name: "Alek",
        messageText: "Awesome Setup",
        imageURL: "assets/images/avatar1.jpg",
        time: "Now"),
    ChatUser(
        name: "Robbie",
        messageText: "That's great",
        imageURL: "assets/images/Florian.jpg",
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

  // @override
  // void initState() {
  //   super.initState();
  //   _focus.addListener(_onFocusChange);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _focus.removeListener(_onFocusChange);
  //   _focus.dispose();
  // }

  // void _onFocusChange() {
  //   debugPrint("Focus: ${_focus.hasFocus.toString()}");
  //   if (_focus.hasFocus == true) {
  //     setState(() {
  //       isTapped = true;
  //     });
  //   } else {
  //     setState(() {
  //       isTapped = false;
  //     });
  //   }
  // }

  void searchOperation(String searchText) {
    searchresult.clear();
    if (searchText != null) {
      for (int i = 0; i < chatUser.length; i++) {
        String data = chatUser[i].name;
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          setState(() {
            searchresult.add(chatUser[i]);
            print(searchresult);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
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
                      // focusNode: _focus,
                      onChanged: (value) {
                        setState(() {
                          issearching = value;
                        });
                        searchOperation(issearching);
                      },
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
              issearching == null || issearching.length == 0
                  ? const PeopleScreen()
                  : Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: searchresult.length,
                        padding: const EdgeInsets.only(top: 16),
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ConversationList(
                            name: searchresult[index].name,
                            messageText:
                                searchresult[index].messageText.toString(),
                            imageUrl: searchresult[index].imageURL.toString(),
                            time: searchresult[index].time.toString(),
                            isMessageRead: (index == 0) ? true : false,
                          );
                        },
                      ),
                    ),
              const GroupsScreen(),
            ])));
  }
}
