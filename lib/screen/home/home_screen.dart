import 'package:chatflutter/models/wallet_model.dart';
import 'package:chatflutter/screen/auth/login_screen.dart';
import 'package:chatflutter/screen/chat/chat_screen.dart';
import 'package:chatflutter/service/api.dart';
import 'package:flutter/material.dart';
import 'package:chatflutter/models/transaction_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  var data;
  String? imageUrl;
  List<WalletModel> wallets = [];
  List<TransactionModel> transactions = [];
  late double userBalance;
  String dropdownValue = 'EUR';
  String? userBal;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    _apiService.getData().then((value) {
      setState(() {
        data = value!;
        imageUrl = data.user!.photo;
        userBalance = data.userBalance!;
        wallets = data.wallets!;
        transactions = data.transactions!;
        userBal = userBalance.toInt().toString();
        print(transactions[0].createdAt);
      });
    });
  }

  void logout() {
    _apiService.logout().then((value) {});
  }

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
            padding: const EdgeInsets.all(8), // Border width
            decoration: const BoxDecoration(
                color: Colors.transparent, shape: BoxShape.rectangle),
            child: PopupMenuButton(
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(20), // Image radius
                  child: Image.network((imageUrl == null || imageUrl == "")
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
                          MaterialPageRoute(builder: (context) => ChatScreen()),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Card(
                  elevation: 8,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(64, 75, 96, 0.9)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      leading: Container(
                        padding: const EdgeInsets.only(right: 12),
                        height: 230,
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) =>
                                      Color.fromRGBO(238, 218, 216, 1)),
                            ),
                            onPressed: () {},
                            child: const Icon(
                              Icons.money_outlined,
                              size: 24.0,
                              color: Color.fromARGB(187, 244, 67, 54),
                            )),
                      ),
                      title: const Text(
                        "AVAILABLE BALANCE",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Column(
                            children: [
                              DropdownButton<String>(
                                value: dropdownValue,
                                items: <String>[
                                  'USD',
                                  'EUR',
                                  'GBP',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black54),
                                    ),
                                  );
                                }).toList(),
                                // Step 5.
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                              ),
                              Text(
                                // userBalance!.toInt().toString(),
                                userBal ?? "...",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                height: 50,
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Wallet list",
                          style: TextStyle(
                            fontFamily: 'OpenSansBold',
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                            size: 15,
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          label: const Text(
                            'Create Wallet',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Container(
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: wallets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 8,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(64, 75, 96, 0.9)),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          leading: Container(
                            padding: const EdgeInsets.only(right: 12),
                            height: 230,
                            child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty
                                      .resolveWith((states) =>
                                          Color.fromARGB(255, 140, 188, 226)),
                                ),
                                onPressed: () {},
                                child: const Icon(
                                  Icons.euro_outlined,
                                  size: 18.0,
                                  color: Colors.blue,
                                )),
                          ),
                          title: const Text(
                            "CURRENT",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'OpenSansBold',
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    wallets[index].walletNo.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontFamily: 'OpenSansBold',
                                    ),
                                  ),
                                  Text(
                                    '${wallets[0].balance} ${wallets[0].currency!.code}',
                                    style: const TextStyle(
                                        color: Colors.white30, fontSize: 14),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                color: Colors.white30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: const Text(
                                "Crypto Wallet list",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: 'OpenSansBold',
                                ),
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                                size: 15,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue)),
                              label: const Text(
                                'Create Crypto Wallet',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: const Text(
                            'NO Crypto Wallet FOUND',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              const Divider(
                color: Colors.white30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Bank Account list",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'OpenSansBold',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "NO Bank Account FOUND",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              const Divider(
                color: Colors.white30,
              ),
              Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 8,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(64, 75, 96, 0.9)),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          leading: Container(
                            padding: const EdgeInsets.only(right: 12),
                            height: 230,
                            child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty
                                      .resolveWith((states) =>
                                          Color.fromARGB(255, 165, 230, 167)),
                                ),
                                onPressed: () {},
                                child: const Icon(
                                  Icons.currency_pound,
                                  size: 18.0,
                                  color: Colors.green,
                                )),
                          ),
                          title: const Text(
                            "0",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    "Deposits",
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 14),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(64, 75, 96, 0.9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(2.0, 2.0),
                      ),
                    ]),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Your Referral Link",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText:
                                  "http://wh.saas.test/geniusBankWallet?reff=e89296b53b13ae2313c2879824d15c27",
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.yellow),
                                borderRadius: BorderRadius.circular(80),
                              ),
                              suffixIcon: FloatingActionButton(
                                child: Icon(
                                  Icons.copy,
                                  size: 20,
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 241, 198, 6),
                                foregroundColor: Colors.white,
                                onPressed: () => {},
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(64, 75, 96, 0.9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(2.0, 2.0),
                      ),
                    ]),
                margin: const EdgeInsets.only(top: 6, left: 10, right: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          "Recent Transaction",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: transactions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(64, 75, 96, 0.9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                            offset: Offset(2.0, 2.0),
                          ),
                        ]),
                    margin: const EdgeInsets.only(top: 0, left: 10, right: 10),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                    vertical: 20,
                                    horizontal: 10,
                                  ),
                                ),
                                Text(
                                  "NO",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                    vertical: 20,
                                    horizontal: 10,
                                  ),
                                ),
                                Text(
                                  "DATE",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  transactions[index]
                                      .createdAt
                                      .substring(0, 10),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                    vertical: 20,
                                    horizontal: 10,
                                  ),
                                ),
                                Text(
                                  "TRANSACTION ID",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  transactions[index].trnx,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                    vertical: 20,
                                    horizontal: 10,
                                  ),
                                ),
                                Text(
                                  "REMARK",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  transactions[index].remark,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                    vertical: 20,
                                    horizontal: 10,
                                  ),
                                ),
                                Text(
                                  "AMOUNT",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  '- ${transactions[index].amount.substring(0, 4)}',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                    vertical: 20,
                                    horizontal: 10,
                                  ),
                                ),
                                Text(
                                  "DETAILS",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Spacer(),
                                Text(
                                  transactions[index].details,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        )),
                  );
                },
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   decoration: const BoxDecoration(color: Colors.blue),
              //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              //   height: 500,
              //   alignment: Alignment.center,
              //   child: const Padding(
              //     padding: EdgeInsets.symmetric(
              //       vertical: 10,
              //       horizontal: 10,
              //     ),
              //     child: Text(
              //       "Footer",
              //       style: TextStyle(fontSize: 16, color: Colors.white),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
