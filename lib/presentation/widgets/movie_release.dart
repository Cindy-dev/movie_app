import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/logic/view-model_provider.dart';
import 'package:movie_app/logic/view_model/movie_release_date_vm.dart';
import 'package:movie_app/presentation/helper/detail_container_helper.dart';
import 'package:movie_app/presentation/helper/movie_detail_helper.dart';

import '../helper/animation.dart';

class MovieReleaseWidget extends ConsumerWidget {
  final num vote;
  const MovieReleaseWidget({Key? key, required this.vote}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final releaseViewModel = ref.watch(movieReleadeDateNotifierProvider);
    return Builder(builder: (context) {
      if (releaseViewModel is MovieReleaseInitial) {
      } else if (releaseViewModel is MovieReleaseLoading) {
      } else if (releaseViewModel is MovieReleaseLoaded) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  detailContainer('${vote.toString()} / 10'),
                  detailContainer(releaseViewModel.date[0]),
                  detailContainer('${releaseViewModel.durationToString()} hrs')
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                  child: Divider(
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                    thickness: 1,
                  ),
                ),
                Container(
                  height: 50,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          releaseViewModel.movieReleaseDateModel.genres.length,
                      itemBuilder: (context, i) {
                        return detailContainer(
                          releaseViewModel.movieReleaseDateModel.genres[i].name,
                        );
                      }),
                ),
                const Expanded(
                  child: Divider(
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                    thickness: 1,
                  ),
                )
              ],
            ),
          ],
        );
      }
      return Container();
    });
  }
}
