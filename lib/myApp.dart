import 'package:flutter/material.dart';
import 'routers/application.dart';
// import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'utils/sharedPreferenceUtil.dart';
import 'utils/package_util.dart';
import 'i18n/appLocalizationsDelegate.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MyApp extends StatelessWidget {
  MyApp({Key key, this.title}) : super(key: key);
  final String title;
  setLocal(val) {
    Future result = SharedPreferenceUtil.setString('local', val);
    result.then((value){
        print("StringlocalResult已存储=$value");
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APPtitle',
      // 应用程序导航到指定路由时使用的路由生成器回调
      onGenerateRoute: Application.router.generator,
      // 这个回调负责在应用程序启动时以及用户更改设备的区域设置时选择应用程序的区域设置
      // localeResolutionCallback: (deviceLocale, supportedLocales) {
      //   // print('deviceLocale: $deviceLocale');
      //   // 因为用了StatelessWidget, package委屈一下放这里好了.
      //   PackageUtil.init();
      //   Future<bool> result = SharedPreferenceUtil.setString('currentLocal', deviceLocale.toString());
      //   result.then((value){
      //       // print('is currentLocal success=$value');
      //       local = deviceLocale.toString(); 
      //   });
      //   // print('assets/i18n/$local');
      // },
      //  国际化的委托
      // localizationsDelegates: [
      //   FlutterI18nDelegate(
      //       useCountryCode: false, fallbackFile: local, path: 'assets/i18n'),
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate
      // ],
      // 区域分辨回调
      localeResolutionCallback: (local, support) {
        print('当前语言设置: $local');
        // print('当前support: $support');
        // 借区域回调放一下package的初始化.
        PackageUtil.init();
        if(support.contains(local)){
          print('support');
          setLocal(local.toString());
          return local;
        } else {
          print('no_support');
          return const Locale('en','US');
        }
        
      },
      
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizationsDelegate.delegate,
        GlobalEasyRefreshLocalizations.delegate,
      ],
      supportedLocales: [    
        const Locale('en','US'),                               
        const Locale('zh','CH'),
      ],
    );
  }
}