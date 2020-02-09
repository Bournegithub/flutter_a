import 'package:flutter/material.dart';
import '../utils/sharedPreferenceUtil.dart';
import '../service/service.dart';
import '../routers/navigatorUtil.dart';
import '../routers/model/homeParams.dart';
import '../model/loginResult.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();
  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();
  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _password = '';//用户名
  var _username = '';//密码
  var _isShowPwd = false;//是否显示密码
  var _isShowClear = false;//是否显示输入框尾部的清除按钮
  String userid;
  String username;
  String token;
  String avatar;

  _setUserInfo(name, value, type) {
    switch(type) {
      case 'bool':
        Future<bool> result = SharedPreferenceUtil.setBool(name, value);
        result.then((value){
          // print('isFirstOpen已经存储');
        });
      break;
      case 'string':
        Future<bool> result = SharedPreferenceUtil.setString(name, value);
        result.then((value){
          // print('isFirstOpen已经存储');
        });
      break;
      case 'int':
        Future<bool> result = SharedPreferenceUtil.setInt(name, value);
          result.then((value){
            // print('isFirstOpen已经存储');
          });
        break;
      default:
      break;
    }
  }
  _goHome() {
    int index = 0;
    HomeParams homeParms = new HomeParams(params1: '登录进入参数example1', params2: '登录页进入参数example2');
    NavigatorUtil.goHomePage(context, index, homeParms);
  }
  _login (username, password) async {
    var parms = {
      'username': _username,
      'password': _password
    };
    Future result = Service.login(parms);
    result.then((val) async {
      LoginResult endInfo = LoginResult.fromJson(val);
      print('endinfo.id is ${endInfo.id}');
      await _setUserInfo('userid', endInfo.id, 'string');
      await _setUserInfo('username', endInfo.name, 'string');
      await _setUserInfo('token', endInfo.token, 'string');
      _goHome();
      // _listData.addAll(val);
      // print('getlist result is: $_listData');
      // print('getlist result.length is: ${_listData.length}');
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _userNameController.addListener((){
      print(_userNameController.text);
      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (_userNameController.text.length > 0) {
        _isShowClear = true;
      }else{
        _isShowClear = false;
      }
      setState(() {
        
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    // 移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }
  // 监听焦点
  Future _focusNodeListener() async{
    if(_focusNodeUserName.hasFocus){
      print("用户名框获取焦点");
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
    }
  }
  // 验证用户名
  String validateUserName(value){
    // 正则匹配手机号
    RegExp exp = RegExp(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if (value.isEmpty) {
      return '用户名不能为空!';
    }else if (!exp.hasMatch(value)) {
      return '请输入正确手机号';
    }
    return null;
  }
  // 密码
  String validatePassWord(value){
    if (value.isEmpty) {
      return '密码不能为空';
    }else if(value.trim().length<6 || value.trim().length>18){
      return '密码长度不正确';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {

    // logo 图片区域
    Widget logoImageArea = new Container(
      alignment: Alignment.topCenter,
      // 设置图片为圆形
      child: ClipOval(
        child: Image.asset(
          "assets/image/public/logo.png",
          height: 150,
          width: 100,
          // fit: BoxFit.cover,
        ),
      ),
    );
    
    //输入文本框区域
    Widget inputTextArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white
      ),
      child: new Form(
        key: _formKey,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            new TextFormField(
              controller: _userNameController,
              focusNode: _focusNodeUserName,
              //设置键盘类型
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入手机号",
                prefixIcon: Icon(Icons.person),
                //尾部添加清除按钮
                suffixIcon:(_isShowClear) 
                          ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: (){
                                // 清空输入框内容
                                _userNameController.clear();
                              },
                            ) 
                          : null ,
              ),
              //验证用户名
              validator: validateUserName,
              //保存数据
              onSaved: (String value){
                _username = value;
              },
            ),
            new TextFormField(
              focusNode: _focusNodePassWord,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码 6-18位",
                prefixIcon: Icon(Icons.lock),
                // 是否显示密码
                suffixIcon: IconButton(
                  icon: Icon((_isShowPwd) ? Icons.visibility : Icons.visibility_off),
                  // 点击改变显示或隐藏密码
                  onPressed: (){
                    setState(() {
                      _isShowPwd = !_isShowPwd;
                    });
                  },
                )
              ),
              obscureText: !_isShowPwd,
              //密码验证
              validator:validatePassWord, 
              //保存数据
              onSaved: (String value){
                _password = value;
              },
            )
          ],
        ),
      ),      
    );
    // 登录按钮区域
    Widget loginButtonArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 45.0,
      child: new RaisedButton(
        color: Colors.blue[300],
        child: Text(
          "登录",
          style: Theme.of(context).primaryTextTheme.headline,
        ),
        // 设置按钮圆角
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onPressed: (){
          //点击登录按钮，解除焦点，回收键盘
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();
          _formKey.currentState.validate();
          if (_formKey.currentState.validate()) {
            //只有输入通过验证，才会执行这里
            _formKey.currentState.save();
            //todo 登录操作
            print("$_username + $_password");
            _login(_username, _password);
          }
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      // 外层添加一个手势，用于点击空白部分，回收键盘
      body: new GestureDetector(
        onTap: (){
          // 点击空白区域，回收键盘
          print("点击了空白区域");
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();
        },
        child: new ListView(
          children: [
            new SizedBox(height: 10),
            logoImageArea,
            new SizedBox(height: 10),
            inputTextArea,
            new SizedBox(height: 10),
            loginButtonArea,
            new SizedBox(height: 10),
            // bottomArea,
          ],
        ),
      ),
    );
  }
}