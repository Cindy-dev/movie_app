import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/data/model/popular_movie_model.dart';

class MovieApi {
  Future<PopularMovieModel> getPopularMovie() async {
    late final PopularMovieModel popularMovieModel;
    const url =
        'http://api.themoviedb.org/3/movie/popular?api_key=dec4ade0a55a7b54f6f93b20b043de03';
    var dio = Dio();
    try {
      final response = await dio.get(url);
      if (kDebugMode) {
        print(json.decode(response.data));
      }
      popularMovieModel = popularMovieModelFromJson(response.data.toString());
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    return popularMovieModel;
  }
}
