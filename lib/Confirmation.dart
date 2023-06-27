import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class Confirmation extends StatefulWidget{
  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {

  Map ticketDetails = {};
  String phoneNumber = '';

  Future<void> send(String phone) async {
    twilioFlutter.sendSMS(
      toNumber: phone,
      messageBody: 'Dear customer, your ticket from ${ticketDetails['source']} to ${ticketDetails['destination']} is confirmed.Happy journey!!',
    );
  }

  final twilioFlutter = TwilioFlutter(
    accountSid: 'AC72978e95c60751395d9fb76139d26b4a',
    authToken: '2ab91745b33b91fadfb09813017de55b',
    twilioNumber: '+12176263059',
  );


  @override
  Widget build(BuildContext context) {
    ticketDetails = ModalRoute.of(context)!.settings.arguments as Map;

    final auth = FirebaseAuth.instance;
    // final userId = auth.currentUser!.uid;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ticket Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 175,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(border: Border.all(color: Colors.black54, width: 3.0), borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Source :\t\t\t\t${ticketDetails['source']}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Destination : \t\t\t\t${ticketDetails['destination']}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Fare :  \t\t\t\t\t₹${ticketDetails['fare']}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Tickets : \t\t\t\t${ticketDetails['tickets']}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Total Amount :\t\t\t\t₹${ticketDetails['total_amount']}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          phoneNumber = auth.currentUser!.phoneNumber!;
                        });
                        await send(phoneNumber);
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                      },
                      child: const Text('Confirm Tickets'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 