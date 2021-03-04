import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DetailsPage extends StatefulWidget {
  final foodName;
  final foodPrice;

  DetailsPage({this.foodName, this.foodPrice});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = 'PLAN 1';

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF7A9BEE),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('PROFILE',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30.0,
                  color: Colors.white)),
          centerTitle: true,
        ),
        body: ListView(children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: 90.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width)),
            Center(
              child: Positioned(
                  top: 30.0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/profile.jpg"),
                    radius: 60,
                  )),
            ),
            Positioned(
                top: 170.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("USER NAME",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Container(
                      child: Text("MOBILE NUMBER",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                              color: Colors.grey)),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      height: 130.0,
                      width: double.maxFinite,
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(22.0),
                                topRight: Radius.circular(22.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                            color: Colors.black.withOpacity(1),
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 0.75),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Text("  BALANCE",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellowAccent
                                            .withOpacity(0.8),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 230, bottom: 15),
                                  child: Text("₹300",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 35.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ])),
                    ),
                    SizedBox(width: 20.0),
                    Container(
                        height: 40.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                        )),
                    Container(
                        height: 100.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildInfoCard("Plan 1", '50/-'),
                            SizedBox(width: 10.0),
                            _buildInfoCard("Plan 2", '100/-'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('Plan 3', '200/-'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('Plan 4', '500/-')
                          ],
                        )),
                    SizedBox(
                      height: 45,
                    ),
                    Center(
                      child: Container(
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RaisedButton(
                              onPressed: () {
                                print("TOP UP");
                              },
                              splashColor: Color(0xFF7A9BEE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(35),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              color: Colors.black,
                              child: Container(
                                height: 60,
                                width: 138,
                                child: Center(
                                  child: Text('TOP UP',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: 'Montserrat')),
                                ),
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {
                                print("Sign Out");
                              },
                              splashColor: Color(0xFF7A9BEE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(35),
                                ),
                              ),
                              color: Colors.black,
                              child: Container(
                                height: 60,
                                width: 138,
                                child: Center(
                                  child: Text('SIGN OUT',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: 'Montserrat')),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ]),
        ]));
  }

  Widget _buildInfoCard(String cardTitle, String rate) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color:
                  cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            height: 50.0,
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          color: cardTitle == selectedCard
                              ? Colors.white
                              : Colors.grey.withOpacity(0.7),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(rate,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 25.0,
                                color: cardTitle == selectedCard
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ])));
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
