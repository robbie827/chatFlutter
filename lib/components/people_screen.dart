import 'package:chatflutter/components/favorite_user_widget.dart';
import 'package:chatflutter/models/chat_users_model.dart';
import 'package:chatflutter/screen/chat/saved_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatflutter/models/favorites_model.dart';
import 'package:chatflutter/service/api.dart';
import 'package:chatflutter/components/conversation_list.dart';

class PeopleScreen extends StatefulWidget {
  PeopleScreen({Key? key}) : super(key: key);

  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  final ApiService _apiService = ApiService();

  List<FavoriteModel> favoriteUsers = [];
  List<ChatUser> contactUsers = [];

  @override
  void initState() {
    super.initState();
    getFavorites();
    getContacts();
  }

  void getFavorites() {
    _apiService.getFavorites().then((value) {
      setState(() {
        favoriteUsers = value!;
      });
    });
  }

  void getContacts() {
    _apiService.getContacts().then((con) {
      setState(() {
        contactUsers = con!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 0, top: 10),
            child: Text(
              'FAVORITES',
              style: TextStyle(fontSize: 15.0, color: Colors.grey),
            ),
          ),
          SizedBox(
            // height: MediaQuery.of(context).size.height * 0.16,
            height: 95,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: favoriteUsers.length,
              padding: const EdgeInsets.only(top: 3),
              scrollDirection: Axis.horizontal,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FavoriteUserWidget(
                    // name: ((favoriteUsers[index].user!.company_name == null)
                    //     ? favoriteUsers[index].user!.name
                    //     : favoriteUsers[index].user!.company_name),

                    name: favoriteUsers[index].user!.name,
                    id: favoriteUsers[index].user!.id,
                    // : favoriteUsers[index].user!.name
                    imageUrl: favoriteUsers[index].user!.photo);
              },
            ),
          ),
          // Row(
          //   children: [
          //     for (var i = 0; i < favoriteUsers.length; i++)
          //       FavoriteUserWidget(
          //           name: favoriteUsers[i].user!.name,
          //           imageUrl: favoriteUsers[i].user!.photo),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    left: 30, bottom: 10, right: 15, top: 0),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SavedScreen()),
                    );
                  },
                  child: Icon(
                    Icons.bookmark_border_rounded,
                    color: Colors.blue,
                    size: 27,
                  ),
                  backgroundColor: const Color.fromARGB(255, 184, 223, 241),
                  elevation: 0,
                ),
              ),
              Container(
                  child: Column(
                children: const <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 10, top: 3, bottom: 1),
                    child: Text(
                      'Saved Messages',
                      style: TextStyle(fontSize: 9.0, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15, right: 10, top: 1, bottom: 1),
                    child: Text(
                      'Save Messages Secretly',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                ],
              )),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: contactUsers.length,
              padding: const EdgeInsets.only(top: 10),
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: contactUsers[index].name,
                  imageUrl: contactUsers[index].photo,
                  id: contactUsers[index].id,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
