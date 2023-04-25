import 'package:flutter/material.dart';

class MeditatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        
        title: const Text('Meditate'),

         actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // handle search button press
            },
          ),
        //   PopupMenuButton(
     
        //     itemBuilder: (BuildContext context) {
        //       return [
        //         PopupMenuItem(
        //           child: Text('Settings'),
                  
                 
                  
        //           value: 'settings',
        //         ),
        //         PopupMenuItem(
        //           child: Text('About'),
        //           value: 'about',
        //         ),
        //       ];
        //     },
        //     onSelected: (value) {
        //       // handle popup menu item selection
        //     },
        //   ),
        ],
      ),
      
      body: Center(
       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
         
           
        //     const SizedBox(height: 16.0),
        //     ElevatedButton(
        //       onPressed: () {
        //         // Start meditation session
        //       },
        //       child: const Text('Start Meditation'),
        //     ),
      Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Elevated Card')),
        ),
      ),
        Image.asset('lib/images/mediate.png'),
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
