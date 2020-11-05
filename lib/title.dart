// 共通機能
// タイトル画面

//Todo 将来的には初回起動時しか表示しないようにする

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:pre_app/admin_home.dart';
import 'package:pre_app/login.dart';
import 'package:pre_app/qr_generation.dart';
import 'package:pre_app/qr_reader.dart';
import 'package:pre_app/tutorial.dart';
import 'package:pre_app/user_entry.dart';
import 'package:pre_app/user_home.dart';
import 'package:pre_app/user_switching.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //getAndroidInfo();
  runApp(MyApp());
}

Future<void> getAndroidInfo() async {
  var deviceInfo = DeviceInfoPlugin();
  var androidInfo = await deviceInfo.androidInfo;
  print('Running on ${androidInfo.androidId}'); // => Android デバイスID出力
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '待ちジュン',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => MainPage(),
        '/tutorial': (context) => Tutorial(),
        '/subpage': (context) => SwitchPage(),
        '/userEntry': (context) => UserEntry(),
        '/login': (context) => Login(),
        '/qr_reader': (context) => QrReaderPage(),
        '/qr_generate': (context) => QrGenerationPage(),
        '/user_home': (context) => UserHome(),
        '/admin_home': (context) => AdminHome()
      },
    );
  }
}

class MainPage extends StatelessWidget {
  final String _appBarName = '待ちジュン-チュートリアル';
  final List<String> _buttonTitle = ['チュートリアルを見る', 'チュートリアル', 'チュートリアルを終わる'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarName),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_buttonTitle[0]),
              RaisedButton(
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('/tutorial'),
                child: Text(_buttonTitle[1]),
              ),
              RaisedButton(
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('/subpage'),
                child: Text(_buttonTitle[2]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
