import 'package:chatflutter/components/people_screen.dart';
import 'package:chatflutter/components/groups_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController(text: "");
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
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.inbox,
                          color: Colors.blue,
                          size: 18,
                        ),
                      ),
                      Padding(
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
                          child: Icon(
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
              PeopleScreen(),
              GroupsScreen(),
            ])));
  }
}
