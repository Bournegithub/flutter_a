import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
// import '../utils/fluro_convert_util.dart';

// pages
import '../pages/advertising.dart';  // 广告页 首次加载或版本更新时使用
import '../pages/adwebview.dart'; // 点击广告页后打开的webview页面
import '../pages/splash.dart';  // 启动页 正常加载时使用
import '../pages/boot.dart'; // 引导页 首次启动或者版本更新时启用
import '../pages/home.dart';  // 首页

// 启动页
var splashHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new SplashPage();
});

var bootHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new BootPage();
});

var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new HomePage();
});

var adHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new ADPage();
});

var adwebviewHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new AdWebviewPage();
});