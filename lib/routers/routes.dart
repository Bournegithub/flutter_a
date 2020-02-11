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
  static String login = '/login';
  static String setting = '/setting';
  static String github = '/github';
  static String detail = '/detail';
  // compoentspage
  static String chip = '/cpchip';
  static String datatable = '/cpdatatable';
  static String datepickers = '/cpdatepickers';
  static String dialog = '/cpdialog';
  static String drawer = '/cpdrawer';
  static String panel = '/cppanel';
  static String form = '/cpform';
  static String placeholder = '/cpplaceholder';
  static String rowcloumn = '/cprowcloumn';
  static String scaffold = '/cpscaffold';
  static String stepper = '/cpstepper';
  static String tabbar = '/cptabbar';

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
    _router.define(login, handler: loginHandler);
    _router.define(setting, handler: settingHandler);
    _router.define(github, handler: githubHandler);
    _router.define(detail, handler: detailHandler);
    _router.define(chip, handler: chipHandler);
    _router.define(datatable, handler: datatableHandler);
    _router.define(datepickers, handler: datepickersHandler);
    _router.define(dialog, handler: dialogHandler);
    _router.define(drawer, handler: drawerHandler);
    _router.define(panel, handler: panelHandler);
    _router.define(form, handler: formHandler);
    _router.define(placeholder, handler: placeholderHandler);
    _router.define(rowcloumn, handler: rowcloumnHandler);
    _router.define(scaffold, handler: scaffoldHandler);
    _router.define(stepper, handler: stepperHandler);
    _router.define(tabbar, handler: tabbarHandler);
  }
  static navigateTo(BuildContext context, String path) {
    _router.navigateTo(context, path);
  }
}