import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    final readupcomingViewModel =
    ref.read(upComingMovieNotifierProvider.notifier);
    return Expanded(
      flex: 2,
      child: Center(
        child: Consumer(builder: (context, ref, child) {
          if (upcomingViewModel is UpComingMovieInitial) {
          } else if (upcomingViewModel is UpComingMovieLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color.fromRGBO(201, 4, 4, 1),
            ));
          } else if (upcomingViewModel is UpComingMovieLoaded) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upcomingViewModel.upComingMovieModel.results.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      navigatePush(
                          context,
                          MovieDetailScreen(
                              result: upcomingViewModel.upComingMovieModel.results[i]));
                    },
                    child: Container(
                        height: height * .05,
                        width: width * .7,
                        margin: const EdgeInsets.fromLTRB(0, 8, 10, 17),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'http://image.tmdb.org/t/p/w500/${upcomingViewModel.upComingMovieModel.results[i].posterPath.toString()}'),
                                fit: BoxFit.cover))),
                  );
                });
          }
          return const Text('No recent movie');
        }),
      ),
    );
  }
}
