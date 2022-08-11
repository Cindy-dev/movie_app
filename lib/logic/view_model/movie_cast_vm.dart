import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/data/model/movie_cast_model.dart';
import 'package:movie_app/data/repository/movie_api.dart';

abstract class MovieCastState {
  const MovieCastState();
}

class MovieCastInitial extends MovieCastState {
  const MovieCastInitial();
}

class MovieCastLoading extends MovieCastState {
  const MovieCastLoading();
}

class MovieCastLoaded extends MovieCastState {
  final MovieCastModel movieCastModel;
  MovieCastLoaded(this.movieCastModel);
}

class MovieCastError extends MovieCastState {
  final String error;
  const MovieCastError(this.error);
}

class MovieCastNotifier extends StateNotifier<MovieCastState> {
  final Ref ref;
  MovieCastNotifier(this.ref) : super(const MovieCastInitial());

  Future<void> getCast(int id) async {
    state = const MovieCastLoading();
    try {
      final result = await ref.read(movieApiProvider).getMovieCast(id);
      state = MovieCastLoaded(result);
    } catch (e) {
      state = MovieCastError(e.toString());
    }
  }
}
