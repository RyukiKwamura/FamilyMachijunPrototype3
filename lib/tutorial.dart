//チュートリアル用の画面
//タイルを４つ表示

import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class Tutorial extends StatefulWidget {
  Tutorial({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          _globalKey.currentState.showSnackBar(const SnackBar(
            content: Text('Skip clicked'),
          ));
          Navigator.of(context).pushReplacementNamed('/subpage');
        },
        finishCallback: () {
          _globalKey.currentState.showSnackBar(const SnackBar(
            content: Text('Finish clicked'),
          ));
          Navigator.of(context).pushReplacementNamed('/subpage');
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: const Color(0xFF0097A7),
        imageAssetPath: 'assets/01.png',
        title: 'Screen 1',
        body: 'Share your ideas with the team',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF536DFE),
        imageAssetPath: 'assets/02.png',
        title: 'Screen 2',
        body: 'See the increase in productivity & output',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'assets/03.png',
        title: 'Screen 3',
        body: 'Connect with the people from different places',
        doAnimateImage: true),
    PageModel.withChild(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Image.asset('assets/02.png', width: 300.0, height: 300.0),
        ),
        color: const Color(0xFF5886d6),
        doAnimateChild: true)
  ];
}
