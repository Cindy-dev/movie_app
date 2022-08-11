import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

import '../../logic/view-model_provider.dart';
import '../../logic/view_model/toprated_movie_vm.dart';
import '../helper/navigators.dart';
import 'movie_detail_screen.dart';

class TopRatedViewMoreScreen extends ConsumerWidget {
  const TopRatedViewMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    final result = ref.watch(topRatedMovieNotifierProvider);
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
        if (result is TopRatedMovieLoaded) {
          return ListView.builder(
              itemCount: result.topRatedMovieModel.results.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    navigateWithAnimation(
                        context,
                        PageTransitionType.leftToRight,
                        MovieDetailScreen(
                          backdropPath:
                              result.topRatedMovieModel.results[i].backdropPath,
                          voteAverage:
                              result.topRatedMovieModel.results[i].voteAverage,
                          originalTitle: result
                              .topRatedMovieModel.results[i].originalTitle,
                          overview:
                              result.topRatedMovieModel.results[i].overview,
                          id: result.topRatedMovieModel.results[i].id,
                        ));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.network(
                        'http://image.tmdb.org/t/p/w500/${result.topRatedMovieModel.results[i].posterPath.toString()}',
                        fit: BoxFit.fitHeight,
                      ),
                      title: Text(result.topRatedMovieModel.results[i].title),
                      subtitle: Text(
                        result.topRatedMovieModel.results[i].overview,
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
