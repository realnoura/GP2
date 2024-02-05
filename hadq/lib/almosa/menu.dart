import 'package:flutter/material.dart';
import 'package:hadq/almosa/wordwander.dart';

class Menus extends StatelessWidget{
  const Menus({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 107, 221, 236),
      appBar:  AppBar(
        automaticallyImplyLeading: false, // Remove the default leading widget
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Center(
                child: Image.asset(
                  'asset/hadq.png',
                  fit: BoxFit.fitWidth,
                  width: 300, 
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(width: 50), 
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => WordWander(),));
            },
             child:const Text(
              '1' ,
              style: TextStyle(
                fontSize: 35,
            ),
            ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(onPressed: (){},
             child:const Text(
              '2' ,
              style: TextStyle(
                fontSize: 35,
            ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}