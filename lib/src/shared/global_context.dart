import 'package:flutter/cupertino.dart';

class GlobalContext {
  static final _instance = GlobalContext();

  final _navigatorKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get key => _instance._navigatorKey;

  static NavigatorState get nav => Navigator.of(GlobalContext.key.currentContext!);

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
}
