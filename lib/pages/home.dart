import 'package:flutter/material.dart';
import '../utils/package_util.dart';
import 'list.dart';
import '../utils/corlors_util.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 创建数组, 引入当前页面
  List<Widget> pageList = [ListPage(), ListPage(), ListPage(), ListPage()]; 
  int currentPage = 0; // 当前页面index
  // 底部菜单item文字
  List titles = ['列表', '页面2', '页面3', '页面4'];
  // 底部菜单item图片正常状态
  List normalImgUrls = ['assets/image/icon/a_0.png', 'assets/image/icon/b_0.png', 'assets/image/icon/c_0.png', 'assets/image/icon/d_0.png'];
  // 底部菜单item图片选中状态
  List selectedImgUrls = ['assets/image/icon/a_1.png', 'assets/image/icon/b_1.png', 'assets/image/icon/c_1.png', 'assets/image/icon/d_1.png'];
  // 对应页面是否显示appbar
  List appBarShow = [false, false, false, true];
  //对应页面appbar显示的内容
  List appBarText = ['hello,page1', 'hello,page2', 'hello,page3', 'hello,page4' ];

  getAppInfo() async {
    var result = await PackageUtil.getVersionString();
    print('获取APP版本号+$result');
  }
  void initState() {
    super.initState();
    getAppInfo();
  }
  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 5;
    return Scaffold(
        appBar: appBarShow[currentPage] ? new AppBar(
          elevation: 0, ///设置AppBar透明，必须设置为0
          backgroundColor: Colors.transparent,
          title: new Center(
                child: new Text(
                  appBarText[currentPage],
                  style: TextStyle(color: Colors.grey),
                ),
              ),
        ) : null,
        body: pageList[currentPage], // 当前选中页面
        floatingActionButton: FloatingActionButton(
            // onPressed: _openNewPage,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ), onPressed: () {},),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //和底栏进行融合
        bottomNavigationBar: BottomAppBar(
          color: Colors.white, //底部工具栏的颜色。
          shape: CircularNotchedRectangle(),
          //设置底栏的形状，一般使用这个都是为了和floatingActionButton融合，
          // 所以使用的值都是CircularNotchedRectangle(),有缺口的圆形矩形。
          child: new Container(
            child: Row(
              //里边可以放置大部分Widget，让我们随心所欲的设计底栏
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 60, width: itemWidth, child: bottomAppBarItem(0)),
                SizedBox(height: 60, width: itemWidth, child: bottomAppBarItem(1)),
                SizedBox(height: 60, width: itemWidth),
                SizedBox(height: 60, width: itemWidth, child: bottomAppBarItem(2)),
                SizedBox(height: 60, width: itemWidth, child: bottomAppBarItem(3))
              ],
            ),
          )
        ),
      );
  }
  Widget bottomAppBarItem(int index) {
    //设置默认未选中的状态
    // TextStyle style = TextStyle(fontSize: 11, color: const Color(0xFF0099ff)); //0x 后面开始 两位FF表示透明度16进制, 之后的0099ff 代表RGB色值
    TextStyle style = TextStyle(fontSize: 11, color: ColorsUtil.hexColor(0x666666)); // 对十六进制用法做了一层封装处理
    String imgUrl = normalImgUrls[index];
    if (currentPage == index) {
      //选中的话
      style = TextStyle(fontSize: 11, color: ColorsUtil.hexColor(0x000000));
      // style = TextStyle(fontSize: 11, color: Color.fromRGBO(0, 0, 0, 1)); // 分别表示red green blue，常规的红绿蓝三色, 取值范围为0-255，opacity表示透明度，取值0.0-1.0。
      imgUrl = selectedImgUrls[index];
    }
    //构造返回的Widget
    Widget item = Container(
      padding: new EdgeInsets.fromLTRB(0,15,0,0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(imgUrl, width: 20, height: 20,),
            Container(
              padding: new EdgeInsets.fromLTRB(0,5,0,0),
              child: Text(
                titles[index],
                style: style,
              ),
            )
            
          ],
        ),
        onTap: () {
          if (currentPage != index) {
            setState(() {
              currentPage = index;
            });
          }
        },
      ),
    );
    return item;
  }
}
