import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          appBar: AppBar(
            title: Text('Hello Flutter!!'),
          ),
            body: Center(
              child: Text('Hello world!!'),
            ),
          ),
    );
  }
}
