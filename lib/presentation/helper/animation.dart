import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget circleProgress(){
  return Center(
      child: TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1),
  duration: const Duration(milliseconds: 500),
  builder: (context, value, _) => CircularProgressIndicator(
  value: value,
  color: const Color.fromRGBO(201, 4, 4, 1),
  ),
  ));
}

