import 'package:flutter/material.dart';
import 'package:hadq/almosa/instcr.dart';
import 'package:hadq/almosa/welcome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _showLogoutSentPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Icon(Icons.logout),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomePage()),
                    );
                  },
                  child: const Text('Logout'),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(87, 186, 255, 255),
          automaticallyImplyLeading: false, // Remove the default leading widget
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Hamburger menu icon
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  // Open drawer or navigate to menu screen
                  scaffoldKey.currentState
                      ?.openDrawer(); // Access Scaffold state using GlobalKey
                },
              ),
              // Your flexible space widget (image)
              Flexible(
                child: Center(
                  child: Image.asset(
                    'asset/hadq.png',
                    fit: BoxFit.fitWidth,
                    width:
                        300, // Make the image take the full width of the app bar
                    alignment: Alignment.center,
                  ),
                ),
              ),
              const SizedBox(width: 50), // Adjust as needed for spacing
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(162, 64, 193, 210),
                ),
                child: Text('Hello Dear'),
              ),
              ListTile(
                leading: const Icon(Icons.account_box),
                title: const Text('Edit Account'),
                onTap: () {
                  // Update UI based on item 1 selection
                },
              ),
              ListTile(
                leading: const Icon(Icons.leaderboard),
                title: const Text('Progress'),
                onTap: () {
                  // Update UI based on item 2 selection
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('log out'),
                onTap: () {
                  _showLogoutSentPopup(context);
                  // Update UI based on item 2 selection
                },
              ),
              // Add more list items as needed
            ],
          ),
        ), // Assign a GlobalKey to the Scaffold
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/cloudBackground .png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle button tap here
                  },
                  child: Container(
                    width: 300,
                    height: 120,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('asset/eye-Trail.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Eye Trail',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 200,
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Instruction()));
                  },
                  child: Container(
                    width: 300,
                    height: 120,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('asset/wordWander.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Word Wander',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 200,
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    //add the page
                  },
                  child: Container(
                    width: 300,
                    height: 120,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('asset/colorCatch.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Color Catch',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
