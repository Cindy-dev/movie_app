// To parse this JSON data, do
//
//     final movieCastModel = movieCastModelFromJson(jsonString);

import 'dart:convert';

MovieCastModel movieCastModelFromJson(String str) =>
    MovieCastModel.fromJson(json.decode(str));

String movieCastModelToJson(MovieCastModel data) => json.encode(data.toJson());

class MovieCastModel {
  MovieCastModel({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<Cast> cast;
  List<Cast> crew;

  factory MovieCastModel.fromJson(Map<String, dynamic> json) => MovieCastModel(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}

class Cast {
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    //  required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    // required   this.department,
    required this.job,
  });

  bool adult;
  num gender;
  int id;
  //Department knownForDepartment;
  String name;
  String originalName;
  num popularity;
  String profilePath;
  num castId;
  String character;
  String creditId;
  num order;
  // Department department;
  String job;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        // knownForDepartment: departmentValues.map[json["known_for_department"]],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"],
        profilePath: json["profile_path"] == null ? '' : json["profile_path"],
        castId: json["cast_id"] == null ? 0 : json["cast_id"],
        character: json["character"] == null ? '' : json["character"],
        creditId: json["credit_id"],
        order: json["order"] == null ? 0 : json["order"],
        //  department: json["department"] == null ? null : departmentValues.map[json["department"]],
        job: json["job"] == null ? '' : json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        //  "known_for_department": departmentValues.reverse[knownForDepartment],
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath == null ? '' : profilePath,
        "cast_id": castId == null ? 0 : castId,
        "character": character == null ? '' : character,
        "credit_id": creditId,
        "order": order == null ? 0 : order,
        //  "department": department == null ? null : departmentValues.reverse[department],
        "job": job == null ? '' : job,
      };
}

enum Department {
  ACTING,
  SOUND,
  DIRECTING,
  PRODUCTION,
  VISUAL_EFFECTS,
  WRITING,
  EDITING,
  ART
}

final departmentValues = EnumValues({
  "Acting": Department.ACTING,
  "Art": Department.ART,
  "Directing": Department.DIRECTING,
  "Editing": Department.EDITING,
  "Production": Department.PRODUCTION,
  "Sound": Department.SOUND,
  "Visual Effects": Department.VISUAL_EFFECTS,
  "Writing": Department.WRITING
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
