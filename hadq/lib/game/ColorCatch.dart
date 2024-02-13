import 'dart:math';
import 'package:flutter/material.dart';

class ColorCatch extends StatefulWidget  {
  @override
  _ColorCatch createState() => _ColorCatch();
}
bool gamedone=false;
class _ColorCatch extends State<ColorCatch> {
  //timer
  final Stopwatch _stopwatch = Stopwatch();
  Stream<int>? _timerStream;
  bool _isRunning = true; // Timer starts automatically
  String timeSpended="";

  int score = 0;
  int fourobj=0;
  int nextcolor=0;
 Color currentColor = Color.fromRGBO(94, 187, 227, 100); // Start with red
  List<Color> colors = List.generate(16, (index) => [Color.fromRGBO(94, 187, 227, 100), Color.fromRGBO(91, 178, 60, 0.612), Color.fromRGBO(243, 140, 140, 0.612), Color.fromRGBO(242, 155, 24, 100)][index % 4]); // Replace with your icons
  List<IconData> icons = List.generate(16, (index) =>   [Icons.cake_sharp, Icons.sailing_rounded, Icons.cloud, Icons.tag_faces_rounded][index % 4]);
  List<bool> clicked = List.generate(16, (index) => false);
 List<Color> basicColors =[Color.fromRGBO(94, 187, 227, 100), Color.fromRGBO(91, 178, 60, 0.612), Color.fromRGBO(243, 140, 140, 0.612), Color.fromRGBO(242, 155, 24, 100)];// اخلي لست الالوان الي مطلون انه يضغطها ثابته و العب في ترتيب و اماكن الايكونز
  List<String> basicColorsNames=["Blue","Green","Pink","Orange"];
  @override


  void initState() {
    colors.shuffle(Random());
    icons.shuffle();
    _startTimer();
    super.initState();
  }
  
  void _startTimer() {
    _stopwatch.start();
    _timerStream = Stream.periodic(const Duration(seconds: 1), (count) {
      return _stopwatch.elapsed.inSeconds;
    });
  }

  void _pauseTimer() {
    setState(() {
      _isRunning = false;
      _stopwatch.stop();
    });
  }

  void _resumeTimer() {
    setState(() {
      Navigator.pop(context);
      _isRunning = true;
      _stopwatch.start();
    });
  }

  @override
  Widget build(BuildContext context) {

  

    return Scaffold(

     
      body: Directionality(
        
        textDirection: TextDirection.ltr, 
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          fit: StackFit.loose,
          
          children: [
            Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          //image: AssetImage('assets/imgs/b2.png'),
          image: AssetImage('assets/imgs/game2.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),

    

        Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: <Widget>[
          

          SafeArea(
            child: Container(
              height: 85,
              color: Color.fromRGBO(87, 186, 255, 1),
              child: Row(
                
                
              
                children: [
                   Container(
                      //alignment:Alignment.topLeft ,
                         margin: EdgeInsets.only(top: 20,bottom: 0,right: 20),
                        //height: 50,
                        child: 
                        
                        IconButton(
                                  icon: const Icon(Icons.home),
                                  iconSize: 45, 
                                  color: Color.fromRGBO(5, 47, 82, 1),
                                  onPressed: () {
                                    //يروح للهوم بيج
                                    print('Icon button pressed!');
                                  },
                                ),                 
                                 ),
              
                       Container(
                         child: Text('Current color: ${basicColorsNames[nextcolor]}  ',
                                  style: TextStyle(fontSize: 24),            //ممكن الوقت بدل السكور
                                  ),
                       ),
              
                      
              
                       Expanded(
                                  child: Container(
                                    child: StreamBuilder<int>(
                                    stream: _timerStream,
                                    builder: (context, snapshot) {
                                      final elapsedSeconds = snapshot.data ?? 0;
                                      final hours = elapsedSeconds ~/ 3600;
                                      final minutes = (elapsedSeconds % 3600) ~/ 60;
                                      final seconds = elapsedSeconds % 60;
                                       timeSpended='${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
                                                  
                                      return Text(
                                                  '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                      );
                                    },
                                                              ),
                                  ),
                                ),
              
                ],
              ),
            ),
          ),

         
            
            
          SizedBox(
            child: Container(
              height: 450,
              alignment: Alignment.center,
                margin: EdgeInsets.only(right: 5,left: 5,bottom: 10,top: 30),
              child: GridView.count(
                crossAxisCount: 4,
                 physics:NeverScrollableScrollPhysics(),
                children: List.generate(16, (index) {
                  Color choosencolor=colors[index];//الي ضغطه اليوزر
                  return IconButton(
                    icon: Icon(icons[index], color: colors[index] ),
                    iconSize: 40,
                    //Color choosencolor=colors[index];
                    onPressed: () {
                       setState(() {
                          fourobj++;
                          
                          if (choosencolor == basicColors[nextcolor] && !clicked[index]) {//currentColor
                          clicked[index] = true;
                          score++;
                          
                          }
                          if(fourobj%4==0 && fourobj!=16 ){//نغير اللون
                            nextcolor++;
                          
                          }
                          
                        });
                      
                      if(fourobj==16){
                        _pauseTimer();
                        showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('      Good job!\n You Got $score/16 \n your time is $timeSpended',
                  style: TextStyle(
                     color: Color.fromARGB(255, 5, 47, 82),
                        ),),
                  backgroundColor: Color.fromRGBO(240, 191, 116, 1),
                  actions: [
                    
                    
                         SizedBox(width: 35),
                    
                    ElevatedButton(
                  onPressed: () => {
                    //يروح للهوم بيج
                  },
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(242, 155, 24, 100), // Or your preferred color
                    foregroundColor: const Color.fromARGB(255, 5, 47, 82),// Or your preferred color
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Rounded corners
                    elevation: 5, // Shadow effect
                  ),
                  child:const  Text('exit'),
                ),
                  ],
                ),
              );//showDialog
              
              
              
                    
                      }
                    },
                  );
                }),
              ),
            ),
          ),

          //SizedBox(height: 40,),

          SizedBox(
  child: Container(
    //height: 90,
    margin:const EdgeInsets.only(top: 10 ,right:85 ),
    alignment: Alignment.bottomCenter,
    child: TextButton(
                    style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 30),
                  foregroundColor: Color.fromARGB(255, 5, 47, 82),
                  alignment: Alignment.centerLeft,
                  //style:GoogleFonts.oswald
                ),
                child: Text('Pouse\ngame'),
                onPressed: () {
                   _pauseTimer();
        // Handle button press
                 showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title:const Text('      Game paused!',
                style: TextStyle(
                   color: Color.fromARGB(255, 5, 47, 82),
                      ),),
                backgroundColor: Color.fromRGBO(240, 191, 116, 1),
                actions: [
                  
                  ElevatedButton(
    onPressed: () =>  _resumeTimer(),
    
    
    style: ElevatedButton.styleFrom(
      backgroundColor:const Color.fromRGBO(242, 155, 24, 100), // Or your preferred color
      foregroundColor:const  Color.fromARGB(255, 5, 47, 82), // Or your preferred color
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Rounded corners
      elevation: 5, // Shadow effect
    ),
    child:const Text('Continue'),
  ),
           SizedBox(width: 35),
                  
                  ElevatedButton(
    onPressed: () => {
      //يروح للهوم بيج
    },
    
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromRGBO(242, 155, 24, 100), // Or your preferred color
      foregroundColor: const Color.fromARGB(255, 5, 47, 82),// Or your preferred color
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Rounded corners
      elevation: 5, // Shadow effect
    ),
    child:const  Text('exit'),
  ),
                ],
              ),
            );
                  print('Button rrrpressed!');
      },
    ),
  ),
),

        ],
      ),
   
//       
 ]
        )
        )
    );
  }
 }
