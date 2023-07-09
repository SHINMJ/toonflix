import 'package:flutter/material.dart';
import 'package:toonflix/screens/home.dart';

void main() {
  runApp(App());
}

// root  widget
// StatelessWidget => 데이터(상태)의 변화없이 오로지 화면을 보여주기만 함.
// StatefulWidget => 데이터의 변화를 볼 수 있음.
class App extends StatelessWidget {
  //key = widget을 식별하는 id
  const App({super.key});

  /// BuildContext : 위젯 트리에 대한 정보가 담겨 있음.
  /// 해당 위젯이 어떤 위젯이고 어느 위치에 있는지 알 수 있음.
  @override
  Widget build(BuildContext context) {
    //테마 선택 : MaterialApp 혹은 CupertinoApp
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xFFE64D3D),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xfff4eddb),
          ),
        ),
        cardColor: const Color(0xfff4eddb),
      ),
      home: Home(),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  /// 상태 초기화
  /// build 메서드보다 먼저 호출되어야 함.
  /// 한번만 호출됨.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
  }

  /// 위젯이 스크린에서 사라질 때 호출
  /// 위젯이 위젯트리에서 제거되기 전에 호출됨.
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      'Large Title',
      style: TextStyle(
          fontSize: 30, color: Theme.of(context).textTheme.titleLarge!.color),
    );
  }
}
