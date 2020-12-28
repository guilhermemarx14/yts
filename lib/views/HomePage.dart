import 'package:flutter/material.dart';
import 'package:yts/models/Movie.dart';
import 'package:yts/util/constants.dart';
import 'package:yts/views/MovieDetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int id = -1;
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (newValue) {
                setState(() {
                  id = int.parse(newValue);
                });
              },
            ),
          ),
          FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MovieDeatails(id)));
              },
              child: Text('Go to Movie'))
        ],
      ),
    );
  }
}
