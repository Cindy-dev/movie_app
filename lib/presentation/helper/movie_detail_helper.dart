import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

movieDetailRow() {
  return Row(
    children: [
      const Expanded(
        child: Divider(
          color: Color.fromRGBO(255, 255, 255, 0.8),
          thickness: 1,
        ),
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border:
                  Border.all(color: const Color.fromRGBO(197, 197, 197, 0.8))),
          child: const Text(
            '2021',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
        ),
      ),
      Expanded(
          child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(left: 4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border:
                Border.all(color: const Color.fromRGBO(197, 197, 197, 0.8))),
        child: const Text(
          '2h 13m',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
      )),
      Expanded(
          child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border:
                Border.all(color: const Color.fromRGBO(197, 197, 197, 0.8))),
        child: const Text(
          '12+',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
      )),
      const Expanded(
        child: Divider(
          color: Color.fromRGBO(255, 255, 255, 0.8),
          thickness: 1,
        ),
      ),
    ],
  );
}

movieProducerRow() {
  return const Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        'Marvel Studios - Black Widow',
        style: TextStyle(
            color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
      ));
}

movieRatingStar() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 29),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.star,
          color: Colors.redAccent,
        ),
        Text(
          '4.8/5',
          style: TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300),
        )
      ],
    ),
  );
}
