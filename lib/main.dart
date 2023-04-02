import 'package:flutter/material.dart';
import 'QRread.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Machilabo Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.limeAccent,
      ),
      home: const MyHomePage(title: 'まちラボへようこそ！'),
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

  void _admissionDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title :Text("来館ありがとうございます！"),
        content: Text("Welcome to まちらぼ !"),
      )
    );
  }
  void _exitDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title :Text("ご利用ありがとうございました！"),
        content: Text("See you !"),
      )
    );
  }
  void _firstDialog() {
    showDialog(
        context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("まちラボをどこで知りましたか？"),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Text("webサイトやSNS"),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Text("チラシやパンフレット"),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Text("YouTubeなどの動画"),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Text("たまたま立ち寄った"),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Text("その他"),
            ),
          ],
        );
      },
    );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRread(title: "")),
                ),
              },
              child: Text('QRコード読み取りのボタン'),
            ),
            ElevatedButton(
              onPressed: () {_admissionDialog();},
              child: Text('入館ボタン'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(255, 247, 153, 1), //ボタンの背景色
              ),
            ),
            ElevatedButton(
              onPressed: () {_exitDialog();},
              child: Text('退館ボタン'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(255, 247, 153, 1), //ボタンの背景色
              ),
            ),
            ElevatedButton(
              onPressed: () {_firstDialog();},
              child: Text('はじめての方'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(255, 247, 153, 1), //ボタンの背景色
              ),
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.*/
    );
  }
}
