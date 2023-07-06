import 'package:flutter/material.dart';
import 'package:toonflix/challenge/first.dart';

void main() {
  runApp(App());
}

// root  widget
// StatelessWidget => 데이터(상태)의 변화없이 오로지 화면을 보여주기만 함.
// StatefulWidget => 데이터의 변화를 볼 수 있음.
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> numbers = [];

  void onClicked() {
    // State 클래스에 데이터가 변경되었다고 알려줌.
    // setState 가 호출되면 ui를 새로 그림.
    setState(() {
      numbers.add(numbers.length);
    });
  }

/// BuildContext : 위젯 트리에 대한 정보가 담겨 있음.
/// 해당 위젯이 어떤 위젯이고 어느 위치에 있는지 알 수 있음.
  @override
  Widget build(BuildContext context) {
    //테마 선택 : MaterialApp 혹은 CupertinoApp
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
          backgroundColor: const Color(0xfff4eddb),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                MyLargeTitle(),
               
              ],
            ),
          )),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      'Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color
      ),
    );
  }
}
