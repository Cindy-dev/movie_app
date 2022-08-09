import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/model/upcoming_movie_model.dart';
import 'package:movie_app/presentation/helper/movie_detail_helper.dart';

class MovieDetailScreen extends StatefulWidget {
 final  Result result;
  const MovieDetailScreen({Key? key, required this.result}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
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
          child: Column(
            children: [
              Container(
                height: 360,
                margin: const EdgeInsets.only(bottom: 23),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12))),
              ),
              Text(
                widget.result.originalTitle,
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffEF5050)),
              ),
              movieProducerRow(),
              movieRatingStar(),
              movieDetailRow(),
              Row(
                children: const [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 9),
                    child: Text(
                      'Black Widow is a 2021 American superhero film based on Marvel Comics featuring the character of the same name. Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures, it is the 24th film in the Marvel Cinematic Universe (MCU)...Read More ',
                      style: TextStyle(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cast',
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
                        color: Color(0xffEF5050),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 93,
                width: 82,
                margin: EdgeInsets.fromLTRB(0, 22, 0, 17),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
