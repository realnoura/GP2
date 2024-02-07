import 'package:flutter/material.dart';
import 'package:hadq/almosa/wordwander.dart';
import 'package:hadq/almosa/instcr.dart';


class Menus extends StatelessWidget{
  const Menus({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 107, 221, 236),
      appBar:AppBar(
          backgroundColor: const Color.fromARGB(87, 186, 255, 255),
          automaticallyImplyLeading: false, // Remove the default leading widget
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 50),
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
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('asset/wordWander.png'),
                        fit: BoxFit.cover,
                        opacity: 0.9
                      ),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Center(
                      child: Text(
                        '1',
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
                        builder: (context) => const WordWander()));
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('asset/wordWander.png'),
                        fit: BoxFit.cover,
                        opacity: 0.9
                      ),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Center(
                      child: Text(
                        '2',
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
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('asset/wordWander.png'),
                        fit: BoxFit.cover,
                        opacity: .9
                      ),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Center(
                      child: Text(
                        '3',
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
        ),
    );
  }
}