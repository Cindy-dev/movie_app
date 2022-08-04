import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/model/popular_movie_model.dart';
import 'package:movie_app/logic/view_model/popular_movie_vm.dart';

import '../data/repository/movie_api.dart';

final popularMovieNotifierProvider = StateNotifierProvider.autoDispose<PopularMovieNotifier, PopularMovieState>(
        (ref) => PopularMovieNotifier(ref));