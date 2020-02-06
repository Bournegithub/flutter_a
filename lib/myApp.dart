import 'package:flutter/material.dart';
import 'routers/application.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'utils/sharedPreferenceUtil.dart';
import 'utils/package_util.dart';
import 'i18n/translations.dart';
import 'i18n/application.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';

class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  SpecificLocalizationDelegate _localeOverrideDelegate;
  // String appLocal;
  // _getlocal(){
  //   Future result = SharedPreferenceUtil.getString('local');
  //   result.then((value){
  //       print("StringlocalResult已获取=$value");
  //       setState(() {
  //         appLocal = value;
  //       });
  //   });
  // }
  _setLocal(val) {
    Future result = SharedPreferenceUtil.setString('local', val);
    result.then((value){
        print("StringlocalResult已存储=$value");
    });
  }
  _setSupportList(String str, List list) {
    Future result = SharedPreferenceUtil.setStringList('supportlist', list);
    result.then((value){
        print("supportlist已存储=$value");
    });
  }
  @override
  void initState(){
    super.initState();
    /// 初始化一个新的Localization Delegate，有了它，当用户选择一种新的工作语言时，可以强制初始化一个新的Translations
    _localeOverrideDelegate = new SpecificLocalizationDelegate(null);

    /// 保存这个方法的指针，当用户改变语言时，我们可以调用applic.onLocaleChanged(new Locale('en',''));，通过SetState()我们可以强制App整个刷新
    applic.onLocaleChanged = onLocaleChange;
  }
  onLocaleChange(Locale locale){
    setState((){
      _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APPtitle',
      // 应用程序导航到指定路由时使用的路由生成器回调
      onGenerateRoute: Application.router.generator,
      localeResolutionCallback: (locale, support) {
        PackageUtil.init();
        String currentLocal = locale.toString().substring(0,2);
        List <String>supportList = [];
        support.forEach((key) => {
          supportList.add(key.toString().substring(0,2))
        });
        _setSupportList('supportlist', supportList);
        Future result = SharedPreferenceUtil.getString('local');
        result.then( (value){
          if (value != null) {
            print('value is: $value');
            if(currentLocal == value) {
              return locale;
            } else {
              applic.onLocaleChanged(new Locale(value,''));
            }
          } else {
            if(supportList.contains(currentLocal)){
              _setLocal(currentLocal);
              return locale;
            } else {
              _setLocal('en');
              return const Locale('en','');
            }
          }
        });   
      },
      
      localizationsDelegates: [
        _localeOverrideDelegate,  // 注册一个新的delegate
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalEasyRefreshLocalizations.delegate,
      ],
      supportedLocales: applic.supportedLocales(), 
    );
  }

}

// class MyApp extends StatelessWidget {
//   MyApp({Key key, this.title}) : super(key: key);
//   final String title;
  
//   setLocal(val) {
//     Future result = SharedPreferenceUtil.setString('local', val);
//     result.then((value){
//         print("StringlocalResult已存储=$value");
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'APPtitle',
//       // 应用程序导航到指定路由时使用的路由生成器回调
//       onGenerateRoute: Application.router.generator,
//       // 这个回调负责在应用程序启动时以及用户更改设备的区域设置时选择应用程序的区域设置
//       // localeResolutionCallback: (deviceLocale, supportedLocales) {
//       //   // print('deviceLocale: $deviceLocale');
//       //   // 因为用了StatelessWidget, package委屈一下放这里好了.
//       //   PackageUtil.init();
//       //   Future<bool> result = SharedPreferenceUtil.setString('currentLocal', deviceLocale.toString());
//       //   result.then((value){
//       //       // print('is currentLocal success=$value');
//       //       local = deviceLocale.toString(); 
//       //   });
//       //   // print('assets/i18n/$local');
//       // },
//       //  国际化的委托
//       // localizationsDelegates: [
//       //   FlutterI18nDelegate(
//       //       useCountryCode: false, fallbackFile: local, path: 'assets/i18n'),
//       //   GlobalMaterialLocalizations.delegate,
//       //   GlobalWidgetsLocalizations.delegate
//       // ],
//       // 区域分辨回调
//       localeResolutionCallback: (local, support) {
//         print('当前语言设置: $local');
//         // print('当前support: $support');
//         // 借区域回调放一下package的初始化.
//         PackageUtil.init();
//         if(support.contains(local)){
//           print('support');
//           setLocal(local.toString());
//           return local;
//         } else {
//           print('no_support');
//           return const Locale('en','US');
//         }
        
//       },
      
//       localizationsDelegates: [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         AppLocalizationsDelegate.delegate,
//         GlobalEasyRefreshLocalizations.delegate,
//       ],
//       supportedLocales: [    
//         const Locale('en','US'),                               
//         const Locale('zh','CH'),
//       ],
//     );
//   }
// }