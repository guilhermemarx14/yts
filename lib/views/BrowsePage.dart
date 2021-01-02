import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yts/models/Data.dart';
import 'package:yts/models/Movie.dart';
import 'package:yts/util/constants.dart';
import 'package:yts/views/MovieDetails.dart';

class BrowsePage extends StatefulWidget {
  final int page;
  final String quality;
  final int minimum_rating;
  final String query_term;
  final String genre;

  const BrowsePage({
    Key key,
    this.page = 1,
    this.quality = 'All',
    this.minimum_rating = 0,
    this.query_term = '',
    this.genre = '',
  }) : super(key: key);

  @override
  _BrowsePageState createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  List<Movie> movies;
  String title;
  Data data;
  @override
  void initState() {
    Movie.getQueryMovies(widget.page, widget.quality, widget.minimum_rating,
            widget.query_term, widget.genre)
        .then((value) {
      setState(() {
        movies = value.movies;
        data = value;
      });
    });
    title = 'Browse Movies';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
        child: GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => MovieDeatails(movie.id))),
          child: Column(
            children: [
              Title(movie.title_long),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                ),
                child: Image.network(
                  movie.large_cover_image,
                  width: 2 / 3 * width,
                ),
              ),
            ],
          ),
        ),
      );
    }

    var lastLine = <Widget>[];
    var endPage;
    EndPage() {
      bool first, last;
      last = data.movie_count <= data.page_number * data.limit ? true : false;
      first = data.page_number == 1 ? true : false;

      if (!first)
        lastLine.add(FlatButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ytsGreen,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BrowsePage(
                          page: widget.page - 1,
                          quality: widget.quality,
                          minimum_rating: widget.minimum_rating,
                          query_term: widget.query_term,
                          genre: widget.genre,
                        )));
          },
          color: appBarBackground,
          child: Text(
            'Previous',
            style: TextStyle(color: ytsGreen, fontWeight: FontWeight.bold),
          ),
        ));

      lastLine.add(
        FlatButton(
          minWidth: 1,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ytsGreen,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {},
          child: Text(
            '${data.page_number}',
            style: TextStyle(color: ytsGreen, fontWeight: FontWeight.bold),
          ),
          color: appBarBackground,
        ),
      );
      if (!last)
        lastLine.add(
          FlatButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: ytsGreen,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BrowsePage(
                            page: widget.page + 1,
                            quality: widget.quality,
                            minimum_rating: widget.minimum_rating,
                            query_term: widget.query_term,
                            genre: widget.genre,
                          )));
            },
            child: Text(
              'Next',
              style: TextStyle(color: ytsGreen, fontWeight: FontWeight.bold),
            ),
            color: appBarBackground,
          ),
        );
      endPage = Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: lastLine,
        ),
      );
      return endPage;
    }

    if (movies == null)
      body = Center(child: CircularProgressIndicator());
    else {
      var allMovies = <Widget>[];

      allMovies.add(
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ytsGreen,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

      movies.forEach((element) => allMovies.add(MovieShow(element)));
      allMovies.add(EndPage());
      body = SingleChildScrollView(
        child: Center(
          child: Column(
            children: allMovies,
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (BuildContext context) => IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          backgroundColor: appBarBackground,
          title: Image.asset(
            'imgs/YTS_logo.png',
            fit: BoxFit.contain,
            height: 50,
          ),
        ),
      ),
      body: body,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: height,
              decoration: BoxDecoration(
                color: background,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
