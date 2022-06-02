// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Credit {
  final int id;
  final String movieActorname;
  final String realActorname;
  final String pathProfil;

  Credit({
    required this.id,
    required this.movieActorname,
    required this.realActorname,
    required this.pathProfil,
  });

  Credit copyWith({
    int? id,
    String? movieActorname,
    String? realActorname,
    String? pathProfil,
  }) {
    return Credit(
      id: id ?? this.id,
      movieActorname: movieActorname ?? this.movieActorname,
      realActorname: realActorname ?? this.realActorname,
      pathProfil: pathProfil ?? this.pathProfil,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'movieActorname': movieActorname,
      'realActorname': realActorname,
      'pathProfil': pathProfil,
    };
  }

  factory Credit.fromJson(Map<String, dynamic> map) {
    return Credit(
      id: map['id'] as int,
      movieActorname: map['character'] as String,
      realActorname: map['original_name'] as String,
      pathProfil: map['profile_path'] as String,
    );
  }
}
