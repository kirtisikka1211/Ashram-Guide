import 'package:flutter/material.dart';
class MeditatePage extends StatefulWidget {
  const MeditatePage({super.key});

  @override
  _MeditatePageState createState() => _MeditatePageState();
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
        
             Container(
          width: 300,
          height: 60,
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
                duration: Duration(milliseconds: 300),
                child: Container(
                  width: 140,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
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
                  });
                },
                child: Align(
                  alignment: Alignment(1, 0),
                  child: Container(
                    width: width * 0.5,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
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
            const SizedBox(height: 100.0),
      const Card(
        child: SizedBox(
          width: 340,
          height: 120,
          child: Center(child: Text('Elevated Card')),
        ),
      ),
      const SizedBox(height: 20.0),
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
