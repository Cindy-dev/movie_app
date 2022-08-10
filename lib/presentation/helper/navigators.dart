import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

navigatePush(BuildContext context, Widget widget) {
  return Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) => widget, fullscreenDialog: true));
}

navigatePop(BuildContext context) {
  return Navigator.of(context).pop(context);
}

navigateWithAnimation(
    BuildContext context, PageTransitionType type, Widget child) {
  Navigator.push(
    context,
    PageTransition(
      curve: Curves.bounceIn,
      type: type,
      child: child,
    ),
  );
}
