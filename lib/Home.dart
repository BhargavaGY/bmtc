import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMTC'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
                'images/bmtc_image.jpg', // Replace with your image path
                fit: BoxFit.fill
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide( color: Colors.lightBlueAccent, width: 3)
                  ),
                  elevation: 5,
                  shadowColor: Colors.white,
                  child: Container(
                    height: 75,
                    width: 175,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(
                        CupertinoIcons.person_alt_circle,
                        size: 25,
                        color: Colors.blue,
                      ),
                      title: Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      onTap: () {
                        // Handle shopping card tap
                        Navigator.pushNamed(context, '/login');
                        setState(() {
                        });
                      },
                    ),
                  ),

                ),
                SizedBox(height: 16.0),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide( color: Colors.lightBlueAccent, width: 3)
                  ),
                  elevation: 5,
                  shadowColor: Colors.white,
                  child: Container(
                    height: 75,
                    width: 175,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(
                        CupertinoIcons.tickets_fill,
                        size: 25,
                        color: Colors.blue,
                      ),
                      title: Text(
                        'QR Tickets',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      onTap: () {
                        // Handle shopping card tap
                        print('QR Ticket');
                      },
                    ),
                  ),

                ),
                SizedBox(height: 16.0),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide( color: Colors.lightBlueAccent, width: 3)
                  ),
                  elevation: 5,
                  shadowColor: Colors.white,
                  child: Container(
                    height: 75,
                    width: 175,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(
                        Icons.currency_rupee,
                        size: 25,
                        color: Colors.blue,
                      ),
                      title: Text(
                        'Find Fare',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      onTap: () {
                        // Handle shopping card tap
                        print('Fare');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}