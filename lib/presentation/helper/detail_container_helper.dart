import 'package:flutter/material.dart';

Widget detailContainer(String data){
  return Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.only(left: 4, right: 4),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
            color: const Color.fromRGBO(197, 197, 197, 0.8))),
    child: Text(
      data,
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey),
    ),
  );
}