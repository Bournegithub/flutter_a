// 启动页
import 'package:flutter/material.dart';
import 'package:flutter_a/utils/package_util.dart';
import 'package:rxdart/rxdart.dart';
import '../routers/navigatorUtil.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import '../utils/sharedPreferenceUtil.dart';

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
  getCurrentLocal() {
    Future result1 = SharedPreferenceUtil.getString('currentLocal');
      result1.then((value){
        print("getStringResult=$value");
        currentLocal = value;
    });
    new Future.delayed(Duration.zero, () async {
      await FlutterI18n.refresh(context, new Locale(currentLocal));
      setState(() {
        currentLang = FlutterI18n.currentLocale(context);
      });
    });
  }
  getIsfirstOpen(){
    Future result = SharedPreferenceUtil.getBool('isFirstOpen');
    result.then((value){
      print("get isFirstOpenResult=$value");
      if(value == null || value) {
      } else {
        isFirstOpen = false;
      }
        // currentLocal = value;
    });
  }
  @override
  void initState() {
    super.initState();
    String version = PackageUtil.getVersionString();
    print('获取APP版本号+$version');
    getCurrentLocal();
    getIsfirstOpen();
    
    Observable.timer(0, Duration(seconds: 2)).listen((_){
      print('Now isFirstOpen is $isFirstOpen');
      // 第一次启动app或者版本更新后第一次启动app进入引导页,正常进入广告页
      if(isFirstOpen) {
        NavigatorUtil.goBootPage(context);
      } else {
        NavigatorUtil.goADPage(context);
      }
      // NavigatorUtil.goADPage(context);
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
                      FlutterI18n.translate(context, 'spalshTitle'),
                      // 'without',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                      )
                    ),
                    Text(
                      FlutterI18n.translate(context, 'spalshSlogan'),
                      // 'everything is nothing',
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