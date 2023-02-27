import 'package:flutter/material.dart';
import 'package:chatflutter/service/api.dart';
import '../chat/message_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String imageUrl;
  final int userId;
  final String name;
  const ProfileScreen({
    Key? key,
    required this.userId,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ApiService _apiService = ApiService();

  void Delete(int id) async {
    _apiService.Delete(id).then((value) {
      if (value == 'success') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MessageScreen(
                  userId: widget.userId,
                  name: widget.name,
                  imageUrl: widget.imageUrl)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Delete failed \n please again"),
          backgroundColor: Colors.red,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              alignment: Alignment.topLeft,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: InkWell(
                child: const Icon(
                  Icons.cancel,
                  color: Colors.blue,
                  size: 20,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MessageScreen(
                            userId: widget.userId,
                            name: widget.name,
                            imageUrl: widget.imageUrl)),
                  );
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(color: Colors.transparent),
              alignment: Alignment.center,
              child: Column(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 64,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage((widget.imageUrl ==
                                    "null" ||
                                widget.imageUrl.isEmpty)
                            ? 'http://wh.saas.test/geniusBankWallet/assets/user/img/user.jpg'
                            : 'http://wh.saas.test/geniusBankWallet/assets/images/${widget.imageUrl}'),
                        radius: 60,
                      )),
                  Text(
                    widget.name,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: TextButton.icon(
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      icon: const Icon(
                        Icons.restore_from_trash_outlined,
                        size: 24.0,
                        color: Color.fromARGB(187, 244, 67, 54),
                      ),
                      label: const Text(
                        'Delete Conversation',
                        style: TextStyle(
                          color: Color.fromARGB(187, 244, 67, 54),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Column(
                  children: [
                    Text(
                      "SHARED PHOTOS",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Expanded(
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Text("there is nothing"),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    final ApiService _apiService = ApiService();
    // set up the buttons
    Widget cancelButton = InkWell(
      child: Text("Cancel"),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = InkWell(
      child: const Text(
        "Delete",
        style: TextStyle(color: Colors.red),
      ),
      onTap: () {
        print("delete");
        Delete(widget.userId);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text(
          "Are you sure you want to delete this? \n You can not undo this action."),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
