import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:game1/ColorCatch.dart';


class gameHome extends StatefulWidget {
  const gameHome({super.key});
  //assets/imgs/b1.png

@override
  State<gameHome> createState() {
    return _gameHome();
  }
}


class _BaseLayout extends State<BaseLayout> {

  @override
  Widget build(BuildContext context){  
    return Scaffold( 
      body: Directionality(
        textDirection: TextDirection.ltr, 
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          fit: StackFit.loose,
          children: [
            Container(
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/imgs/game1.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
            
            Positioned(
              top: 20, 
              left: 10, 
              child: IconButton(
          icon: const Icon(Icons.home),
          iconSize: 45, 
          color: const Color.fromARGB(255, 5, 47, 82),
          onPressed: () {
            //يروح للهوم بيج
            print('Icon button pressed!');
          },
        ),

            ),

           Positioned(
             
              left: 150,
              bottom: 110,  
              child:TextButton(
                style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 30),
              foregroundColor: Color.fromARGB(255, 5, 47, 82),
              //style:GoogleFonts.oswald//fontFamily: 'Oswald',
            ),
  onPressed: () {
    // Handle button press
   
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ColorCatch(),));
            
    print('Button pressed!');
  },
  child: Text('Start\ngame'),
),
             ),
            
          ],
        ),
      ),
    );
 
    

  }
}
