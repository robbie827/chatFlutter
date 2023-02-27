import 'package:chatflutter/components/conversation_list.dart';
import 'package:chatflutter/components/people_screen.dart';
import 'package:chatflutter/components/groups_screen.dart';
import 'package:chatflutter/models/chat_users_model.dart';
import 'package:chatflutter/service/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../auth/login_screen.dart';
import '../home/home_screen.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // final FocusNode _focus = FocusNode();
  final ApiService _apiService = ApiService();
  bool isTapped = false;
  var issearching;
  List<ChatUser> searchresult = [];
  List<ChatUser> allUsers = [];
  String? imageUrl = null;
  @override
  void initState() {
    super.initState();
    getAllUsers();
  }

  void getAllUsers() {
    _apiService.getUsers().then((value) {
      setState(() {
        allUsers = value!;
      });
    });
  }

  TextEditingController controller = TextEditingController(text: "");

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
      for (int i = 0; i < allUsers.length; i++) {
        String data = allUsers[i].name;
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          setState(() {
            searchresult.add(allUsers[i]);
          });
        }
      }
    }
  }

  void logout() {
    _apiService.logout().then((value) {});
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
              toolbarHeight: 130,
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
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(
                            top: 3, bottom: 3, left: 10, right: 10),
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.rectangle),
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
                        padding: const EdgeInsets.all(8.0),
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
                    // icon: Icon(
                    //   Icons.supervised_user_circle,
                    //   color: Colors.blue,
                    // ),
                    child: Text(
                  'People',
                  style: TextStyle(
                    fontFamily: 'OpenSansBold',
                    fontSize: 15.0,
                    color: Colors.blue,
                  ),
                )),
                Tab(
                    // icon: Icon(
                    //   Icons.groups,
                    //   color: Colors.blue,
                    // ),
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
                  ? PeopleScreen()
                  : Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: searchresult.length,
                        padding: const EdgeInsets.only(top: 16),
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ConversationList(
                            name: searchresult[index].name,
                            imageUrl: searchresult[index].photo,
                            id: searchresult[index].id,
                          );
                        },
                      ),
                    ),
              const GroupsScreen(),
            ])));
  }
}
