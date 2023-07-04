# flutter

## Introduction

### why flutter

안드로이드, ios 뿐만 아니라 web, macos, linux 상에서 동작하는 웹어플리케이션, 임베디드까지 다룰 수 있다.

### how flutter works

- flutter 어플리케이션은 플랫폼의 native widget을 사용하지 않는다.
- 운영체제가 어플리케이션의 무엇을 그려주는 것이 아니라 **flutter의 렌더링 엔진(c and c++)**이 그려준다.
- 운영체제는 엔진을 동작시키고 엔진은 flutter 코드를 동작시킨다.
- 여타 크로스 플랫폼은 운영체제의 호스트와 직접 소통하여 widget을 그리지만 flutter는 엔진을 호스트에 집어넣고 dart 코드를 컴파일하여 화면을 보여준다.
- 실제 widget이 아니므로 약간 부자연스러워 보일 수 있다.

### flutter VS react native

| flutter                            | react native                         |
| ---------------------------------- | ------------------------------------ |
| 운영체제와 직접 소통하지 않음      | 운영체제와 직접 소통                 |
| 커스터마이징 된 디자인인 경우 좋음 | 호스트 플랫폼의 디자인을 사용할 경우 |

## Installation

### installation

- [개발환경 세팅](https://peppered-bottle-2c8.notion.site/3b42b7667166496c8fae464760fe1dd5?pvs=4)
- [온라인 상에서 실행](https://dartpad.dev/?)

### create app

`flutter create <appname>`

### widget

사용할 위젯을 [위젯 카탈로그](https://docs.flutter.dev/ui/widgets) 에서 찾아볼 수 있음.

### theme

- MaterialApp or CupertinoApp
- flutter는 구글이 만들었기 때문에 MaterialApp으로 하는게 낫다.

### basic sample

```dart
// root  widget
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //테마 선택 : MaterialApp 혹은 CupertinoApp
    return MaterialApp(
        // 뼈대를 만듬.
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

```
