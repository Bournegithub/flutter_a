import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_a/i18n/translations.dart';
import '../service/service.dart';
import '../model/userInfo.dart';
import '../routers/navigatorUtil.dart';
import '../components/stateLayout.dart';
import '../utils/sharedPreferenceUtil.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;
  String userid;
  String token;
  String name = '';
  String phone = '';
  String mail = '';
  String introduce = '';
  String github = '';
  String avatar = '';
  // 默认加载状态loading
  LoadState _layoutState = LoadState.State_Loading;
  
  getPreference(obj, name){
    Future<String> result = SharedPreferenceUtil.getString(name);
    result.then((value){
      // print('isFirstOpen已经存储');
      setState(() {
        obj = value;
      });
    });
  }

  _getInfo() async {
    await getPreference(userid, 'userid');
    await getPreference(token, 'token');
    var parms = {
      "userid": userid,
      "token": token
    };
    Future result = Service.getUserInfo(parms);
    result.then((val){
      UserInfo user = UserInfo.fromJson(val);
      setState(() {
        name = user.name;
        phone = user.phone;
        mail = user.mail;
        introduce = user.introduce;
        github = user.github;
        avatar = user.avatar;
        _layoutState = LoadState.State_Success;
      });
    }).catchError((err){
      print('err is $err');
      setState(() {
        _layoutState = LoadState.State_Error;
      });
    });
  }
  _loginOut() async {
    await _removePreferen('userid');
    await _removePreferen('username');
    await _removePreferen('token');
    _goLoginPage();
  }
  _removePreferen(name){
    Future<bool> result = SharedPreferenceUtil.remove(name);
    result.then((value){
      print('已删除');
    });
  }
  _goLoginPage() {
    NavigatorUtil.goLogin(context);
  }
  _goGithub(){
    NavigatorUtil.goGithubWebview(context);
  }
  _goSetting() {
    NavigatorUtil.goSetting(context);
  }
  @override
  void initState() {
    super.initState();
    
    _getInfo();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: new ListView(
          children: <Widget>[
            Container(
              color: Colors.grey[200],
              // child: StateLayout (
              //   state: _layoutState,
              //   errorRetry: () {
              //     setState(() {
              //       _layoutState = LoadState.State_Loading;
              //     });
              //     _getInfo();
              //   }, //错误按钮点击过后进行重新加载
              //   successWidget: Center(
              //     child: Text('加载成功'),
              //   ),
              // )
              child: ListTile(
                // leading: new Image.network(
                //   avatar,
                //   height: 120.0,
                // ),
                leading: CachedNetworkImage(
                  imageUrl: avatar,
                  placeholder: (context, url) => Image.asset('assets/image/public/placeholder.jpg'),
                  errorWidget: (context, url, error) => Image.asset('assets/image/public/error.jpg'),
                  height: 120.0,
                ),
                title: Text(name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Mail: $mail'),
                    Text('Github: $github'),
                  ],
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                isThreeLine: true,
                onTap: (){
                  _goGithub();
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(0),
              color: Colors.grey[200],
              child: new Center(
                child: ListTile(
                  title: Text(
                    Translations.of(context).text('settingpage'),
                    style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    size: 18.0,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0), // 左上右下
                  onTap: (){
                    _goSetting();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: new Center(
                child: GestureDetector(
                  onTap: (){
                    _loginOut();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Text(
                    Translations.of(context).text('loginout'),
                    style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold),
                  ),
                )
              ),
            ),
          ],
        )
      )
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}