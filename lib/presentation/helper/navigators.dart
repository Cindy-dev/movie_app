import 'package:flutter/cupertino.dart';

navigatePush(BuildContext context, Widget widget){
  return Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> widget));
}

navigatePop(BuildContext context){
  return Navigator.of(context).pop(context);
}