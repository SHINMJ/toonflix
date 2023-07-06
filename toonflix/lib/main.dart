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
  int _counter = 0;

  void onClicked(){
    // State 클래스에 데이터가 변경되었다고 알려줌.
    setState(() {
      _counter++;  
    });
    
  }

  @override
  Widget build(BuildContext context) {
    //테마 선택 : MaterialApp 혹은 CupertinoApp
    return MaterialApp(
      home:
          Scaffold(backgroundColor: const Color(0xfff4eddb), 
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Click Count',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text('$_counter',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: onClicked, icon: const Icon(Icons.add_box_rounded),
                ),
              ],
            ),
          )),
    );
  }
}
