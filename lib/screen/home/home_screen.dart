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
        leading: PopupMenuButton(
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          color: Colors.white, // color setting

          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text(
                "Home",
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("Shop"),
              value: 2,
            ),
            PopupMenuItem(
              child: Text("Loan"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("Investments"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("Payment"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("Vouchers"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("Merchant"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("Supervisor"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("invoice"),
              value: 1,
            ),
            PopupMenuItem(
              child: Text("ICO"),
              value: 1,
            ),
          ],
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
                color: Colors.transparent, shape: BoxShape.rectangle),
            child: PopupMenuButton(
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(20), // Image radius
                  child: Image.network(
                      'http://wh.saas.test/geniusBankWallet/assets/user/img/user.jpg',
                      fit: BoxFit.cover),
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
                  child: Text("Chat"),
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
                  child: Text("Logout"),
                  value: 1,
                ),
              ],
            ),
          )
        ],
      ),
      body: DashboardWidget(),
    );
  }
}
