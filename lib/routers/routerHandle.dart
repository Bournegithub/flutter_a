import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../utils/fluro_convert_util.dart';

// pages
import '../pages/advertising.dart';  // 广告页 首次加载或版本更新时使用
import '../pages/adwebview.dart'; // 点击广告页后打开的webview页面
import '../pages/splash.dart';  // 启动页 正常加载时使用
import '../pages/boot.dart'; // 引导页 首次启动或者版本更新时启用
import '../pages/home.dart';  // 首页
import '../pages/login.dart'; // 登录
import '../pages/setting.dart'; // 设置
import '../pages/githubwebview.dart'; // githubwebview页面
import '../pages/detail.dart'; // 详细页

// compoentspage
import '../pages/compoentsPage/chip.dart';
import '../pages/compoentsPage/dataTable.dart';
import '../pages/compoentsPage/datepickers.dart';
import '../pages/compoentsPage/dialog.dart';
import '../pages/compoentsPage/drawer.dart';
import '../pages/compoentsPage/expansionPanel.dart';
import '../pages/compoentsPage/form.dart';
import '../pages/compoentsPage/placeholder.dart';
import '../pages/compoentsPage/rowColumn.dart';
import '../pages/compoentsPage/scaffold.dart';
import '../pages/compoentsPage/stepper.dart';
import '../pages/compoentsPage/tabBar.dart';

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
  String index = params['index']?.first;
  String paramsJson = params['paramsJson']?.first;
  return HomePage(
    index: FluroConvertUtils.string2int(index),
    paramsJson: paramsJson,
  );
    // return new HomePage();
});

var adHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new ADPage();
});

var adwebviewHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new AdWebviewPage();
});

var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new LoginPage();
});

var settingHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new SettingPage();
});
var githubHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new GithubviewPage();
});
// compoentspage
var chipHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new CPChip();
});
var datatableHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new CPDataTable();
});
var datepickersHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new CPDatePickers();
});
var dialogHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new CPDialog();
});
var drawerHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new CPDrawer();
});
var panelHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new CPPanel();
});
var formHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new CPForm();
});
var placeholderHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new CPPlaceholder();
});
var rowcloumnHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new CPRowColumn();
});
var scaffoldHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new CPScaffold();
});
var stepperHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new CPStepper();
});
var tabbarHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new CPTabBar();
});

var detailHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String exampleint = params['paramsInt']?.first;
    String examplestring = params['paramsString']?.first;
    String examplebool = params['paramsBool']?.first;
    String paramsjson = params['paramsJson']?.first;
    return DetailPage(
      paramsInt: FluroConvertUtils.string2int(exampleint),
      paramsString: examplestring,
      paramsBool: FluroConvertUtils.string2bool(examplebool),
      paramsJson: paramsjson,
    );
});