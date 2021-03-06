// 启动页
import 'package:flutter/material.dart';
import 'package:flutter_a/i18n/translations.dart';
import 'package:rxdart/rxdart.dart';
import '../routers/navigatorUtil.dart';
import '../utils/sharedPreferenceUtil.dart';
import '../service/service.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Locale currentLang;
  String currentLocal;
  // 是否第一次打开，用来调试启动页之后跳转引导页还是广告页
  bool isFirstOpen = true;
  bool tokenSuccess;
  String token;
  bool tokenStatus;
  String username;

  _getIsfirstOpen(){
    Future result = SharedPreferenceUtil.getBool('isFirstOpen');
    result.then((value){
      print("get isFirstOpenResult=$value");
      if(value == null) {
        isFirstOpen = true;
      } else {
        isFirstOpen = value;
      }
        // currentLocal = value;
    });
  }
  _getToken(){
    Future result = SharedPreferenceUtil.getString('token');
    result.then((value){
      print("get token=$value");
      setState(() {
        if(value == null) {
        tokenSuccess = false;
      } else {
        token = value;
        tokenSuccess = true;
      }
      });
    });
  }
  _goLogin(){
    NavigatorUtil.goLogin(context);
  }
  _promiseJob() async {
    await _getToken();
    if(tokenSuccess){
      await _getIsfirstOpen();
      // 第一次启动app或者版本更新后第一次启动app进入引导页, 正常进入广告页
      if(isFirstOpen) {
        NavigatorUtil.goBootPage(context);
      } else {
        NavigatorUtil.goADPage(context);
      }
    }else{
      _goLogin();
    }
    
  }
  @override
  void initState() {
    super.initState();
    Observable.timer(0, Duration(seconds: 3)).listen((_){
      _promiseJob();
    });
    
  }
  Widget build(BuildContext context) {
    // print('currentLang: $currentLang');
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            // 静态资源图片
            image: new AssetImage("assets/image/splash/splash.jpg"), 
            // 网络资源图片
            // image: NetworkImage(
            //     'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg'
            // ),
            fit: BoxFit.cover,
          )
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent, //把scaffold的背景色改成透明
            // appBar: AppBar(
            //   backgroundColor: Colors.transparent, //把appbar的背景色改成透明
            //   // elevation: 0,//appbar的阴影
            //   title: Text('test'),
            // ),
            body: Center(
              child: new Padding(
                padding: new EdgeInsets.only(top:200),
                child: new Column(
                  children: <Widget>[
                    Text(
                      Translations.of(context).text('apptitle'),
                      // AppLocalizations.of(context).appTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                      )
                    ),
                    Text(
                      Translations.of(context).text('appslogan'),
                      // AppLocalizations.of(context).appSlogan,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                      )
                    ),
                ]
              )
              ),
            )
            
        )
    );
  }
}