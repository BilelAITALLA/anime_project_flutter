import 'package:flutter/material.dart';
import 'package:netflix/models/movie_model.dart';
import 'package:netflix/screens/movie_screen.dart';

class ContentScrollMovie extends StatelessWidget {
  final List<Movie> movies;
  final List<Movie> list;
  final List<Movie> movielist;
  final List<Movie> carousel;
  final String title;
  final double imageHeight;
  final double imageWidth;

  ContentScrollMovie({
    this.movies,
    this.list,
    this.title,
    this.carousel,
    this.movielist,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () => print('View $title'),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 30.0,
                ),
              )
            ],
          ),
        ),
        Container(
          height: imageHeight,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieScreen(
                          movie: movies[index],
                          carousel: carousel,
                          movielist: movielist,
                          list: list,
                        ),
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: NetworkImage(movies[index].poster),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                width: imageWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 6.0,
                      ),
                    ]),
              );
            },
          ),
        ),
      ],
    );
  }
}
