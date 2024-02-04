import 'package:flutter/material.dart';
import 'package:hadq/almosa/instcr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey, // Assign a GlobalKey to the Scaffold
      backgroundColor: const Color.fromARGB(255, 107, 221, 236),
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the default leading widget
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Hamburger menu icon
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Open drawer or navigate to menu screen
                _scaffoldKey.currentState?.openDrawer(); // Access Scaffold state using GlobalKey
              },
            ),
            // Your flexible space widget (image)
            Flexible(
              child: Center(
                child: Image.asset(
                  'asset/hadq.png',
                  fit: BoxFit.fitWidth,
                  width: 300, // Make the image take the full width of the app bar
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(width: 50), // Adjust as needed for spacing
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 64, 193, 210),
              ),
               child: Text('Hello Dear'),
            ),
            ListTile(
              title:const Text('Edit Account'),
              onTap: () {
                // Update UI based on item 1 selection
              },
            ),
            ListTile(
              title:const Text('Progress'),
              onTap: () {
                // Update UI based on item 2 selection
              },
            ),
            // Add more list items as needed
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const Instruction(),));
              },
              icon:const Icon(Icons.child_friendly),
              label:const Text('Word Wander'),
            ),
          ],
        ),
      ),
    );
  }
}
