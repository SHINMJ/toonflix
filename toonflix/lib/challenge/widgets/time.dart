import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  final String hour;
  final String minute;

  const Time({super.key, required this.hour, required this.minute});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          hour,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          minute,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
