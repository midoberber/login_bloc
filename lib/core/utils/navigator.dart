import 'package:flutter/material.dart';

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> push({required Widget screen}) async {
    navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => screen));
  }

  Future<void> pushReplacement({required Widget screen}) async {
    AppNavigator.navigatorKey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (context) => screen));
  }

  dynamic pop({dynamic object}) {
    return AppNavigator.navigatorKey.currentState!.pop<dynamic>(object);
  }

  dynamic popUtill({required Widget screen}) {
    return AppNavigator.navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (c) => screen), (route) => false);
  }

  dynamic popToFrist({dynamic object}) {
    return AppNavigator.navigatorKey.currentState!
        .popUntil((rout) => rout.isFirst);
  }

  dynamic pushToFirst({required Widget screen}) {
    return AppNavigator.navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => screen),
        (Route<dynamic> route) => false);
  }
}
