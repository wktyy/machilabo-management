import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () => {
                print('ボタンが押された！'),
                _incrementCounter(),
              },
              child: Text('ただのボタン'),
            ),
            ElevatedButton(
              onPressed: () {_incrementCounter();},
              child: Text('背景色を指定したボタン'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, //ボタンの背景色
              ),
            ),
            // * ボタンを押した時に色が変わる --------------------------------------
            ElevatedButton(
              onPressed: () {_incrementCounter();},
              child: Text(
                '押した時赤になる',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, //ボタンの背景色
                onPrimary: Colors.red, // ボタンを押した時の色
              ),
            ),
            // * ボタンに枠線を付ける ----------------------------------------------
            ElevatedButton(
              onPressed: () {_incrementCounter();},
              child: Text('枠線付きボタン'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, //ボタンの背景色
                side: BorderSide(
                  color: Colors.blue, // 枠線の色
                  width: 5, // 枠線の太さ
                ),
              ),
            ),
            // * .styleFromコンストラクタでサイズ変更 -----------------------------------------
            ElevatedButton(
              onPressed: () {_incrementCounter();},
              child: Text('.styleFromコンストラクタでサイズ変更'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 100), // サイズ変更
                primary: Colors.pink,
              ),
            ),
            // * .iconコンストラクタ ------------------------------------------------
            // アイコン付きのボタンを作成できる
            ElevatedButton.icon(
              onPressed: () {_incrementCounter();},
              icon: Icon(Icons.settings), // 表示するアイコン
              label: Text('.iconコンストラクタ'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
