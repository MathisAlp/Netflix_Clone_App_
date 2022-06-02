import 'dart:convert';

import '../services/api.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  final int id;
  final String name;
  final String description;
  final String? posterPath;
  final String dateSortie;

  Movie(
      {required this.id,
      required this.name,
      required this.description,
      this.posterPath,
      required this.dateSortie});

  Movie copyWith({
    int? id,
    String? name,
    String? description,
    String? posterPath,
    String? dateSortie,
  }) {
    return Movie(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        posterPath: posterPath ?? this.posterPath,
        dateSortie: dateSortie ?? this.dateSortie);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'posterPath': posterPath,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      name: map['title'] as String,
      description: map['overview'] as String,
      posterPath: map['poster_path'],
      dateSortie: map['release_date'] as String,
    );
  }

  String postUrl() {
    Api api = Api();
    return api.baseImageUrl + posterPath!;
  }
}
