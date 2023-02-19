import 'package:chatflutter/screen/chat/chat_screen.dart';
import 'package:chatflutter/screen/chat/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatflutter/models/chatMessageModel.dart';
import 'package:chatflutter/screen/auth/profile_screen.dart';
import 'package:chatflutter/screen/auth/login_screen.dart';
import 'package:chatflutter/components/conversationList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
