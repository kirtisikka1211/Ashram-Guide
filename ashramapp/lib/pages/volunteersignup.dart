import 'package:flutter/material.dart';

class volsign extends StatelessWidget {
  const volsign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  "Volunteer",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            width: 380,

            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.event),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                labelText: 'Event Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            width: 380,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.timer),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                labelText: 'Timings',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            width: 380,

            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                labelText: 'Location',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
            width: 380,

            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                labelText: 'Description',
              ),
            ),
          ),
          Container(
            height: 90,
            width: 300,
            padding: const EdgeInsets.all(20),
            child: ElevatedButton.icon(
              icon: Icon(Icons.arrow_forward),
              label: Text('Register Event'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Colors.blue,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
