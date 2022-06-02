import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:netflix_app/services/api_service.dart';

import '../models/genre.dart';
import '../models/movie.dart';

class DataRepository with ChangeNotifier {
  ApiService apiService = ApiService();
  final List<Movie> _popularMoviesList = [];
  final List<Movie> _nowInCinemaMoviesList = [];
  final List<Movie> _comingSoonMoviesList = [];
  final List<Movie> _topRatedMoviesList = [];
  final List<Genre> _genreMovieList = [];
  int _moviePageIndex = 1;

  List<Movie> get popularMoviesList => _popularMoviesList;
  Future<void> getPopularMovies() async {
    try {
      List<Movie> movies =
          await apiService.getPopularMovies(pageNumber: _moviePageIndex);
      _popularMoviesList.addAll(movies);
      _moviePageIndex++;
      notifyListeners();
    } on HttpResponse catch (response) {
      //print("Erreur ${response.statusCode}");
      rethrow;
    }
  }

  List<Movie> get nowInCinemaMoviesList => _nowInCinemaMoviesList;
  Future<void> getNowInCinemaMovies() async {
    try {
      List<Movie> movies =
          await apiService.getNowPlayingMovie(pageNumber: _moviePageIndex);
      _nowInCinemaMoviesList.addAll(movies);
      _moviePageIndex++;
      notifyListeners();
    } on HttpResponse catch (response) {
      //print("Erreur ${response.statusCode}");
      rethrow;
    }
  }

  List<Movie> get comingSoonMoviesList => _comingSoonMoviesList;
  Future<void> getComingSoonMovies() async {
    try {
      List<Movie> movies =
          await apiService.getUpcomingMovie(pageNumber: _moviePageIndex);
      _comingSoonMoviesList.addAll(movies);
      _moviePageIndex++;
      notifyListeners();
    } on HttpResponse catch (response) {
      //print("Erreur ${response.statusCode}");
      rethrow;
    }
  }

  List<Movie> get topRatedMoviesList => _topRatedMoviesList;
  Future<void> getTopRatedMovies() async {
    try {
      List<Movie> movies =
          await apiService.getTopRatedMovie(pageNumber: _moviePageIndex);
      _topRatedMoviesList.addAll(movies);
      _moviePageIndex++;
      notifyListeners();
    } on HttpResponse catch (response) {
      //print("Erreur ${response.statusCode}");
      rethrow;
    }
  }

  /* List<Genre> get genreMovieList => _genreMovieList;
  Future<void> getGenreMovie({required String idMovie}) async {
    try {
      List<Genre> genres = await apiService.getGenreByMovie(idMovie: idMovie);
      _genreMovieList.addAll(genres);
      notifyListeners();
    } on HttpResponse catch (response) {
      //print("Erreur ${response.statusCode}");
      rethrow;
    }
  } */

  Future<void> initData() async {
    await getPopularMovies();
    await getNowInCinemaMovies();
    await getComingSoonMovies();
    await getTopRatedMovies();
  }
}
