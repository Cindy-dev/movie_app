import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/logic/view-model_provider.dart';

import '../../logic/view_model/movie_cast_vm.dart';
import '../helper/animation.dart';

class MovieCast extends ConsumerWidget {
  const MovieCast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final castViewModel = ref.watch(movieCastNotifierProvider);
    return Container(
      height: 250,
      child: Builder(builder: (context) {
        if (castViewModel is MovieCastInitial) {
        } else if (castViewModel is MovieCastLoading) {
          return circleProgress();
        } else if (castViewModel is MovieCastLoaded) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: castViewModel.movieCastModel.cast.length,
              itemBuilder: (context, i) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        height: 200,
                        width: 116,
                        margin: const EdgeInsets.fromLTRB(10, 8, 10, 17),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white60,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'http://image.tmdb.org/t/p/w500/${castViewModel.movieCastModel.cast[i].profilePath.toString()}'),
                              fit: BoxFit.cover,
                            ))),
                    Text(
                      castViewModel.movieCastModel.cast[i].name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                );
              });
        }
        return const Text(
          'list is empty',
          style: TextStyle(color: Colors.white),
        );
      }),
    );
  }
}
