import 'package:flutter/material.dart';

class AppLocalizations {

  final Locale locale;
  AppLocalizations(this.locale);

  Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'apptitle' : 'Demo',
      'appslogan': 'Nothing is important',
      'loading': 'loading...',
      'cancle': 'Cancle',
      'sure': 'OK',
      'login': 'Login',
      'register': 'Register',
      'submit': 'Submit',
      'listpage': 'List',
      'aboutpage': 'About',
      'settingpage': 'Setting',
      'nativepage': 'Native',
      'compoentspage': 'compoents',
    },
    'zh': {
      'apptitle' : '示例',
      'appslogan': '无所无惧',
      'loading': '正在加载...',
      'cancle': '取消',
      'sure': '确定',
      'login': '登录',
      'register': '注册',
      'submit': '提交',
      'listpage': '列表',
      'aboutpage': '关于',
      'settingpage': '设置',
      'nativepage': '交互',
      'compoentspage': '组件',
    }
  };

  get appTitle {return _localizedValues[locale.languageCode]['apptitle'];}
  get appSlogan {return _localizedValues[locale.languageCode]['appslogan'];}
  get loading {return _localizedValues[locale.languageCode]['loading'];}
  get cancle {return _localizedValues[locale.languageCode]['cancle'];}
  get sure {return _localizedValues[locale.languageCode]['sure'];}
  get login {return _localizedValues[locale.languageCode]['login'];}
  get register {return _localizedValues[locale.languageCode]['register'];}
  get submit {return _localizedValues[locale.languageCode]['submit'];}
  get listPage {return _localizedValues[locale.languageCode]['listpage'];}
  get aboutPage {return _localizedValues[locale.languageCode]['aboutpage'];}
  get settingPage {return _localizedValues[locale.languageCode]['settingpage'];}
  get compoentsPage {return _localizedValues[locale.languageCode]['compoentspage'];}
  get nativePage {return _localizedValues[locale.languageCode]['nativepage'];}
  

  static AppLocalizations of(BuildContext context){
    return Localizations.of(context, AppLocalizations);
  }
}