import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/helper/grid_helper.dart';
import 'package:movie_app/presentation/helper/navigators.dart';
import 'package:movie_app/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5),
            () => navigatePush(context,  HomeScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            gridHelper(),
            Positioned(
              bottom: 0,
              left: 100,
              right: 100,
              child: Column(
                children: [
                  const Text(
                    'Unlimited entertainment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset('asset/image/Ellipse 1.png')
                ],
              ),
            ),
          ],
        ));
  }
}
