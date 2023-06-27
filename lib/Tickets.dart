import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  @override
  _Ticket createState() => _Ticket();
}

class _Ticket extends State<Ticket> {
  String selectedSource = 'Nagasandra';
  String selectedDestination = 'Majestic';
  int amount = 0;
  int ticketCount = 0;

  List<String> places = [ 'Nagasandra', 'Jalahalli', 'Yeshwantapura', 'Majestic'];


  Map<String, int> costs = {
    'Nagasandra-Majestic': 50,
    'Nagasandra-Banashankari': 60,
    'Nagasandra-Jalahalli': 20,
    'Nagasandra-Yeshwantapura': 30,
    'Jalahalli-Yeshwantapura': 20,
    'Jalahalli-Majestic': 40,
    'Yeshwantapura-Majestic': 20,
  };

  void incrementTicketCount() {
    setState(() {
      ticketCount++;
      amount = (costs['$selectedSource-$selectedDestination'] ?? costs['$selectedDestination-$selectedSource']) ?? 0;

    });
  }

  void decrementTicketCount() {
    if (ticketCount > 0) {
      setState(() {
        ticketCount--;
        amount = (costs['$selectedSource-$selectedDestination'] ?? costs['$selectedDestination-$selectedSource']) ?? 0;

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var source = places.map((e) {
      return DropdownMenuItem(
        value: e,
        child: Text(e),
      );
    }).toList();


    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Tickets'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Enter Source',style: TextStyle(fontSize: 15),),
            const SizedBox(height: 10,),
            DropdownButtonFormField<String>(
              value: selectedSource,
              onChanged: (value) {
                setState(() {
                  selectedSource = value!;
                });
              },

              items: source,
              icon: Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.blue[700],
              ),
              decoration: InputDecoration(
                // labelText: 'Enter Source',
                  labelStyle: const TextStyle( color: Colors.black54, fontWeight: FontWeight.w500),
                  prefixIcon: Icon(Icons.location_on, color: Colors.blue[700],),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.lightBlue, width: 3))
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Enter Destination',style: TextStyle(fontSize: 15),),
            const SizedBox(height: 10,),
            DropdownButtonFormField<String>(
              value: selectedDestination,
              onChanged: (value) {
                setState(() {
                  selectedDestination = value!;
                });
              },
              items: source,
              icon: Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.blue[700],
              ),
              decoration: InputDecoration(
                // labelText: 'Enter Destination',
                  labelStyle: const TextStyle( color: Colors.black54, fontWeight: FontWeight.w500),
                  prefixIcon: Icon(Icons.location_on, color: Colors.blue[700],),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.lightBlue, width: 3))
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              height: 70,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.black54, width: 1.0), borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon( CupertinoIcons.tickets_fill, color: Colors.blue[700],),
                      const SizedBox(width: 10,),
                      const Text('Tickets', style: TextStyle(fontSize: 16,),),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.remove, size: 20,),
                          onPressed: decrementTicketCount
                        ),
                        const SizedBox(width: 10.0,),
                        Text( "$ticketCount",
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        const SizedBox(width: 10.0,),
                        IconButton(
                          icon: const Icon(Icons.add, size: 20,),
                          onPressed: incrementTicketCount
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Total Fare Amount : ₹${amount * ticketCount}",
                    style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black45, width: 2.0), borderRadius:BorderRadius.circular(3)),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        amount = (costs['$selectedSource-$selectedDestination'] ?? costs['$selectedDestination-$selectedSource']) ?? 0;
                        Navigator.pushNamed(
                            context,
                            '/confirmation',
                            arguments: {
                              'source': selectedSource,
                              'destination': selectedDestination,
                              'tickets' : ticketCount,
                              'fare': amount,
                              'total_amount': ticketCount * amount,
                              }
                          );
                      });
                    },
                    child: const Text('Book Tickets')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
