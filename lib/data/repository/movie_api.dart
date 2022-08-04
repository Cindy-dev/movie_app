import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/data/model/popular_movie_model.dart';

class MovieApi {
  Future<PopularMovieModel> getPopularMovie() async {
    //final PopularMovieModel popularMovieModel;
    Logger logger = Logger();
    const url =
        'http://api.themoviedb.org/3/movie/popular?api_key=dec4ade0a55a7b54f6f93b20b043de03';
    var dio = Dio();
    try {
      final response = await dio.get(url);
      logger.wtf(response.data);

      final popularMovieModel = PopularMovieModel.fromJson(response.data);
      return popularMovieModel;
    } catch (error) {

      throw error;
    }
  }
}

final movieApiProvider = Provider((ref) => MovieApi());
