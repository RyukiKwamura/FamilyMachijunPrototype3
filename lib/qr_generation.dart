// 店舗用画面
// QRコードの提示を行う

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerationPage extends StatefulWidget {
  @override
  _QrGenerationPageState createState() => _QrGenerationPageState();
}

class _QrGenerationPageState extends State<QrGenerationPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        title: const Text('QR Code Demo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            QrImage(
              data: randomString(64),
              size: 200,
            ),
            const Text('パスコード'),
            Text(randomString(4)),
            Container(
              child: RaisedButton(
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('/admin_home'),
                child: const Text('部屋情報へ'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submission() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.of(context).pushReplacementNamed('admin_home');
      Fluttertoast.showToast(msg: 'Processing Data');
    } else {
      print('submit_Fail');
      const Text('エラー');
    }
  }

  String randomString(int length) {
    const _randomChars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const _charsLength = _randomChars.length;

    final rand = Random.secure();
    final codeUnits = List.generate(
      length,
      (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },
    );
    return String.fromCharCodes(codeUnits);
  }
}
