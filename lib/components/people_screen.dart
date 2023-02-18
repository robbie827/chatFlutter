import 'package:flutter/material.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'FAVORITES',
              style: TextStyle(fontSize: 15.0, color: Colors.grey),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 33,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar1.jpg'),
                      radius: 30,
                    )),
                // child: Text(
                //   'Robbie',
                //   style: TextStyle(fontSize: 20.0),
                // )
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 33,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar1.jpg'),
                      radius: 30,
                    )),
                // child: Text(
                //   'Robbie',
                //   style: TextStyle(fontSize: 20.0),
                // )
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 33,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/Florian.jpg'),
                      radius: 30,
                    )),
                // child: Text(
                //   'Robbie',
                //   style: TextStyle(fontSize: 20.0),
                // )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    left: 30, bottom: 10, right: 15, top: 20),
                child: const Icon(Icons.bookmark_border_rounded,
                    size: 30, color: Colors.blue),
              ),
              Container(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 10, top: 3, bottom: 1),
                    child: Text(
                      'Saved Messages',
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 10, top: 3, bottom: 1),
                    child: Text(
                      'Save Messages Secretly',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                ],
              )),
            ],
          )
        ],
      ),
    );
  }
}
