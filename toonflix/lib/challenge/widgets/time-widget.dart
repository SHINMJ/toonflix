
import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  final String text;
  
  const TimeWidget({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).cardColor,
            spreadRadius: 3,
          )
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).backgroundColor,
          fontSize: 80,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
