// 店舗用画面
// 各部屋及び部屋ごとのユーザーを表示する

// ToDo 店舗名取得
// ToDo 参加しているユーザーを部屋ごとに表示
// ToDo 参加ユーザを別の部屋に移動・削除できるボタンを設置

import 'dart:async';

import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  final String title = 'ここに店舗名を入れる予定';
  final List<String> labelForChildren = List<String>.filled(3, 'Page');

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  static const double _pageViewFraction = 0.8;
  static const double _pageIndicatorFraction = 0.6;

  final StreamController<int> _pageIndexSubject =
      StreamController<int>.broadcast();
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: _pageViewFraction,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageIndexSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildPageView(),
              const SizedBox(height: 8),
              FractionallySizedBox(
                widthFactor: _pageIndicatorFraction,
                child: _buildPageIndicator(context),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              title: Text('Contacts'),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('Map'),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('Chat'),
            ),
          ],
        ));
  }

  Widget _buildPageView() {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(height: 120),
      child: PageView(
        onPageChanged: _pageIndexSubject.sink.add,
        controller: _controller,
        children:
            List<Widget>.generate(widget.labelForChildren.length, (int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _buildPageViewChild(
              index,
              color: Colors.blue.withOpacity(1 / (index % 3 + 1)),
              child: Center(child: Text(widget.labelForChildren[index])),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildPageViewChild(
    int index, {
    Color color,
    Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }

  Widget _buildPageIndicator(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      alignment: WrapAlignment.center,
      children: List<Widget>.generate(
        widget.labelForChildren.length,
        (int index) {
          return StreamBuilder<int>(
            initialData: _controller.initialPage,
            stream: _pageIndexSubject.stream.where((int pageIndex) =>
                index >= pageIndex - 1 && index <= pageIndex + 1),
            builder: (_, AsyncSnapshot<int> snapshot) {
              return Container(
                width: 6,
                height: 6,
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: snapshot.data == index
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
