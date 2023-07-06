import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:toonflix/utils/utils.dart';
import 'widgets/time-widget.dart';

class Pomotimer extends StatefulWidget {
  const Pomotimer({super.key});

  @override
  _PomotimerState createState() => _PomotimerState();
}

class _PomotimerState extends State<Pomotimer> {
  static final List<int> POMODOR_TIMES = [900, 1200, 1500, 1800, 2100];
  // static final List<int> POMODOR_TIMES = [10, 20, 22, 23, 24];
  static final int CYCLE = 4;
  static final int TOTAL_GOAL = 12;
  static final int MAX_REST = 300;

  bool isRunning = false;
  bool isRest = false;
  int round = 3;
  int goal = 0;
  int selectedItem = 2;
  int totalSeconds = POMODOR_TIMES[2];
  int rest = MAX_REST;

  Timer? timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        round = round + 1;
        isRunning = false;
        totalSeconds = POMODOR_TIMES[selectedItem];
        isRest = true;
        if (round == CYCLE) {
          goal = goal + 1;
        }
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds--;
      });
    }
  }

  void onRestTick(Timer timer) {
    if (rest == 0) {
      setState(() {
        rest = MAX_REST;
        isRest = false;
      });
      timer.cancel();
    } else {
      setState(() {
        rest--;
      });
    }
  }

  void showAlert() {
    final snackBar = SnackBar(
      content: Text('${Utility.secFormat(rest)} 동안 쉬세요!!'),
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    timer = Timer.periodic(const Duration(seconds: 1), onRestTick);
  }

  @override
  void initState() {
    super.initState();
  }

  void onPomodorTimesPressed(var index) {
    setState(() {
      selectedItem = index;
      totalSeconds = POMODOR_TIMES[selectedItem];
      isRunning = false;
    });

    timer?.cancel();
  }

  void onPausePressed() {
    timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onPlayPressed() {
    if (isRest) {
      showAlert();
      return;
    }

    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
      if (round == CYCLE) {
        round = 0;
      }
    });
  }

  void onResetPressed() {
    setState(() {
      isRunning = false;
      round = 0;
      goal = 0;
      selectedItem = 2;
      totalSeconds = POMODOR_TIMES[2];
      rest = MAX_REST;
      isRest = false;
    });
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 30),
              alignment: Alignment.centerLeft,
              child: Text(
                'POMOTIMER',
                style: TextStyle(
                  color: Theme.of(context).textTheme.displayLarge!.color,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeWidget(
                        text: Utility.secToMinute(totalSeconds),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          ':',
                          style: TextStyle(
                            color: Theme.of(context).cardColor.withOpacity(0.5),
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      TimeWidget(
                          text: Utility.secToMinuteOnlySec(totalSeconds)),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    height: 60,
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0.05),
                            Colors.white,
                            Colors.white.withOpacity(0.05)
                          ],
                          stops: const [-1, -0.8, 0.8, 1],
                          tileMode: TileMode.repeated,
                        ).createShader(bounds);
                      },
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: POMODOR_TIMES.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                onPomodorTimesPressed(index);
                              },
                              child: Container(
                                // color: isSelected ? Theme.of(context).cardColor : Theme.of(context).backgroundColor,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                  color: selectedItem == index
                                      ? Theme.of(context).cardColor
                                      : Theme.of(context).backgroundColor,
                                  border: Border.all(
                                    color: selectedItem == index
                                        ? Theme.of(context).cardColor
                                        : Theme.of(context)
                                            .cardColor
                                            .withOpacity(0.6),
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  Utility.secToMinute(POMODOR_TIMES[index]),
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: selectedItem == index
                                        ? Theme.of(context).backgroundColor
                                        : Theme.of(context)
                                            .cardColor
                                            .withOpacity(0.6),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ElevatedButton(
                      onPressed: isRunning ? onPausePressed : onPlayPressed,
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffBF392A)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        iconSize: MaterialStateProperty.all(50),
                        fixedSize:
                            MaterialStateProperty.all(const Size(100, 100)),
                      ),
                      child: Icon(
                          isRunning ? Icons.pause_sharp : Icons.play_arrow),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: onResetPressed,
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(BorderSide(
                          color: Theme.of(context).cardColor.withOpacity(0.7),
                        )),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(20))),
                    icon: Icon(
                      Icons.replay,
                      color: Theme.of(context).cardColor.withOpacity(0.7),
                    ),
                    label: Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).cardColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              )),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TotalWidget(
                    n: round,
                    total: CYCLE,
                    text: 'ROUND',
                  ),
                  TotalWidget(
                    n: goal,
                    total: TOTAL_GOAL,
                    text: 'GOAL',
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class TotalWidget extends StatelessWidget {
  const TotalWidget({
    super.key,
    required this.n,
    required this.total,
    required this.text,
  });

  final int n;
  final int total;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            '$n/$total',
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .color!
                  .withOpacity(0.6),
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Theme.of(context).textTheme.displayLarge!.color,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
