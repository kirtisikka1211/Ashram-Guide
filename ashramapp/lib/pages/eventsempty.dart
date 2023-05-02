import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// text fields' controllers
  final TextEditingController _TitleController = TextEditingController();
  final TextEditingController _DescriptionController = TextEditingController();
  final TextEditingController _LocationController = TextEditingController();
  final TextEditingController _DateTimeController = TextEditingController();

  final CollectionReference _events =
      FirebaseFirestore.instance.collection('Programs');

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
                TextField(
                  controller: _LocationController,
                  decoration: const InputDecoration(
                    labelText: 'Location',
                  ),
                ),
                TextField(
                  controller: _DateTimeController,
                  decoration: const InputDecoration(
                    labelText: 'Date And Time',
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
                    final String Location = _LocationController.text;
                    final String DateTime = _DateTimeController.text;
                    if (Description != null) {
                      await _events.add({
                        "Title": Title,
                        "Description": Description,
                        "Location": Location,
                        "DateTime": DateTime
                      });

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
          title: const Center(
              child: Text(
            'Events',
            style: TextStyle(
              fontFamily: "Changa",
            ),
          )),
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
                    margin: const EdgeInsets.all(14),
                    color: Colors.deepOrange.shade100,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  ' ${documentSnapshot['Title']}',
                                  style: TextStyle(
                                    fontFamily: 'FrancoisOne-Regular',
                                    fontSize: 26,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () =>
                                        _delete(documentSnapshot.id)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              ' ${documentSnapshot['DateTime']}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 25),
                            Text(
                              documentSnapshot['Description'],
                              style: GoogleFonts.jost(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5),
                            ),
                          ]),
                    ),
                  );
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