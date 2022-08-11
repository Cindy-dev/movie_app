import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/data/model/movie_release_date.dart';
import 'package:movie_app/data/repository/movie_api.dart';

abstract class MovieReleaseState {
  const MovieReleaseState();
}

class MovieReleaseInitial extends MovieReleaseState {
  const MovieReleaseInitial();
}

class MovieReleaseLoading extends MovieReleaseState {
  const MovieReleaseLoading();
}

class MovieReleaseLoaded extends MovieReleaseState {
  final MovieReleaseDateModel movieReleaseDateModel;
  late List<String> date;
  MovieReleaseLoaded(this.movieReleaseDateModel, this.date);
}

class MovieReleaseError extends MovieReleaseState {
  final String error;
  const MovieReleaseError(this.error);
}

class MovieReleaseNotifier extends StateNotifier<MovieReleaseState> {
  Ref ref;
  MovieReleaseNotifier(this.ref) : super(const MovieReleaseInitial());

  Future<void> getReleaseDate(int id) async {
    state = const MovieReleaseLoading();
    try {
      final result = await ref.read(movieApiProvider).getMovieReleaseDate(id);
      state =
          MovieReleaseLoaded(result, result.releaseDate.toString().split('-'));
    } catch (error) {
      throw error;
    }
  }
}
