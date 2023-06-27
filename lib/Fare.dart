import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fare extends StatefulWidget {
  @override
  _Fare createState() => _Fare();
}

class _Fare extends State<Fare> {
  String selectedSource = 'Nagasandra';
  String selectedDestination = 'Majestic';
  bool isPressed = false;
  int amount = 0;

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
        title: const Text('Find Fare'),
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
                  isPressed = false;
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
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(3), borderSide: const BorderSide(color: Colors.lightBlue, width: 3))
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
                  isPressed = false;
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
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(3), borderSide: const BorderSide(color: Colors.lightBlue, width: 3))
              ),
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        isPressed = true;
                        amount = (costs['$selectedSource-$selectedDestination'] ?? costs['$selectedDestination-$selectedSource']) ?? 0;
                      });
                    },
                    child: const Text('Calculate Fare')),
              ],
            ),
            const SizedBox(height: 16,),
            if(isPressed)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Fare Amount : ₹${amount}",
                      style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    // decoration: BoxDecoration(border: Border.all(color: Colors.black45, width: 2.0), borderRadius:BorderRadius.circular(3)),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
