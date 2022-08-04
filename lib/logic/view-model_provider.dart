import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/model/popular_movie_model.dart';
import 'package:movie_app/logic/view_model/latest_movie_vm.dart';
import 'package:movie_app/logic/view_model/popular_movie_vm.dart';
import 'package:movie_app/logic/view_model/toprated_movie_vm.dart';

import '../data/repository/movie_api.dart';

final popularMovieNotifierProvider =
    StateNotifierProvider.autoDispose<PopularMovieNotifier, PopularMovieState>(
        (ref) => PopularMovieNotifier(ref));

final topRatedMovieNotifierProvider = StateNotifierProvider.autoDispose<
    TopRatedMovieNotifier,
    TopRatedMovieState>((ref) => TopRatedMovieNotifier(ref));

final upComingMovieNotifierProvider =
    StateNotifierProvider.autoDispose<UpComingMovieNotifier, UpComingMovieState>(
        (ref) => UpComingMovieNotifier(ref));
