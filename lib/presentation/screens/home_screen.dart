import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/logic/view-model_provider.dart';
import 'package:movie_app/presentation/helper/navigators.dart';
import 'package:movie_app/presentation/screens/popular_view_more_list.dart';
import 'package:movie_app/presentation/screens/view_more_list.dart';
import 'package:movie_app/presentation/widgets/popular_movie_widget.dart';
import 'package:movie_app/presentation/widgets/toprated_movie_widget.dart';
import 'package:movie_app/presentation/widgets/upcoming_movies_widget.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(popularMovieNotifierProvider.notifier).getMovie();
    ref.read(topRatedMovieNotifierProvider.notifier).getMovie();
    ref.read(upComingMovieNotifierProvider.notifier).getMovie();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 10, top: 50),
        alignment: Alignment.topLeft,
        height: height,
        width: width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(201, 4, 4, 1),
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(67, 7, 7, 1),
              Color.fromRGBO(0, 0, 0, 1)
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      ref.read(popularMovieNotifierProvider.notifier).getMovie();
                      ref.read(topRatedMovieNotifierProvider.notifier).getMovie();
                      ref.read(upComingMovieNotifierProvider.notifier).getMovie();
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: Color.fromRGBO(255, 254, 254, 0.7),
                    ))),
            const Text(
              'Upcoming Movies',
              style: TextStyle(
                color: Color.fromRGBO(255, 254, 254, 0.7),
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            const UpcomingMoviesWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Top Rated',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 254, 254, 0.7),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navigateWithAnimation(
                        context,
                        PageTransitionType.topToBottom,
                        const TopRatedViewMoreScreen());
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'See all >',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 254, 254, 0.7),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TopRatedMoviesWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 254, 254, 0.7),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navigateWithAnimation(
                        context,
                        PageTransitionType.topToBottom,
                        const PopularViewMoreScreen());
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'See all >',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 254, 254, 0.7),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const PopularMovieWidget(),
          ],
        ),
      ),
    );
  }
}
