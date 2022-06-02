import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix_app/models/credit.dart';
import 'package:netflix_app/models/genre.dart';
import 'package:netflix_app/services/api.dart';

import '../models/movie.dart';

class ApiService {
  final Api api = Api();
  final Dio dio = Dio();

  //path /movie/popular
  //params page=1, pa
  //detail film
  //getData('/movie/1')
  //film populaire
  //getData('/movie/popular,params:{"page":1}')

  Future<Response> getData(String path, {Map<String, dynamic>? params}) async {
    String url = api.baseUrl + path;
    Map<String, dynamic> query = {'api_key': api.apiKey, 'language': 'en-US'};
    if (params != null) {
      query.addAll(params);
    }
    final response = await dio.get(url, queryParameters: query);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw (response);
    }
  }

  Future<List<Movie>> getPopularMovies({required int pageNumber}) async {
    Response response =
        await getData("/movie/popular", params: {'page': pageNumber});

    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> results = data["results"];
      List<Movie> movies = [];
      for (dynamic json in results) {
        Movie movie = Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;
    } else {
      throw (response);
    }
  }

  Future<List<Movie>> getNowPlayingMovie({required int pageNumber}) async {
    Response response =
        await getData("/movie/now_playing", params: {'page': pageNumber});

    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> results = data["results"];
      List<Movie> movies = [];
      for (dynamic json in results) {
        Movie movie = Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;
    } else {
      throw (response);
    }
  }

  Future<List<Movie>> getUpcomingMovie({required int pageNumber}) async {
    Response response =
        await getData("/movie/upcoming", params: {'page': pageNumber});

    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> results = data["results"];
      List<Movie> movies = [];
      for (dynamic json in results) {
        Movie movie = Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;
    } else {
      throw (response);
    }
  }

  Future<List<Movie>> getTopRatedMovie({required int pageNumber}) async {
    Response response =
        await getData("/movie/top_rated", params: {'page': pageNumber});

    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> results = data["results"];
      List<Movie> movies = [];
      for (dynamic json in results) {
        Movie movie = Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;
    } else {
      throw (response);
    }
  }

  Future<List<Genre>> getGenreByMovie({required String idMovie}) async {
    Response response = await getData("/movie" + idMovie + "/credits");
    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> results = data["genres"];
      List<Genre> genres = [];
      for (dynamic json in results) {
        Genre genre = Genre.fromJson(json);
        genres.add(genre);
      }
      return genres;
    } else {
      throw (response);
    }
  }

  Future<List<Credit>> getCastingByMovie({required String idMovie}) async {
    Response response = await getData("/movie" + idMovie + "/credits");
    if (response.statusCode == 200) {
      Map data = response.data;
      List<dynamic> results = data["cast"];
      List<Credit> credits = [];
      for (dynamic json in results) {
        Credit credit = Credit.fromJson(json);
        credits.add(credit);
      }
      return credits;
    } else {
      throw (response);
    }
  }
}
