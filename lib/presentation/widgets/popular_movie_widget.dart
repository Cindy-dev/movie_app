import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/helper/navigators.dart';
import 'package:movie_app/presentation/screens/movie_detail_screen.dart';

import '../../logic/view-model_provider.dart';
import '../../logic/view_model/popular_movie_vm.dart';

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
            return const Center(
                child: CircularProgressIndicator(
              color: Color.fromRGBO(201, 4, 4, 1),
            ));
          } else if (popularViewModel is PopularMovieLoaded) {
            return Container(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        popularViewModel.popularMovieModel.results.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          navigatePush(
                              context,
                              MovieDetailScreen(
                                backdropPath: popularViewModel
                                    .popularMovieModel.results[i].backdropPath,
                                voteAverage: popularViewModel
                                    .popularMovieModel.results[i].voteAverage,
                                originalTitle: popularViewModel
                                    .popularMovieModel.results[i].originalTitle,
                                overview: popularViewModel
                                    .popularMovieModel.results[i].overview,
                              ));
                        },
                        child: Container(
                            height: 200,
                            width: 116,
                            margin: const EdgeInsets.fromLTRB(0, 8, 10, 17),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500/${popularViewModel.popularMovieModel.results[i].posterPath.toString()}'),
                                  fit: BoxFit.cover,
                                ))),
                      );
                    }));
          }
          return Text('List is empty');
        }),
      ),
    );
  }
}