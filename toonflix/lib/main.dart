import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/widgets/Button.dart';

void main() {
  runApp(App());
}

// root  widget
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //테마 선택 : MaterialApp 혹은 CupertinoApp
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Hey, Selena',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8), fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                    fontSize: 22, color: Colors.white.withOpacity(0.8)),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '\$5 194 482',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Button(text: 'Transfer', bgColor: Colors.amber, textColor: Colors.black,),
                  Button(text: 'Request', bgColor: Color(0xff1f2123), textColor: Colors.white,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
