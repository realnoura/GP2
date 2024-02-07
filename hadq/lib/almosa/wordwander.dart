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
    });
  }

  String _formattedTimer() {
    Duration duration = Duration(seconds: _secondsElapsed);
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 107, 221, 236),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Level 1'),
            const SizedBox(width: 10),
            Text(_formattedTimer()),
          ],
        ),
      ),
      body: const Center(
        child: SizedBox(
          width: 400,
          height: 750,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'هذا الكلام اللي توقعته ممكن يصير ',
                  style: TextStyle(fontSize: 35),
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
