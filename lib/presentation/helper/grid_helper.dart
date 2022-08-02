import 'package:flutter/cupertino.dart';

Widget gridHelper() {
  return GridView(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, mainAxisSpacing: 1, childAspectRatio: 0.8),
    children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image/Rectangle 15.png'))),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image/Rectangle 17.png'))),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image/Rectangle 4.png'))),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image/Rectangle 4.png'))),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image/Rectangle 15.png'))),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image/Rectangle 4.png'))),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image/Rectangle 15.png'))),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image/Rectangle 17.png'))),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image/Rectangle 4.png'))),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image/Rectangle 4.png'))),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image/Rectangle 15.png'))),
      ),
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/image/Rectangle 4.png'))),
      ),

    ],
  );
}
