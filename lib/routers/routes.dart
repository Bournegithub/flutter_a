import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routerHandle.dart';

class Routes {
  static Router _router; 
  static String root = '/';
  static String splash = '/splash';
  static String boot = '/boot';
  static String advertising = '/advertising';
  static String home = '/home';
  static String adwebview = '/adWebview';
  static void configureRoutes(Router router) {
    _router = router;
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    _router.define(root, handler: splashHandler);
    _router.define(splash, handler: splashHandler);
    _router.define(boot, handler: bootHandler);
    _router.define(advertising, handler: adHandler);
    _router.define(home, handler: homeHandler);
    _router.define(adwebview, handler: adwebviewHandler);
  }
  static navigateTo(BuildContext context, String path) {
    _router.navigateTo(context, path);
  }
}