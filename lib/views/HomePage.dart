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
  List<Movie> movies;
  @override
  void initState() {
    Movie.getLatestMovies().then((value) {
      setState(() {
        movies = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var body;

    Title(String title) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ytsGreen,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    MovieShow(Movie movie) {
      return GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => MovieDeatails(movie.id))),
        child: Column(
          children: [
            Title(movie.title_long),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(16.0),
                color: Colors.white,
              ),
              child: Image.network(
                movie.large_cover_image,
                width: 2 / 3 * width,
              ),
            ),
          ],
        ),
      );
    }

    if (movies == null)
      body = Center(child: CircularProgressIndicator());
    else
      body = SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Most recent movies',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ytsGreen,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MovieShow(movies[0]),
              MovieShow(movies[1]),
              MovieShow(movies[2]),
              MovieShow(movies[3]),
              MovieShow(movies[4]),
            ],
          ),
        ),
      );

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
      body: body,
    );
  }
}
