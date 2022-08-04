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
  TopRatedMovieNotifier(this.ref) : super(TopRatedMovieInitial());
  Future<void> getMovie() async {
    print('loading');
    state = TopRatedMovieLoading();
    try {
      final result = await ref.watch(movieApiProvider).getTopRatedMovie();
      print('cindy${result.totalResults}');
      state = TopRatedMovieLoaded(result);
    } catch (error) {
      print(error);
      state = TopRatedMovieError(error.toString());
    }
  }
}
