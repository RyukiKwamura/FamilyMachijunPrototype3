// 顧客用画面
//ユーザー名の入力

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserEntry extends StatefulWidget {
  @override
  _UserEntryState createState() => _UserEntryState();
}

// ignore: must_be_immutable
class _UserEntryState extends State<UserEntry> {
  final _formKey = GlobalKey<FormState>();
  final String _appBarMessage = 'ニックネームを教えて！';
  String _userName;

  @override
  Widget build(BuildContext context) {
    var _userNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarMessage),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: <Widget>[
              const Text('ニックネーム'),
              TextFormField(
                decoration: const InputDecoration(labelText: 'nickName'),
                maxLength: 20,
                maxLengthEnforced: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String value) {
                  if (value.isEmpty) {
                    return '必須入力です';
                  } else if (value.length > 20) {
                    return '20文字以内で入力して下さい';
                  } else if (value.length < 2) {
                    return '2字以上で入力して下さい';
                  } else {
                    return null;
                  }
                },
                onSaved: (String value) {
                  _userName = value;
                },
              ),
              RaisedButton(
                onPressed: _submission,
                child: const Text('入室へ'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submission() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.of(context).pushReplacementNamed('/qr_reader');
      Fluttertoast.showToast(msg: 'Processing Data');
      print(_userName);
    } else {
      print('submit_Fail');
    }
  }
}
