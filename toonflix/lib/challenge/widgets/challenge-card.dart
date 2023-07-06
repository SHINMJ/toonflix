import 'package:flutter/material.dart';
import 'package:toonflix/challenge/widgets/person-text.dart';
import 'package:toonflix/challenge/widgets/time.dart';

class ChallengeCard extends StatelessWidget {
  final String text;
  final List<PersonText> persons;
  final Time start;
  final Time end;
  final Color bgColor;

  ChallengeCard(
      {super.key,
      required this.text,
      required this.persons,
      required this.start,
      required this.end,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 0, 15),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                    child: Column(
                      children: [
                        start,
                        const Text(
                          '|',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        end,
                      ]
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          text,
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: persons
              ),
            ),
          ],
        ),
      ),
    );
  }
}
