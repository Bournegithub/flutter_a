import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './application.dart';
// import '../utils/fluro_convert_util.dart';
import './routes.dart';


class NavigatorUtil {
  /// 返回
  static void goBack(BuildContext context) {
    /// 其实这边调用的是 Navigator.pop(context);
    Application.router.pop(context);
  }

  /// 带参数的返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  /// 跳转到主页面
  static void goHomePage(BuildContext context) {
    Application.router.navigateTo(context, Routes.home, replace: true, transition: TransitionType.cupertino);
  }
  // 跳转到引导页
  static void goBootPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.boot, replace: true, transition: TransitionType.cupertino);
  }
  // 跳转到广告页
  static void goADPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.advertising, replace: true, transition: TransitionType.cupertino);
  }
  // 跳转到点击广告页后的webview页面
  static void goAdWebview(BuildContext context) {
    Application.router.navigateTo(context, Routes.adwebview, replace: true, transition: TransitionType.cupertino);
  }

  /// 跳转到 传参demo 页面
  // static void goDemoParamsPage(BuildContext context, String name, int age,
  //     double score, bool sex, Person person) {
  //   /// 对中文进行编码
  //   String mName = FluroConvertUtils.fluroCnParamsEncode(name);
  //   /// 对自定义类型 转为 json string
  //   String personJson = FluroConvertUtils.object2string(person);
  //   Application.router.navigateTo(
  //       context,
  //       Routes.demoParams +
  //           "?name=$mName&age=$age&score=$score&sex=$sex&personjson=$personJson");
  // }

  /// 跳转到 会返回参数的 页面
  // static Future goReturnParamsPage(BuildContext context) {
  //   return Application.router.navigateTo(context, Routes.returnParams);
  // }

  /// 跳转到 转场动画 页面 ， 这边只展示 inFromLeft ，剩下的自己去尝试下，
  /// 框架自带的有 native，nativeModal，inFromLeft，inFromRight，inFromBottom，fadeIn，custom
  // static Future gotransitionDemoPage(BuildContext context, String title) {
  //   return Application.router.navigateTo(
  //       context, Routes.transitionDemo + "?title=$title",
  //       /// 指定了 转场动画
  //       transition: TransitionType.inFromLeft);
  // }

  /// 自定义 转场动画
  // static Future gotransitionCustomDemoPage(BuildContext context, String title) {
  //   var transition = (BuildContext context, Animation<double> animation,
  //       Animation<double> secondaryAnimation, Widget child) {
  //     return new ScaleTransition(
  //       scale: animation,
  //       child: new RotationTransition(
  //         turns: animation,
  //         child: child,
  //       ),
  //     );
  //   };
  //   return Application.router.navigateTo(
  //       context, Routes.home + "?title=$title",
  //       transition: TransitionType.custom, /// 指定是自定义动画
  //       transitionBuilder: transition, /// 自定义的动画
  //       transitionDuration: const Duration(milliseconds: 600)); /// 时间
  // }

  /// 使用 IOS 的 Cupertino 的转场动画，这个是修改了源码的 转场动画
  /// Fluro本身不带，但是 Flutter自带
  static Future gotransitionCupertinoDemoPage(
      BuildContext context, String title) {
    return Application.router.navigateTo(
        context, Routes.home + "?title=$title",
        transition: TransitionType.cupertino);
  }
}