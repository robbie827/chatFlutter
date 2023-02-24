import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'USD';
    return Padding(
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
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Color.fromRGBO(238, 218, 216, 1)),
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
                              "€6777.73",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
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
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 8,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) =>
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
                              children: const [
                                Text(
                                  "MONE123232018111",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'OpenSansBold',
                                  ),
                                ),
                                Text(
                                  "68 EUR",
                                  style: TextStyle(
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
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 8,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) =>
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
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Colors.yellow),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              height: 100,
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Text(
                  "Your Referral Link",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Colors.red),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              height: 500,
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Text(
                  "Recent Transaction",
                  style: TextStyle(fontSize: 16, color: Colors.yellow),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Colors.blue),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              height: 500,
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Text(
                  "Footer",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
