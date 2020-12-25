import 'package:flutter/material.dart';
import 'package:yts/util/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: appBarBackground,
          title: Image.asset(
            'imgs/YTS_logo.png',
            fit: BoxFit.contain,
            height: 50,
          ),
        ),
      ),
    );
  }
}
