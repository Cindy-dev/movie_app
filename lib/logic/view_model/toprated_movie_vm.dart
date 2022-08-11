import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/model/toprated_movie_model.dart';

import '../../data/repository/movie_api.dart';

abstract class TopRatedMovieState {
  const TopRatedMovieState();
}

class TopRatedMovieInitial extends TopRatedMovieState {
  const TopRatedMovieInitial();
}

class TopRatedMovieLoading extends TopRatedMovieState {
  const TopRatedMovieLoading();
}

class TopRatedMovieLoaded extends TopRatedMovieState {
  final TopRatedMovieModel topRatedMovieModel;
  const TopRatedMovieLoaded(this.topRatedMovieModel);
}

class TopRatedMovieError extends TopRatedMovieState {
  final String error;
  const TopRatedMovieError(this.error);
}

class TopRatedMovieNotifier extends StateNotifier<TopRatedMovieState> {
  final Ref ref;
  TopRatedMovieNotifier(this.ref) : super(const TopRatedMovieInitial());
  Future<void> getMovie() async {
    state = const TopRatedMovieLoading();
    try {
      final result = await ref.read(movieApiProvider).getTopRatedMovie();
      state = TopRatedMovieLoaded(result);
    } catch (error) {
      debugPrint(error.toString());
      state = TopRatedMovieError(error.toString());
    }
  }
}
