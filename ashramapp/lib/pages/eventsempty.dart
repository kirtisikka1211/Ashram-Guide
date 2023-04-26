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