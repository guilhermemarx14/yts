import 'package:flutter/material.dart';
import 'package:yts/models/Movie.dart';
import 'package:yts/util/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Movie.getMovie();
    super.initState();
  }

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
