import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

import '../../logic/view-model_provider.dart';
import '../../logic/view_model/toprated_movie_vm.dart';
import '../helper/animation.dart';
import '../helper/navigators.dart';
import '../screens/movie_detail_screen.dart';

class TopRatedMoviesWidget extends ConsumerWidget {
  const TopRatedMoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Center(
        child: Builder(builder: (context) {
          final result = ref.watch(topRatedMovieNotifierProvider);

          if (result is TopRatedMovieInitial) {
          } else if (result is TopRatedMovieLoading) {
            return circleProgress();
          } else if (result is TopRatedMovieLoaded) {
            return Container(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: result.topRatedMovieModel.results.length > 5
                        ? 10
                        : result.topRatedMovieModel.results.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          navigateWithAnimation(
                              context,
                              PageTransitionType.leftToRight,
                              MovieDetailScreen(
                                backdropPath: result
                                    .topRatedMovieModel.results[i].backdropPath,
                                voteAverage: result
                                    .topRatedMovieModel.results[i].voteAverage,
                                originalTitle: result.topRatedMovieModel
                                    .results[i].originalTitle,
                                overview: result
                                    .topRatedMovieModel.results[i].overview,
                                id: result.topRatedMovieModel.results[i].id,
                              ));
                        },
                        child: Container(
                            height: 200,
                            width: 116,
                            margin: const EdgeInsets.fromLTRB(0, 8, 10, 17),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white60,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500/${result.topRatedMovieModel.results[i].posterPath.toString()}',
                                    ),
                                    fit: BoxFit.cover))),
                      );
                    }));
          }
          return const Text('Unable to load top rated movies',
              style: TextStyle(color: Colors.white, fontSize: 20));
        }),
      ),
    );
  }
}
