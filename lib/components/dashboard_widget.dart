import 'package:flutter/material.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
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
                margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, 0.9)),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(
                        Icons.money,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
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
                            Icon(
                              Icons.linear_scale,
                              color: Colors.yellowAccent,
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
              decoration: BoxDecoration(color: Colors.white),
              margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              height: 50,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Text(
                  "wallet list",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
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
                        new EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, 0.9)),
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(
                            Icons.money,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
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
                                Icon(
                                  Icons.linear_scale,
                                  color: Colors.yellowAccent,
                                ),
                                Text(
                                  "€6777.73",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
            Divider(
              color: Colors.white30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              height: 100,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Text(
                  "Crypto Wallet list",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
            Divider(
              color: Colors.white30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              height: 100,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Text(
                  "Bank Account list",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
            Divider(
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
                    margin:
                        new EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, 0.9)),
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(
                            Icons.money,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
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
                                Icon(
                                  Icons.linear_scale,
                                  color: Colors.yellowAccent,
                                ),
                                Text(
                                  "€6777.73",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
              decoration: BoxDecoration(color: Colors.yellow),
              margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              height: 100,
              alignment: Alignment.center,
              child: Padding(
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
              decoration: BoxDecoration(color: Colors.red),
              margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              height: 500,
              alignment: Alignment.center,
              child: Padding(
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
              decoration: BoxDecoration(color: Colors.blue),
              margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              height: 500,
              alignment: Alignment.center,
              child: Padding(
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
