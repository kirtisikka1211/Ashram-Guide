import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ashramapp/pages/booking.dart';
import 'package:ashramapp/pages/darshan.dart';
import 'package:ashramapp/pages/eventsempty.dart';
import 'package:ashramapp/pages/home.dart';
import 'package:ashramapp/pages/volunteersignup.dart';
import 'package:ashramapp/pages/confirmation.dart';

class navhome extends StatefulWidget {
  const navhome({Key? key}) : super(key: key);

  @override
  State<navhome> createState() => _navhomeState();
}

class _navhomeState extends State<navhome> {
  late DateTime startDate;
  late DateTime endDate;
  int _index = 0;
  
Future<List<QueryDocumentSnapshot>> getEvents() async {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('events').get();
  return querySnapshot.docs;
}



  @override
  void initState() {
    super.initState();
    startDate = DateTime.now();
    endDate = DateTime.now();
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('home'),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'lib/images/house.jpg',
          height: 180,
          width: 320,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Upcoming Events',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder<List<QueryDocumentSnapshot>>(
            future: getEvents(),
            builder: (BuildContext context,
                AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final List<QueryDocumentSnapshot> documents = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: documents.length,
                itemBuilder: (BuildContext context, int index) {
                  final QueryDocumentSnapshot documentSnapshot =
                      documents[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
  elevation: 6, // to add shadow effect
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  child: Container(
    padding: const EdgeInsets.all(16),
    height: 120, // set the height of the card
    width: 280, // set the width of the card
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.schedule),
            SizedBox(width: 8),
            Text(
              ' ${documentSnapshot['Title']}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          ' ${DateTime.now().toString().substring(0, 10)} at 6pm',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          documentSnapshot['Description'],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

                ],
                
              ),
            ),
),
                  );
                },
              );
            },
          ),
          
        ),
         Card(
                    child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Your Text Here',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'lib/images/book.jpg',
                    height: 200,
                    width: 100,

                  ),
                ),
              ],
            ),

                  )
      ],
    ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ 
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const home()),
                    );
                  },
                ),
                const Text('Home'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [ 
                IconButton(
                  icon: const Icon(Icons.event),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                const Text('Event'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.volunteer_activism),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VolunteerPage()),
                    );
                  },
                ),
                const Text('Volunteer'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const darshan()),
                    );
                  },
                ),
                const Text('Darshan'),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final DateTimeRange? dateTimeRange = await showDateRangePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime(2024),
          );
          if (dateTimeRange != null) {
            setState(() {
              startDate = dateTimeRange.start;
              endDate = dateTimeRange.end;
            });

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmationPage(
                  startDate: startDate, 
                  endDate: endDate),
              ),
            );
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[300],
        tooltip: 'click to book',
        elevation: 5,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
