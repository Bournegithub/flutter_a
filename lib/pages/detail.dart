import 'package:flutter/material.dart';
import '../routers/navigatorUtil.dart';
import '../routers/model/homeParams.dart';
import '../routers/model/detailParams.dart';
import '../utils/fluro_convert_util.dart';

class DetailPage extends StatefulWidget {
  final int paramsInt;
  final String paramsString;
  final bool paramsBool;
  final String paramsJson;
  DetailPage({this.paramsInt, this.paramsString, this.paramsBool, this.paramsJson});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int exampleint;
  String examplestring;
  bool examplebool;
  var defaultparams;
  _goList(){
    int index = 0;
    HomeParams homeParms = new HomeParams(params1: 'detail页面返回example1', params2: 'detail页面返回example2');
    NavigatorUtil.backHomePage(context, index, homeParms);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    exampleint = widget.paramsInt;
    examplestring = widget.paramsString;
    examplebool = widget.paramsBool;
    DetailParams defaultparams = DetailParams.fromJson(FluroConvertUtils.string2map(widget.paramsJson));
    print('exampleint is: $exampleint & examplestring is: $examplestring & examplebool is: $examplebool');
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.yellow, Colors.pink]),
            image: DecorationImage(
              image: NetworkImage('https://img.zcool.cn/community/010d085e3b96c3a80120a8957e90b7.jpg@1280w_1l_2o_100sh.jpg'),
              fit: BoxFit.cover
            ),
          ),
          child: SafeArea(
            child: new AppBar(
              centerTitle: true,
              title: Text(
                defaultparams.name,
                textAlign:TextAlign.center,
                style: TextStyle(

                ),
              ),
              elevation: 0, ///设置AppBar透明，必须设置为0
              backgroundColor: Colors.transparent,
              leading: new IconButton(
                tooltip: 'Previous choice',
                icon: const Icon(Icons.keyboard_arrow_left),
                onPressed: () { 
                  _goList();
                },
              )
            )
          ),
        ),
        preferredSize: Size(double.infinity, 70)
      ),
      body: Container(
        child: Text('detail'),
      ),
    );
  }
}