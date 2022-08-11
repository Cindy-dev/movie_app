import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/data/model/popular_movie_model.dart';
import 'package:movie_app/logic/view-model_provider.dart';
import 'package:movie_app/presentation/helper/movie_detail_helper.dart';
import 'package:movie_app/presentation/helper/navigators.dart';
import 'package:movie_app/presentation/widgets/movie_cast.dart';
import 'package:movie_app/presentation/widgets/movie_release.dart';

import '../../logic/view_model/movie_cast_vm.dart';
import '../helper/animation.dart';

class MovieDetailScreen extends StatefulHookConsumerWidget {
  final String overview;
  final num voteAverage;
  final String originalTitle;
  final String backdropPath;
  final int id;
  const MovieDetailScreen({
    Key? key,
    required this.overview,
    required this.voteAverage,
    required this.originalTitle,
    required this.backdropPath,
    required this.id,
  }) : super(key: key);

  @override
  ConsumerState<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(movieCastNotifierProvider.notifier).getCast(widget.id);
    ref
        .read(movieReleadeDateNotifierProvider.notifier)
        .getReleaseDate(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final castViewModel = ref.watch(movieCastNotifierProvider);
    return Scaffold(
      body: Container(
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  height: 500,
                  margin: const EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://image.tmdb.org/t/p/w300/${widget.backdropPath}'),
                          fit: BoxFit.fill),
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12))),
                ),
                Positioned(
                    top: 30,
                    left: 15,
                    child: IconButton(
                        onPressed: () => navigatePop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ))),
              ],
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Text(
                    widget.originalTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffEF5050)),
                  ),
                  MovieReleaseWidget(
                    vote: widget.voteAverage,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 10, right: 10),
                        child: Text(
                          widget.overview.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      )),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Movie Cast',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  const MovieCast(),
                ],
              ),
            ),
            // movieProducerRow(widget.result.),
          ],
        ),
      ),
    );
  }
}
