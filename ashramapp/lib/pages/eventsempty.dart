import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ASHRAM SAHAYAKA',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// text fields' controllers
  final TextEditingController _TitleController = TextEditingController();
  final TextEditingController _DescriptionController = TextEditingController();

  final CollectionReference _events =
      FirebaseFirestore.instance.collection('events');

  get controller => null;

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _TitleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _DescriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    final String Title = _TitleController.text;
                    final String Description = _DescriptionController.text;
                    if (Description != null) {
                      await _events
                          .add({"Title": Title, "Description": Description});

                      _TitleController.text = '';
                      _DescriptionController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _events.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Ashram Sahayaka Beta Events')),
        ),
        body: StreamBuilder(
          stream: _events.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];

                  return Card(
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
                  );

                  // return Card(
                  //   margin: const EdgeInsets.all(10),
                  //   child: ListTile(
                  //     title: Text(documentSnapshot['Title']),
                  //     subtitle:
                  //         Text(documentSnapshot['Description'].toString()),
                  //     trailing: SizedBox(
                  //       width: 100,
                  //       child: Row(
                  //         children: [
                  //           IconButton(
                  //               icon: const Icon(Icons.close),
                  //               onPressed: () => _delete(documentSnapshot.id)),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        // Add new product
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}

import 'package:flutter/material.dart';
class empty extends StatefulWidget {
  const empty({super.key});

  @override
  State<empty> createState() => _emptyState();
  
}
const double width = 300.0;
const double height = 60.0;
const double loginAlign = -1;
const double signInAlign = 1;

const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class _emptyState extends State<empty> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(),
        
          
 
        // backgroundColor: Colors.white,
        
        title: const Text('Meditate'),

         actions: [
       
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // handle search button press
            },
          ),
         
          PopupMenuButton(
     
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Settings'),
                  
                 
                  
                  value: 'settings',
                ),
                PopupMenuItem(
                  child: Text('About'),
                  value: 'about',
                ),
              ];
            },
            onSelected: (value) {
              // handle popup menu item selection
            },
          ),
        ],
      ),
      
      body: Center(
       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
             Container(
          width: 280,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: Alignment(xAlign, 0),
                duration: Duration(milliseconds: 250),
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
                  });
                },
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Container(
                    width: width * 0.5,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Upcoming Events',
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
                  });
                },
                child: Align(
                  alignment: Alignment(1, 0),
                  child: Container(
                    width: width * 0.5,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Past Events',
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
      
         


      Image.asset('lib/images/calender.png'),

      const SizedBox(
        height: 130.0,
        child: Text(
          'No Upcoming Events',
          style:TextStyle(fontSize:25,)
        ),
      )

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        
        color: Colors.white, // set the background color of the footer
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton( 
              icon: Icon(Icons.home),
              
              onPressed: () {
                // navigate to home page
              },
            ),
            IconButton(
              icon: Icon(Icons.event),
              onPressed: () {
                // navigate to event page 
              },
            ),
            IconButton(
              icon: Icon(Icons.volunteer_activism),
              onPressed: () {
                // navigate to volunteer page
              },
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // navigate to media page
              },
            ),
          ],
        ),
      ),
    );
  }
}