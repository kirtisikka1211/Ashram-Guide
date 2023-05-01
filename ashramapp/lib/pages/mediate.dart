import 'package:ashramapp/pages/darshan.dart';
import 'package:ashramapp/pages/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'confirmation.dart';

class MeditatePage extends StatefulWidget {
  const MeditatePage({super.key});

  @override
  State<MeditatePage> createState() => _MeditatePageState();
}


const double width = 300.0;
const double height = 60.0;
const double loginAlign = -1;
const double signInAlign = 1;

const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class _MeditatePageState extends State<MeditatePage> {
  late double xAlign;

  late Color loginColor;
  late Color signInColor;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meditation'),
          actions: const [
            // IconButton(
            //   icon: Icon(Icons.search),
            //   onPressed: () {
            //     // Handle search icon press
            //   },
            // ),

            BackButton(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const Padding(padding: EdgeInsets.only(top: 66.0)),
              const Icon(Icons.account_circle, size: 100, color: Colors.blue),
              // const DrawerHeader(
              //   child: const Text(
              //     'Drawer Header',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 24,

              //     ),
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.blue,
              //     shape: BoxShape.rectangle,
              //   ),
              // ),
              const SizedBox.square(
                dimension: 30,
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Handle drawer item selection
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Logout'),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 280,
                height: 45,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                child: Stack(
                  children: [
                    AnimatedAlign(
                      alignment: Alignment(xAlign, 0),
                      duration: const Duration(milliseconds: 250),
                      child: Container(
                        width: 140,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 240, 240, 240),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = -0.9;
                          loginColor = selectedColor;

                          signInColor = normalColor;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const darshan()),
                          );
                        });
                      },
                      child: Align(
                        alignment: const Alignment(-1, 0),
                        child: Container(
                          width: width * 0.5,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: const Text(
                            'Darshan',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = 0.9;
                          signInColor = selectedColor;
                          loginColor = normalColor;
                          //  Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => MeditatePage()),
                          //     );
                        });
                      },
                      child: Align(
                        alignment: const Alignment(1, 0),
                        child: Container(
                          width: width * 0.5,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: const Text(
                            'Meditation',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //     const SizedBox(height: 16.0),
              //     ElevatedButton(
              //       onPressed: () {
              //         // Start meditation session
              //       },
              //       child: const Text('Start Meditation'),
              //
              //    ),

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.schedule),
                          SizedBox(width: 8),
                          Text(
                            'Next Shift',
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
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20.0),
              Image.asset('lib/images/mediate.png'),
            ],
          ),
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
                            MaterialPageRoute(
                                builder: (context) => const navhome()),
                          );
                      // navigate to home page
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
                      // navigate to event page
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
                      // navigate to volunteer page
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
                      // navigate to media page
                    },
                  ),
                  const Text('Media'),
                ],
              ),
            ],
          ),
        )
        );
  }
}
