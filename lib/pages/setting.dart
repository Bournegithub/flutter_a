import 'package:flutter/material.dart';
import 'package:flutter_a/i18n/applocalizations.dart';
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
  String currentLanguage = '';
  _goAbout(){
    int index = 3;
    HomeParams homeParms = new HomeParams(params1: 'github页面返回example1', params2: 'github页面返回example2');
    NavigatorUtil.backHomePage(context, index, homeParms);
  }
  _getCurrentLocal() {
    Future result = SharedPreferenceUtil.getString('local');
    result.then((value){
        print('currentLocal is $value');
        setState(() {
          currentLanguage = value;
        });
    });
  }
  _language(){
    print('设置语言');
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
            return new Container(
                height: 300.0,
                child: Text('123'),
            );
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
    _getCurrentLocal();
  }
  Widget build(BuildContext context) {
    
    final List<String> entries = <String>[AppLocalizations.of(context).language, 'B', 'C'];
    List<String> entriesValue = <String>[currentLanguage, '', ''];
    return Scaffold(
      appBar: new AppBar( 
        title: new Center(
              child: new Text(AppLocalizations.of(context).settingPage),
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
  @override
  void dispose() {
    super.dispose();
  }
}