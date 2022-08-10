import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/helper/movie_detail_helper.dart';
import 'package:movie_app/presentation/helper/navigators.dart';

class MovieDetailScreen extends StatefulWidget {
  final String overview;
  final num voteAverage;
  final String originalTitle;
  final String backdropPath;
  const MovieDetailScreen(
      {Key? key,
      required this.overview,
      required this.voteAverage,
      required this.originalTitle,
      required this.backdropPath,
      })
      : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 500,
                    margin: const EdgeInsets.only(bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'http://image.tmdb.org/t/p/w500/${widget.backdropPath}'),
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
              Text(
                widget.originalTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffEF5050)),
              ),
              // movieProducerRow(widget.result.),
              movieRatingStar(widget.voteAverage),
              movieDetailRow(),
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
            ],
          ),
        ),
      ),
    );
  }
}
