// 顧客用画面
// 参加している部屋の名前・待ち順番を表示する

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final _tab = <Tab>[
    const Tab(text: '呼び出し部屋'),
    const Tab(text: '待機部屋'),
    const Tab(text: '遅延部屋'),
    const Tab(text: '案内住み部屋'),
  ];
  int _currentIndex = 0;
  final _pageWidgets = [
    PageWidget(color: Colors.white, title: 'Home'),
    PageWidget(color: Colors.blue, title: 'Album'),
    PageWidget(color: Colors.orange, title: 'Chat'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('店舗名と顧客名表示'),
          bottom: TabBar(
            tabs: _tab,
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            TabPage(title: '呼び出し部屋'),
            TabPage(title: '待機部屋'),
            TabPage(title: '遅延部屋'),
            TabPage(title: '案内住み部屋'),
          ],
        ),
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
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index);
}

class TabPage extends StatelessWidget {
  final IconData icon;
  final String title;

  const TabPage({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.display1;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 64.0, color: textStyle.color),
          Text(title, style: textStyle),
        ],
      ),
    );
  }
}

class PageWidget extends StatelessWidget {
  final Color color;
  final String title;

  PageWidget({Key key, this.color, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
