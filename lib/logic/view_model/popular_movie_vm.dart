import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/data/repository/movie_api.dart';

abstract class PopularMovieState {
  const PopularMovieState();
}

class PopularMovieInitial extends PopularMovieState {
  const PopularMovieInitial();
}

class PopularMovieLoading extends PopularMovieState {
  const PopularMovieLoading();
}

class PopularMovieLoaded extends PopularMovieState {
  final MovieApi movieApi;
  const PopularMovieLoaded(this.movieApi);
}

class PopularMovieError extends PopularMovieState {
  final String error;
  const PopularMovieError(this.error);
}

class PopularMovieNotifier extends StateNotifier<PopularMovieState> {
  PopularMovieNotifier() : super(PopularMovieInitial());

}
