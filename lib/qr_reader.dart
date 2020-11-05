// 顧客用画面
// QRコードを読み込む

// ToDo パスコードを入力し、入室する処理

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QrReaderPage extends StatefulWidget {
  @override
  _QrReaderPageState createState() => _QrReaderPageState();
}

class _QrReaderPageState extends State<QrReaderPage> {
  //フォーム
  final _formKey = GlobalKey<FormState>();
  String _passCode;
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Barcode scan')),
      body: Form(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  onPressed: scanQR, child: const Text('Start QR scan')),
              Text('Scan result : $_scanBarcode\n',
                  style: const TextStyle(fontSize: 20)),
              TextFormField(
                key: _formKey,
                decoration: const InputDecoration(labelText: 'passCode'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: true, // 追加
                validator: (String value) {
                  if (value.isEmpty) {
                    return '必須入力です';
                  } else if (value.length != 4) {
                    return '4字で入力して下さい';
                  } else {
                    return null;
                  }
                },
                onSaved: (String value) {
                  _passCode = value;
                },
              ),
              Container(
                child: RaisedButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed('/user_home'),
                  child: const Text('待ちジュンを確認'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submission() {
    if (_formKey.currentState.validate()) {
      debugPrint('qrReader_submit_success!!');
      _formKey.currentState.save();
      Navigator.of(context).pushReplacementNamed('/user_home');
      Fluttertoast.showToast(msg: 'Processing Data');
      (_passCode);
    } else {
      debugPrint('submit_Fail');
    }
  }
}
