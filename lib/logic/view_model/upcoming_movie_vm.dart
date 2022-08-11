import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/model/upcoming_movie_model.dart';

import '../../data/repository/movie_api.dart';

abstract class UpComingMovieState {
  const UpComingMovieState();
}

class UpComingMovieInitial extends UpComingMovieState {
  const UpComingMovieInitial();
}

class UpComingMovieLoading extends UpComingMovieState {
  const UpComingMovieLoading();
}

class UpComingMovieLoaded extends UpComingMovieState {
  bool enabled = true;
  final UpComingMovieModel upComingMovieModel;
  UpComingMovieLoaded(this.upComingMovieModel);
}

class UpComingMovieError extends UpComingMovieState {
  final String error;
  const UpComingMovieError(this.error);
}

class UpComingMovieNotifier extends StateNotifier<UpComingMovieState> {
  final Ref ref;
  UpComingMovieNotifier(this.ref) : super(UpComingMovieInitial());
  Future<void> getMovie() async {
    state = UpComingMovieLoading();
    try {
      final result = await ref.read(movieApiProvider).getUpcomingMovie();
      state = UpComingMovieLoaded(result);
    } catch (error) {
      print(error);
      state = UpComingMovieError(error.toString());
    }
  }
}
