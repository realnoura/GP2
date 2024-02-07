import 'dart:async';
import 'package:flutter/material.dart';

class WordWander extends StatefulWidget {
  const WordWander({Key? key}) : super(key: key);

  @override
  State<WordWander> createState() => _WordWanderState();
}

class _WordWanderState extends State<WordWander> {
  late int _secondsElapsed;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _secondsElapsed = 0;
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
      });

      // Check if 2 minutes have passed
      if (_secondsElapsed >= 10) {
        _timer.cancel(); // Stop the timer
        _showTimeTaken(); // Show the popup alert
      }
    });
  }

  String _formattedTimer() {
    Duration duration = Duration(seconds: _secondsElapsed);
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _showTimeTaken() {
    Duration duration = Duration(seconds: _secondsElapsed);
    int minutes = duration.inMinutes;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text('Time Taken'),
          content: Text('You took $minutes minutes.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 107, 221, 236),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Level 1',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            const SizedBox(width: 18),
            Text(_formattedTimer()),
          ],
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 750,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Colors.white70),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello Buddy',
                  style: TextStyle(
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
