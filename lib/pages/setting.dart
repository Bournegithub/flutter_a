import 'package:flutter/material.dart';
import 'package:flutter_a/i18n/application.dart';
import 'package:flutter_a/i18n/translations.dart';
import '../routers/navigatorUtil.dart';
import '../routers/model/homeParams.dart';
import '../utils/sharedPreferenceUtil.dart';


class SettingPage extends StatefulWidget {
  SettingPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String currentLanguage = 'en';
  List supportList = [];
  _goAbout(){
    int index = 3;
    HomeParams homeParms = new HomeParams(params1: 'github页面返回example1', params2: 'github页面返回example2');
    NavigatorUtil.backHomePage(context, index, homeParms);
  }
  _getLocal() {
    Future result = SharedPreferenceUtil.getString('local');
    result.then((value){
        setState(() {
          currentLanguage = value.substring(0, 2);
          print('currentLocal is $currentLanguage');
        });
    });
  }
  _getSupportList() {
    Future result = SharedPreferenceUtil.getStringList('supportlist');
    result.then((value){
        print("supportlist已读取=$value");
        supportList = value;
    });
  }
  _language(){
    print('设置语言');
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
            return _langWidget();
        },
    ).then((val) {
        print(val);
    });
  }
  _funEntries(int index){
    switch(index){
      case 0: 
        _language();
      break;
      default:
        print('index is $index');
      break;
    }
  }
  
  @override
  void initState() {
    super.initState();
    _getLocal(); // 当前语言
    _getSupportList(); // 当前支持的语言
  }
  Widget build(BuildContext context) {
    final List<String> entries = <String>[Translations.of(context).text('language'),'setting-other','setting-more'];
    List<String> entriesValue = <String>[Translations.of(context).text(currentLanguage), '', ''];
    return Scaffold(
      appBar: new AppBar( 
        centerTitle: true,
        title: new Text(
          Translations.of(context).text('settingpage'),
          textAlign:TextAlign.center,
        ),
        leading: new IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              _goAbout();
            },
        ),
      ),
      body:  (
          ListView.separated(
            padding: const EdgeInsets.all(0),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.grey[200],
                child: ListTile(
                  title: Text(
                    entries[index],
                    style: TextStyle(fontSize: 15.0),
                  ),
                  // trailing: Icon(Icons.keyboard_arrow_right),
                  trailing: Wrap(
                    spacing: 8.0,
                    alignment: WrapAlignment.center,
                    // runAlignment: WrapAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(0,3,0,0),
                        child: Text(
                          entriesValue[index],
                          // currentLanguage,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      
                      Icon(
                        Icons.keyboard_arrow_right,
                      )
                    ],
                  ),
                  onTap: (){
                    _funEntries(index);
                  },
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: 5,
            ),
          )
        ),
    );
  }

  // _changelocale(){
  //   print('change');
  // }
  // _canclelocale(){
  //   print('cancle');
  // }
  @override
  Widget _langWidget() {
    return new Container(
      height: 300.0,
      child: new Column(
        children: <Widget>[
          // new Container(
          //   height: 60,
          //   child: new Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: <Widget>[
          //       Container(
          //         width: 60.0,
          //         height: 20.0,
          //         child: GestureDetector(
          //           onTap:(){
          //             Navigator.of(context).pop();
          //             _canclelocale();
          //           },
          //           child:Center(
          //             child: Text(
          //               Translations.of(context).text('cancle'),
          //               textAlign: TextAlign.center
          //             ),
          //           )
          //         ),
          //       ),
          //       Container(
          //         width: 60.0,
          //         height: 20.0,
          //         child: GestureDetector(
          //           onTap:(){
          //             _changelocale();
          //             Navigator.of(context).pop();
          //           },
          //           child: Center(
          //             child: Text(
          //               Translations.of(context).text('sure'),
          //               textAlign: TextAlign.center
          //             ),
          //           ),
          //         ),
          //       )
          //     ]
          //   ),
          // ),
          Container(
            height: 240,
            child: new ListView.builder(
              itemBuilder: (BuildContext context, int index) => languageItem(supportList[index]),
              itemCount: supportList.length,
            ),
          )
          
        ],
      )
    );
  }
  _setLanguage(lang) {
    print('setlanguage: $lang');
    setState(() {
      currentLanguage = lang;
    });
    applic.onLocaleChanged(new Locale(lang,''));
    Future result = SharedPreferenceUtil.setString('local', lang);
    result.then((value){
        print("StringlocalResult已存储=$value");
    });
    // 切换语言后会短暂报错 The method '[]' was called on null. Receiver: null Tried calling: []("listpage") 猜测是 _localizedValues此时加载json未成功, 仍是null
  }
  @override
  Widget languageItem( lang) {
    Widget item = Container(
      padding: new EdgeInsets.fromLTRB(0,15,0,0),
      child: GestureDetector(
        child: ListTile(
          title: new Text(Translations.of(context).text(lang)),
          trailing: currentLanguage == lang ? new Icon(Icons.done) : null,
          onTap: (){
            if(currentLanguage == lang){
              return;
            } else {
              _setLanguage(lang);
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
    return item;
  }

  @override
  void dispose() {
    super.dispose();
  }
}