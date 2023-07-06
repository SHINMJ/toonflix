import 'package:flutter/material.dart';
import 'package:toonflix/challenge/widgets/challenge-card.dart';
import 'package:toonflix/challenge/widgets/person-text.dart';

import 'widgets/time.dart';


class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff181818),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(
                          width: 50,
                          height: 50,                    
                          child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/shinmj.jpeg"),
                        ),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        weight: 900,
                        size: 50,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'MONDAY 16',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TODAY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                        ),
                      ),
                      const Icon(
                        Icons.circle,
                        color: Color(0xffa62076),
                        size: 12,
                      ),
                      Container(
                        width: 300,
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '17 18 19 20',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white.withOpacity(0.5),
                            letterSpacing: 5
                          ),
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      )
                    ]
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ChallengeCard(
                    text: 'DESIGN\nMETTING', 
                    persons: const [PersonText(text: 'ALEX'), PersonText(text: 'HELENA'), PersonText(text: 'NANA')], 
                    start: const Time(hour: '11', minute: '30',), 
                    end: const Time(hour: '12', minute: '20',), 
                    bgColor: const Color(0xfff5f63c),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ChallengeCard(
                    text: 'DAILY\nPROJECT', 
                    persons: const [PersonText(text: 'ME', isMe: true,), PersonText(text: 'RICHARD'), PersonText(text: 'CIRY'), PersonText(text: '+4')], 
                    start: const Time(hour: '12', minute: '35',), 
                    end: const Time(hour: '14', minute: '10',), 
                    bgColor: const Color(0xff9550b3),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ChallengeCard(
                    text: 'WEEKLY\nPLANNING', 
                    persons: const [PersonText(text: 'DEN'), PersonText(text: 'NANA'), PersonText(text: 'MARK')], 
                    start: const Time(hour: '15', minute: '00',), 
                    end: const Time(hour: '16', minute: '30',), 
                    bgColor: const Color(0xff92db63),
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}