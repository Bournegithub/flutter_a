import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_a/i18n/applocalizations.dart';
import '../service/service.dart';
import '../model/userInfo.dart';
import '../routers/navigatorUtil.dart';
import '../components/stateLayout.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String name = '';
  String phone = '';
  String mail = '';
  String introduce = '';
  String github = '';
  String avatar = '';
  // 默认加载状态loading
  LoadState _layoutState = LoadState.State_Loading;
  _getInfo() {
    var parms = {
      "a": "1",
      "b": "2"
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
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              padding: EdgeInsets.all(0),
              color: Colors.grey[200],
              child: new Center(
                child: ListTile(
                  title: Text(
                    AppLocalizations.of(context).settingPage,
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
            )
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