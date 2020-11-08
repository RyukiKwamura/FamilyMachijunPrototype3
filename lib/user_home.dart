// 顧客用画面
// 参加している部屋の名前・待ち順番を表示する

import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('店舗名をここに入れる'),
      ),
      body: Container(
          child: Center(
        child: Text('ここに順番を入れる'),
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Home')),
          const BottomNavigationBarItem(
              icon: Icon(Icons.photo_album), title: Text('Album')),
          const BottomNavigationBarItem(
              icon: Icon(Icons.chat), title: Text('Chat')),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.blueAccent,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index);
}
