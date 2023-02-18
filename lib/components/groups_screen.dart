import 'package:flutter/material.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
          child: Text(
        'Click here for more info',
        style: TextStyle(color: Colors.blue, fontSize: 20.0),
      )),
    );
  }
}
