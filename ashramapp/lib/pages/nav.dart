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
