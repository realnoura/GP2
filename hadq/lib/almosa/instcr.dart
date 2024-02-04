import 'package:flutter/material.dart';

class Instruction extends StatelessWidget{
  const Instruction({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 107, 221, 236),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Word Wander' ,style: TextStyle(fontSize: 45 ,fontFamily: AutofillHints.birthday),),
            const SizedBox(height: 16,),
            const Text('this game you have to do more than hala wallah and i told you about it' ,textAlign: TextAlign.center,),
            const SizedBox(height: 26,),
            ElevatedButton.icon(onPressed: (){}, icon:const Icon(Icons.start_rounded), label:const Text('start ya 7lo',style: TextStyle(fontSize: 25 )))
          ],
        ),
      ),
    );
  }
}