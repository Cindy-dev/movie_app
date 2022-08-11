import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/helper/animation.dart';
import 'package:page_transition/page_transition.dart';
import '../../logic/view-model_provider.dart';
import '../../logic/view_model/upcoming_movie_vm.dart';
import '../helper/navigators.dart';
import '../screens/movie_detail_screen.dart';

class UpcomingMoviesWidget extends ConsumerWidget {
  const UpcomingMoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final upcomingViewModel = ref.watch(upComingMovieNotifierProvider);
    return Expanded(
      flex: 2,
      child: Center(
        child: Builder(builder: (context) {
          if (upcomingViewModel is UpComingMovieInitial) {
          } else if (upcomingViewModel is UpComingMovieLoading) {
            return circleProgress();
          } else if (upcomingViewModel is UpComingMovieLoaded) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upcomingViewModel.upComingMovieModel.results.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      navigateWithAnimation(
                          context,
                          PageTransitionType.bottomToTop,
                          MovieDetailScreen(
                            backdropPath: upcomingViewModel
                                .upComingMovieModel.results[i].backdropPath,
                            voteAverage: upcomingViewModel
                                .upComingMovieModel.results[i].voteAverage,
                            originalTitle: upcomingViewModel
                                .upComingMovieModel.results[i].originalTitle,
                            overview: upcomingViewModel
                                .upComingMovieModel.results[i].overview,
                            id: upcomingViewModel
                                .upComingMovieModel.results[i].id,
                          ));
                    },
                    child: Container(
                        height: height * .05,
                        width: width * .7,
                        margin: const EdgeInsets.fromLTRB(0, 8, 10, 17),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white60,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'http://image.tmdb.org/t/p/w500/${upcomingViewModel.upComingMovieModel.results[i].posterPath.toString()}'),
                                fit: BoxFit.cover))),
                  );
                });
          }
          return const Text('No recent movie',
              style: TextStyle(color: Colors.white, fontSize: 20));
        }),
      ),
    );
  }
}
