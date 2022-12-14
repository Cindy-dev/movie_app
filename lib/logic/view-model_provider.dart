import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/model/popular_movie_model.dart';
import 'package:movie_app/logic/view_model/movie_cast_vm.dart';
import 'package:movie_app/logic/view_model/movie_release_date_vm.dart';
import 'package:movie_app/logic/view_model/upcoming_movie_vm.dart';
import 'package:movie_app/logic/view_model/popular_movie_vm.dart';
import 'package:movie_app/logic/view_model/toprated_movie_vm.dart';

import '../data/repository/movie_api.dart';

final popularMovieNotifierProvider =
    StateNotifierProvider.autoDispose<PopularMovieNotifier, PopularMovieState>(
        (ref) => PopularMovieNotifier(ref));

final topRatedMovieNotifierProvider = StateNotifierProvider.autoDispose<
    TopRatedMovieNotifier,
    TopRatedMovieState>((ref) => TopRatedMovieNotifier(ref));

final upComingMovieNotifierProvider = StateNotifierProvider.autoDispose<
    UpComingMovieNotifier,
    UpComingMovieState>((ref) => UpComingMovieNotifier(ref));

final movieCastNotifierProvider =
    StateNotifierProvider.autoDispose<MovieCastNotifier, MovieCastState>(
        (ref) => MovieCastNotifier(ref));

final movieReleadeDateNotifierProvider =
    StateNotifierProvider.autoDispose<MovieReleaseNotifier, MovieReleaseState>(
        (ref) => MovieReleaseNotifier(ref));
