import 'package:flutter/material.dart';
import 'package:hadq/almosa/homepage.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({Key? key}) : super(key: key);
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
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/cloudBackground .png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              color: const Color.fromARGB(255, 61, 169, 219).withOpacity(0.75),
              padding: const EdgeInsets.all(8),
              child: const Text(
                "Progress",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 248, 198, 134),
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 61, 169, 219).withOpacity(0.75),
              padding: const EdgeInsets.all(8),
              child: const Row(
                children: [
                  SizedBox(width: 70),
                  Text(
                    "Day",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 248, 198, 134),
                    ),
                  ),
                  SizedBox(width: 130),
                  Text(
                    "Score",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 248, 198, 134),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
