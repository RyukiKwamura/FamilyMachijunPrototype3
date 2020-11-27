// 共通機能
// ユーザー切り替え画面

import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  final String _appBarName = '待ちジュン-利用種別選択';
  final String _customer = '利用客';
  final String _company = '事業者';
  final String _license = 'ライセンス表示';

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
              const Text('あなたの利用種別は？'),
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed('/userEntry'),
                child: Text(_customer),
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed('/login'),
                child: Text(_company),
              ),
              //RaisedButton(onPressed: () => Navigator.of(context).pop(), child: new Text('戻る'),),
            ],
          ),
        ),
      ),
    );
  }
}
