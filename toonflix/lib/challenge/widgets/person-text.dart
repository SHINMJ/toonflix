import 'package:flutter/material.dart';

class PersonText extends StatelessWidget {
  final String text;
  final bool isMe;

  const PersonText({super.key, required this.text, this.isMe = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        color: isMe ? Colors.black : Colors.black.withOpacity(0.4),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
