import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/helper/navigators.dart';
import 'package:movie_app/presentation/screens/movie_detail_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../logic/view-model_provider.dart';
import '../../logic/view_model/popular_movie_vm.dart';
import '../helper/animation.dart';

//map the data by creating a detail model

class PopularMovieWidget extends ConsumerWidget {
  const PopularMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularViewModel = ref.watch(popularMovieNotifierProvider);
    return Expanded(
      child: Center(
        child: Builder(builder: (context) {
          if (popularViewModel is PopularMovieInitial) {
          } else if (popularViewModel is PopularMovieLoading) {
            return circleProgress();
          } else if (popularViewModel is PopularMovieLoaded) {
            return Container(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        popularViewModel.popularMovieModel.results.length > 5
                            ? 5
                            : popularViewModel.popularMovieModel.results.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          navigateWithAnimation(
                              context,
                              PageTransitionType.rightToLeft,
                              MovieDetailScreen(
                                backdropPath: popularViewModel
                                    .popularMovieModel.results[i].backdropPath,
                                voteAverage: popularViewModel
                                    .popularMovieModel.results[i].voteAverage,
                                originalTitle: popularViewModel
                                    .popularMovieModel.results[i].originalTitle,
                                overview: popularViewModel
                                    .popularMovieModel.results[i].overview,
                                id: popularViewModel
                                    .popularMovieModel.results[i].id.toInt(),
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
                                      'http://image.tmdb.org/t/p/w500/${popularViewModel.popularMovieModel.results[i].posterPath.toString()}'),
                                  fit: BoxFit.cover,
                                ))),
                      );
                    }));
          }
          return const Text('List is empty',
              style: TextStyle(color: Colors.white, fontSize: 20));
        }),
      ),
    );
  }
}
