import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'routerHandle.dart';

class Routes {
  static Router _router; 
  static String root = '/';
  static String boot = '/boot';
  static String advertising = '/advertising';
  static String home = '/home';
  static void configureRoutes(Router router) {
    _router = router;
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    _router.define(root, handler: bootHandler);
    _router.define(advertising, handler: homeHandler);
    _router.define(boot, handler: bootHandler);
    _router.define(home, handler: homeHandler);
  }
  static navigateTo(BuildContext context, String path) {
    _router.navigateTo(context, path);
  }
}