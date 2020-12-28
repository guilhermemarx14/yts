import 'package:flutter/material.dart';
import 'package:yts/models/Movie.dart';
import 'package:yts/util/constants.dart';

class MovieDeatails extends StatefulWidget {
  MovieDeatails(this.id, {Key key}) : super(key: key);
  final int id;
  @override
  _MovieDeatailsState createState() => _MovieDeatailsState();
}

class _MovieDeatailsState extends State<MovieDeatails> {
  Movie movie;
  @override
  void initState() {
    Movie.getMovieById(widget.id).then((value) {
      setState(() {
        movie = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var body;

    Genres(Movie movie1) {
      var genres = <Widget>[];
      movie1.genres.forEach((element) {
        genres.add(Text(element, style: TextStyle(color: Colors.white)));
      });

      return Column(
        children: genres,
      );
    }

    Title(String title) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: TextStyle(
              color: ytsGreen, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      );
    }

    if (movie == null)
      body = Center(child: CircularProgressIndicator());
    else
      body = Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: NetworkImage(movie.background_image),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Title(movie.title_long),
                Image.network(
                  movie.large_cover_image,
                  width: 2 / 3 * width,
                ),
                Title('Description'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: Text(
                    movie.description_full,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Title('Genres'),
                Genres(movie),
                Title('Screenshots'),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Image.network(
                    movie.large_screenshot_image1,
                    width: 2 / 3 * width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Image.network(
                    movie.large_screenshot_image2,
                    width: 2 / 3 * width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Image.network(
                    movie.large_screenshot_image3,
                    width: 2 / 3 * width,
                  ),
                ),
              ],
            ),
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
