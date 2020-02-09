import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show  rootBundle;
import 'application.dart';

class Translations {
  Translations(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }
  

  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;
  static Map<String, Map<String, String>> _localizedMap = {
    'en': {
      'local': 'English',
      'apptitle' : 'Demo',
      'appslogan': 'Nothing is important',
      'loading': 'loading...',
      'cancle': 'Cancle',
      'sure': 'OK',
      'login': 'Login',
      'loginout': 'Login Out',
      'register': 'Register',
      'submit': 'Submit',
      'listpage': 'List',
      'aboutpage': 'About',
      'settingpage': 'Setting',
      'nativepage': 'Native',
      'compoentspage': 'compoents',
      'language': 'language',
      'en': 'English',
      'zh': 'Chinese'
    },
    'zh': {
        'local': '中文',
        'apptitle' : '示例',
        'appslogan': '无所无惧',
        'loading': '正在加载...',
        'cancle': '取消',
        'sure': '确定',
        'login': '登录',
        'loginout': '退出登录',
        'register': '注册',
        'submit': '提交',
        'listpage': '列表',
        'aboutpage': '关于',
        'settingpage': '设置',
        'nativepage': '交互',
        'compoentspage': '组件',
        'language': '语言',
        'en': '英语',
        'zh': '中文'
    }
  };


  static Translations of(BuildContext context){
    return Localizations.of<Translations>(context, Translations);
  }

  String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Future<Translations> load(Locale locale) async {
    Translations translations = new Translations(locale);
    // String jsonContent = await rootBundle.loadString("assets/local/i18n_${locale.languageCode}.json");
    // _localizedValues = json.decode(jsonContent);
    // 解决切换语言时短暂报错红屏,放弃异步读取json
    _localizedValues = _localizedMap[locale.languageCode];
    return translations;
  }

  get currentLanguage => locale.languageCode;
}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

/// 改这里是为了不硬编码支持的语言
  @override
  bool isSupported(Locale locale) => applic.supportedLanguages.contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}

/// Delegate类的实现，每次选择一种新的语言时，强制初始化一个新的Translations类
class SpecificLocalizationDelegate extends LocalizationsDelegate<Translations> {
  final Locale overriddenLocale;

  const SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<Translations> load(Locale locale) => Translations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<Translations> old) => true;
}