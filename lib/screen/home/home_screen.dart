import 'package:chatflutter/components/dashboard_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: IconButton(
          icon: Image.network(
              'http://wh.saas.test/geniusBankWallet/assets/images/GZrLGJFQ1674480311.jpg'),
          onPressed: () {},
        ),
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 1),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.dark_mode_outlined,
                  size: 24,
                  color: Colors.black,
                ),
              )),
          Container(
            padding: EdgeInsets.all(8), // Border width
            decoration: BoxDecoration(
                color: Colors.transparent, shape: BoxShape.circle),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(15), // Image radius
                child: Image.network(
                    'http://wh.saas.test/geniusBankWallet/assets/user/img/user.jpg',
                    fit: BoxFit.cover),
              ),
            ),
          )
        ],
      ),
      body: DashboardWidget(),
    );
  }
}
