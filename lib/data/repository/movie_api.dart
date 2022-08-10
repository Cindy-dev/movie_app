import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/data/model/upcoming_movie_model.dart';
import 'package:movie_app/data/model/popular_movie_model.dart';
import 'package:movie_app/data/model/toprated_movie_model.dart';

class MovieApi {
  Future<PopularMovieModel> getPopularMovie() async {
    Logger logger = Logger();
    const url =
        'http://api.themoviedb.org/3/movie/popular?api_key=dec4ade0a55a7b54f6f93b20b043de03';
    var dio = Dio();
    try {
      final response = await dio.get(url);

      final popularMovieModel = PopularMovieModel.fromJson(response.data);
      return popularMovieModel;
    } catch (error) {
      throw error;
    }
  }

  Future<TopRatedMovieModel> getTopRatedMovie() async {
    Logger logger = Logger();
    const url =
        'https://api.themoviedb.org/3/movie/top_rated?api_key=dec4ade0a55a7b54f6f93b20b043de03';
    var dio = Dio();
    try {
      final response = await dio.get(url);

      final topRatedMovieModel = TopRatedMovieModel.fromJson(response.data);
      return topRatedMovieModel;
    } catch (error) {
      throw error;
    }
  }

  Future<UpComingMovieModel> getUpcomingMovie() async {
    Logger logger = Logger();
    const url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=dec4ade0a55a7b54f6f93b20b043de03&language=en-US';
    var dio = Dio();
    try {
      final response = await dio.get(url);
      final upcomingMovieModel = UpComingMovieModel.fromJson(response.data);
      return upcomingMovieModel;
    } catch (error) {
      throw error;
    }
  }
}

final movieApiProvider = Provider((ref) => MovieApi());
