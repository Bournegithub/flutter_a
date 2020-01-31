import 'package:flutter/material.dart';
import 'routers/application.dart';
// import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'utils/sharedPreferenceUtil.dart';
import 'utils/package_util.dart';


class MyApp extends StatelessWidget {
  MyApp({Key key, this.title}) : super(key: key);
  final String title;
  // 国际化
  String local;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APPtitle',
      // 应用程序导航到指定路由时使用的路由生成器回调
      onGenerateRoute: Application.router.generator,
      // 这个回调负责在应用程序启动时以及用户更改设备的区域设置时选择应用程序的区域设置
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        // print('deviceLocale: $deviceLocale');
        // 因为用了StatelessWidget, package委屈一下放这里好了.
        PackageUtil.init();
        Future<bool> result = SharedPreferenceUtil.setString('currentLocal', deviceLocale.toString());
        result.then((value){
            // print('is currentLocal success=$value');
            local = deviceLocale.toString(); 
        });
        // print('assets/i18n/$local');
      },
      //  国际化的委托
      // localizationsDelegates: [
      //   FlutterI18nDelegate(
      //       useCountryCode: false, fallbackFile: local, path: 'assets/i18n'),
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate
      // ],
      localizationsDelegates: [                             //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [                                   //此处
        const Locale('zh','CH'),
        const Locale('en','US'),
      ],
    );
  }
}