import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key.key});

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
  const MyHomePage({Key.key, required this.title});
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
  Widget build(Buil//非同期処理用ライブラリ
import 'dart:async';
//ファイル出力用ライブラリ
import 'dart:io';

import 'package:flutter/material.dart';
//アプリがファイルを保存可能な場所を取得するライブラリ
import 'package:path_provider/path_provider.dart';

//テキストフィールドの状態を管理するためのクラス
final _textController = TextEditingController();
//出力するテキストファイル名
final _fileName = 'editTextField.txt';

void main() => runApp(MyApp());

//ステートレス
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ファイル 出力テスト',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter ファイル 出力テスト'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//ステートフル
class _MyHomePageState extends State<MyHomePage> {
  //読み込んだテキストファイルを出力
  String _out = '';

  //ファイルの出力処理
  void outButton() async {
    getFilePath().then((File file) {
      file.writeAsString(_textController.text);
    });
  }

  //ファイルの読み込みと変数への格納処理
  void loadButton() async {
    setState(() {
      load().then((String value) {
        setState(() {
          _out = value;
        });
      });
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
            Text('テキストを入力してください'),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                autofocus: true,
                controller: _textController,
                decoration: InputDecoration(icon: Icon(Icons.arrow_forward)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              //ファイル出力用のボタン(ボタン押下でoutButtonメソッドを呼び出し)
              child:RaisedButton(child: Text('ファイルに出力する'), onPressed: outButton),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              //ファイル読み込み用のボタン(ボタン押下でloadButtonメソッドを呼び出し)
              child: RaisedButton(
                  child: Text('出力したファイルを読み込む'), onPressed: loadButton),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                //読み込みだファイルの内容を表示
                child: Text(
                  '出力したファイルの内容は「' + _out + '」です！',
                )),
          ],
        ),
      ),
    );
  }
}

//テキストファイルを保存するパスを取得する
Future<File> getFilePath() async {
  final directory = await getTemporaryDirectory();
  return File(directory.path + '/' + _fileName);
}

//テキストファイルの読み込み
Future<String> load() async {
  final file = await getFilePath();
  return file.readAsString();
}dContext context) {
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
