// 店舗用画面
// ログイン画面

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //フォーム
  final _formKey = GlobalKey<FormState>();
//店舗情報
  String _storeName = '';
  String _email = '';
  String _passWord = '';

  @override
  Widget build(BuildContext context) {
    // 店舗情報の定義
    var _storeController = TextEditingController();
    var _emailController = TextEditingController();
    var _passwordController = TextEditingController();

    // 登録・ログインに関する情報を表示
    // var infoText = '';
    // アプリバーの表示名
    final _appBarName = 'ログイン画面';
    // キーボード操作の促し
    final _emailFocusNode = FocusNode();
    final _passwordFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarName),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  const Text('店舗名'),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'storeName'),
                    maxLength: 20,
                    maxLengthEnforced: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return '必須入力です';
                      } else if (value.length > 30) {
                        return '20文字以内で入力して下さい';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (String value) {
                      _storeName = value;
                    },
                    textInputAction: TextInputAction.next, // 追加
                    controller: _storeController,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_emailFocusNode); // 変更
                    },
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  const Text('メールアドレス'),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'mailAdress'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String value) {
                      return !value.contains('@') ? 'アットマーク「＠」がありません。' : null;
                    },
                    onSaved: (String value) {
                      _email = value;
                    },
                    textInputAction: TextInputAction.next, // 追加
                    controller: _emailController,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_passwordFocusNode); // 変更
                    },
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  const Text('パスワード'),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'passWord'),
                    maxLength: 16,
                    maxLengthEnforced: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return '必須入力です';
                      } else if (value.length < 4) {
                        return '4文字以上で入力して下さい';
                      } else if (value.length > 16) {
                        return '16文字以内で入力して下さい';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (String value) {
                      _passWord = value;
                    },
                    obscureText: true, // 追加
                    controller: _passwordController,
                  ),
                ],
              ),
              Container(
                child: RaisedButton(
                  onPressed: _submission,
                  child: const Text('次へ'),
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
      _formKey.currentState.save();
      Navigator.of(context).pushNamed('/qr_generate');
      Fluttertoast.showToast(msg: 'Processing Data');
      print(_storeName);
      print(_email);
      print(_passWord);
    } else {
      print('submit_Fail');
    }
  }
}
