import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/data/repository/movie_api.dart';
import 'package:movie_app/logic/view-model_provider.dart';
import 'package:movie_app/logic/view_model/popular_movie_vm.dart';
import '../../data/model/toprated_movie_model.dart';
import '../../data/model/upcoming_movie_model.dart';
import '../../logic/view_model/latest_movie_vm.dart';
import '../../logic/view_model/toprated_movie_vm.dart';

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
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        alignment: Alignment.topLeft,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'asset/image/Group 1.png',
              ),
              const Text(
                'Welcome, Cindy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Consumer(builder: (context, ref, child) {
                final result = ref.watch(upComingMovieNotifierProvider);

                if (result is UpComingMovieInitial) {
                } else if (result is UpComingMovieLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Color.fromRGBO(201, 4, 4, 1),
                  ));
                } else if (result is UpComingMovieLoaded) {
                  return Container(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: result.upComingMovieModel.results.length,
                          itemBuilder: (context, i) {
                            return Container(
                                height: 200,
                                margin: const EdgeInsets.fromLTRB(0, 8, 10, 17),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'http://image.tmdb.org/t/p/w500/${result.upComingMovieModel.results[i].backdropPath.toString()}'))));
                          }));
                }
                return Text('No recent movie');
              }),
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
                    onTap: () {},
                    child: const Text(
                      'See all >',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 254, 254, 0.7),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Consumer(builder: (context, ref, child) {
                final result = ref.watch(topRatedMovieNotifierProvider);

                if (result is TopRatedMovieInitial) {
                } else if (result is TopRatedMovieLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Color.fromRGBO(201, 4, 4, 1),
                  ));
                } else if (result is TopRatedMovieLoaded) {
                  return Container(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: result.topRatedMovieModel.results.length,
                          itemBuilder: (context, i) {
                            return Container(
                                height: 200,
                                width: 116,
                                margin: const EdgeInsets.fromLTRB(0, 8, 10, 17),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'http://image.tmdb.org/t/p/w500/${result.topRatedMovieModel.results[i].posterPath.toString()}'))));
                          }));
                }
                return Text('List is empty');
              }),
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
                    onTap: () {},
                    child: const Text(
                      'See all >',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 254, 254, 0.7),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Consumer(builder: (context, ref, child) {
                final result = ref.watch(popularMovieNotifierProvider);

                if (result is PopularMovieInitial) {
                } else if (result is PopularMovieLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Color.fromRGBO(201, 4, 4, 1),
                  ));
                } else if (result is PopularMovieLoaded) {
                  return Container(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: result.popularMovieModel.results.length,
                          itemBuilder: (context, i) {
                            return Container(
                                height: 200,
                                width: 116,
                                margin: const EdgeInsets.fromLTRB(0, 8, 10, 17),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'http://image.tmdb.org/t/p/w500/${result.popularMovieModel.results[i].posterPath.toString()}'))));
                          }));
                }
                return Text('List is empty');
              }),
            ],
          ),
        ),
      ),
    );
  }
}
