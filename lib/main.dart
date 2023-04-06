import 'dart:async'; //非同期処理用ライブラリ
import 'dart:io';  //ファイル出力用ライブラリ
import 'package:path_provider/path_provider.dart'; //アプリがファイルを保存可能な場所を取得するライブラリ

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'otameshi',
      home: Scaffold(
        appBar: AppBar(
          title: Text('OutputTest'),
        ),
        body: OutputTest(),
      ),
    );
  }
}

class OutputTest extends StatefulWidget{
  @override
  _OutputTestState createState() => new _OutputTestState();
}

class _OutputTestState extends State<OutputTest>{

  // 入力された内容を保持するコントローラ
  final outputController = TextEditingController();

  // 表示用の変数
  String inputText = "0回、出力しました";
  int inputNum = 0;

  // 「ファイルに出力する」が押されたときの処理
  void output(String s) async{
    setState(() {
      ++inputNum;
      inputText = "" + inputNum.toString() + "回、出力しました";
    });
    
    getFilePath().then((File file) { //thenの記述で非同期処理であるgetFilePath関数の処理を待っている
      file.writeAsString(s);
    });
  }

  //ファイルの読み込みと変数への格納処理
  void loadFile() async {
    setState(() {
      load().then((String value) {
        setState(() {
          inputText = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Column1
        Container(
          alignment: Alignment.center,
          child: Container(
            width: 300,
            height: 100,
            child: TextField(
              enabled: true, //活性or非活性
              maxLength: 10, //入力最大文字数
              style: TextStyle(color: Colors.red), //入力文字のスタイル
              obscureText: false, //trueでマスク（****表記）にする
              maxLines:1, //入力可能行数
              controller: outputController,
            ),
          )
        ),

        // Column2
        GestureDetector(
          onTap: () {
            output(outputController.text);
          },
          child: Text("ファイルに出力する"),
        ),

        // Column3
        GestureDetector(
          onTap: () {
            loadFile();
          },
          child: Text("ファイルを読み込む"),
        ),

        // Column4
        Text(inputText),

      ],
    );
  }
}



//テキストファイルを保存するパスを取得する
Future<File> getFilePath() async { //Future<T> 関数名 asyncで<T>クラスを扱いとする非同期処理をする関数。非同期処理は、実行されると、その終了を待たずに他の処理が実行されます。関数内に１つでも非同期処理が実行される場合は非同期関数となります。
  final directory = await getTemporaryDirectory(); //await はその処理が終わるまで待つということ
  debugPrint(directory.path);
  return File(directory.path + '/test.txt');
}

//テキストファイルの読み込み
Future<String> load() async {
  final file = await getFilePath();
  return file.readAsString();
}