import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

navigatePush(BuildContext context, Widget widget) {
  return Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) => widget, fullscreenDialog: true));
}

navigatePop(BuildContext context) {
  return Navigator.of(context).pop(context);
}
