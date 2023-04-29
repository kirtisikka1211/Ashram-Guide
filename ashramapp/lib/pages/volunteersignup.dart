import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({Key? key}) : super(key: key);

  @override
  _VolunteerPageState createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
// text fields' controllers
  final TextEditingController _TitleController = TextEditingController();
  final TextEditingController _DescriptionController = TextEditingController();
  final TextEditingController _LocationController = TextEditingController();
  final TextEditingController _DateController = TextEditingController();

  final CollectionReference _volunteer =
      FirebaseFirestore.instance.collection('Volunteering');

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
                  decoration: const InputDecoration(labelText: 'Location'),
                ),
                TextField(
                  controller: _DateController,
                  decoration: const InputDecoration(labelText: 'Date and Time'),
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
                    final String Time = _DateController.text;
                    if (Description != null) {
                      await _volunteer.add({
                        "Title": Title,
                        "Description": Description,
                        "Location": Location,
                        "Time": Time,
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
    await _volunteer.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  //The actual listview of the app

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Ashram Sahayaka Beta Events')),
        ),
        body: StreamBuilder(
          stream: _volunteer.snapshots(),
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
                              const Icon(Icons.schedule),
                              const SizedBox(width: 8),
                              Text(
                                ' ${documentSnapshot['Title']}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            ' ${DateTime.now().toString().substring(0, 10)} at ${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          FittedBox(
                              child: Text(
                            documentSnapshot['Description'],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            maxLines: 50,
                            overflow: TextOverflow.ellipsis,
                          )),
                          IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => _delete(documentSnapshot.id)),
                        ],
                      ),
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
