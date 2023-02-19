import 'package:chatflutter/models/chatMessageModel.dart';
import 'package:chatflutter/screen/chat/chat_screen.dart';
import 'package:chatflutter/screen/chat/message_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                        builder: (context) => const MessageScreen()),
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
                  const CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 64,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/avatar1.jpg'),
                        radius: 60,
                      )),
                  const Text(
                    "Smiss",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: TextButton.icon(
                      onPressed: () {},
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
                        decoration: const BoxDecoration(color: Colors.yellow),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Text("Photo Content"),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     // Align(
      //     //   alignment: Alignment.topLeft,
      //     //   child: InkWell(
      //     //     child: const Icon(
      //     //       Icons.cancel,
      //     //       color: Colors.blue,
      //     //       size: 20,
      //     //     ),
      //     //     onTap: () {
      //     //       print("object");
      //     //     },
      //     //   ),
      //     // ),
      //     CircleAvatar(
      //         backgroundColor: Colors.blue,
      //         radius: 64,
      //         child: CircleAvatar(
      //           backgroundImage: AssetImage('assets/images/avatar1.jpg'),
      //           radius: 60,
      //         )),
      //     Text(
      //       'alek',
      //       style: TextStyle(
      //         fontFamily: 'OpenSansBold',
      //         fontSize: 12.0,
      //         color: Colors.black,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
