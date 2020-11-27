import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final appname = 'アプリ名';
  final appIcon = FlutterLogo();
  final version = '1.0.0';
  final legalese = '2020 takuchalle';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.info),
              title: Text('showLicensePage'),
              onTap: () {
                showLicensePage(
                  context: context,
                  applicationName: appname, // アプリの名前
                  applicationVersion: version, // バージョン
                  applicationIcon: appIcon, // アプリのアイコン Widget
                  applicationLegalese: legalese, // 権利情報
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('showAboutDialog'),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: appname, // アプリの名前
                  applicationVersion: version, // バージョン
                  applicationIcon: appIcon, // アプリのアイコン Widget
                  applicationLegalese: legalese, // 権利情報
                );
              },
            ),
            AboutListTile(
              icon: Icon(Icons.info),

              applicationName: appname, // アプリの名前
              applicationVersion: version, // バージョン
              applicationIcon: appIcon, // アプリのアイコン Widget
              applicationLegalese: legalese, // 権利情報
            ),
          ],
        ),
      ),
    );
  }
}
