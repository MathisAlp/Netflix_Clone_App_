import 'package:flutter/material.dart';
import 'package:netflix_app/services/api_service.dart';
import 'package:netflix_app/ui/screens/home_screen.dart';

import '../../models/genre.dart';
import '../../models/movie.dart';
import '../../shared/constants.dart';

class detailMovie extends StatefulWidget {
  final Movie movie;
  detailMovie({Key? key, required this.movie}) : super(key: key);

  @override
  State<detailMovie> createState() => _detailMovieState();
}

class _detailMovieState extends State<detailMovie> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getGenreMovie();
  }

  ApiService apiService = ApiService();
  final List<Genre> _genreMovieList = [];
  getGenreMovie() async {
    List<Genre> genres =
        await apiService.getGenreByMovie(idMovie: widget.movie.id.toString());
    _genreMovieList.addAll(genres);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: alpBackgroundColor,
      appBar: AppBar(
        title: Text(widget.movie.name),
        backgroundColor: alpBackgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Container(child: Image.asset("assets/images/back.png")),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 252,
            color: Colors.white,
            child: const Center(
              child: Text("Video"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.movie.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
