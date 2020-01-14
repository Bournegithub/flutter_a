import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
// import '../utils/fluro_convert_util.dart';

// pages
import '../pages/advertising.dart';  // 广告页 首次加载或版本更新时使用
import '../pages/boot.dart';  // 引导页 正常加载时使用
import '../pages/home.dart';  // 首页

var bootHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new RootPage();
});

var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new HomePage();
});

var adHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new ADPage();
});