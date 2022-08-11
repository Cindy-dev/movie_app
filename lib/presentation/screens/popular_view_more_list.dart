import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

import '../../logic/view-model_provider.dart';
import '../../logic/view_model/popular_movie_vm.dart';
import '../../logic/view_model/toprated_movie_vm.dart';
import '../helper/navigators.dart';
import 'movie_detail_screen.dart';

class PopularViewMoreScreen extends ConsumerWidget {
  const PopularViewMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    final popularViewModel = ref.watch(popularMovieNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navigatePop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Color.fromRGBO(201, 4, 4, 1),
      ),
      body: Builder(builder: (context) {
        if (popularViewModel is PopularMovieLoaded) {
          return ListView.builder(
              itemCount: popularViewModel.popularMovieModel.results.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    navigateWithAnimation(
                        context,
                        PageTransitionType.leftToRight,
                        MovieDetailScreen(
                          backdropPath: popularViewModel
                              .popularMovieModel.results[i].backdropPath,
                          voteAverage: popularViewModel
                              .popularMovieModel.results[i].voteAverage,
                          originalTitle: popularViewModel
                              .popularMovieModel.results[i].originalTitle,
                          overview: popularViewModel
                              .popularMovieModel.results[i].overview,
                          id: popularViewModel.popularMovieModel.results[i].id
                              .toInt(),
                        ));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.network(
                        'http://image.tmdb.org/t/p/w500/${popularViewModel.popularMovieModel.results[i].posterPath.toString()}',
                        fit: BoxFit.fitHeight,
                      ),
                      title: Text(
                          popularViewModel.popularMovieModel.results[i].title),
                      subtitle: Text(
                        popularViewModel.popularMovieModel.results[i].overview,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              });
        }
        return const Text('unable to load list');
      }),
    );
  }
}
