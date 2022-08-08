import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/data/model/popular_movie_model.dart';
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
  final PopularMovieModel popularMovieModel;
  const PopularMovieLoaded(this.popularMovieModel);
}

class PopularMovieError extends PopularMovieState {
  final String error;
  const PopularMovieError(this.error);
}

class PopularMovieNotifier extends StateNotifier<PopularMovieState> {
  final Ref ref;
  PopularMovieNotifier(this.ref) : super(PopularMovieInitial());
  Future<void> getMovie() async {
    state = PopularMovieLoading();
    try {
      final result = await ref.watch(movieApiProvider).getPopularMovie();
      state = PopularMovieLoaded(result);
    } catch (error) {
      print(error);
      state = PopularMovieError(error.toString());
    }
  }
}
