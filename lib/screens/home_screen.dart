import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:netflix/SQL/database_helper.dart';
import 'package:netflix/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:netflix/screens/movie_screen.dart';
import 'package:netflix/screens/search_screen.dart';
import 'package:netflix/widgets/content_scroll_movies.dart';

class HomeScreen extends StatefulWidget {
  List<Movie> movielist;
  List<Movie> carousel;
  List<Movie> list;
  HomeScreen({this.movielist, this.carousel, this.list});
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  List<Movie> list;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    updateListView();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image(
          image: AssetImage('images/netflix_logo.png'),
          height: 60.0,
          width: 150.0,
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.0),
          onPressed: () => print('Menu'),
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SearchScreen(),
                )),
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.black,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 280.0,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.carousel.length,
              itemBuilder: (BuildContext context, int index) {
                return _movieSelector(index);
              },
            ),
          ),
          Container(
            height: 90.0,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                scrollDirection: Axis.horizontal,
                itemCount: labels.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 160.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFD45253),
                            Color(0xFF9E1F28),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF9E1F28),
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ]),
                    child: Center(
                      child: Text(
                        labels[index].toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(height: 20.0),
          ContentScrollMovie(
            movies: widget.movielist,
            carousel: widget.carousel,
            movielist: widget.movielist,
            list: widget.list,
            title: 'Popular',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
          SizedBox(height: 20.0),
          ContentScrollMovie(
            movies: widget.movielist,
            carousel: widget.carousel,
            movielist: widget.movielist,
            list: widget.list,
            title: 'All Movies',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
          SizedBox(height: 20.0),
          ContentScrollMovie(
            movies: widget.list,
            carousel: widget.carousel,
            movielist: widget.movielist,
            list: widget.list,
            title: 'My List',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
        ],
      ),
    );
  }

  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.6).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return new MovieScreen(
              movie: widget.carousel[index],
              list: widget.list,
            );
          }));
        },
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      )
                    ]),
                child: Center(
                  child: Hero(
                    tag: widget.carousel[index].screenshots.split("@")[1],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: NetworkImage(
                            widget.carousel[index].screenshots.split("@")[1]),
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: Container(
                width: 250.0,
                child: Text(
                  widget.carousel[index].title.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void navigateToDetail() async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return projectWidget();
    }));
    debugPrint(result.toString());
    if (result != false) {
      updateListView();
    }
  }

  void updateListView() {
    DatabaseHelper helper = DatabaseHelper();
    final Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Movie>> movieListFuture = helper.getMovieList();
      movieListFuture.then((movieList) {
        setState(() {
          this.list = movieList;
        });
      });
    });
  }
}
