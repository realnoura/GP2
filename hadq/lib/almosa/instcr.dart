import 'package:flutter/material.dart';
import 'package:hadq/almosa/menu.dart';
class Instruction extends StatelessWidget{
  const Instruction({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:const Color.fromARGB(255, 107, 221, 236),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Word Wander' ,style: TextStyle(fontSize: 45 ,fontFamily: AutofillHints.birthday),),
            const SizedBox(height: 16,),
            const Text('this game you have to do more than hala wallah and i told you about it' ,textAlign: TextAlign.center,),
            const SizedBox(height: 26,),
            ElevatedButton.icon(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const Menus(),));
            },
             icon:const Icon(Icons.not_started_outlined),
             label:const Text('start ya 7lo',style: TextStyle(fontSize: 25 )
              )
              )
          ],
        ),
      ),
    );
  }
}