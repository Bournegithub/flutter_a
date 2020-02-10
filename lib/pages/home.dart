import 'package:flutter/material.dart';
import '../i18n/translations.dart';
import '../utils/package_util.dart';
import 'list.dart';
import '../utils/corlors_util.dart';
import 'about.dart';
import '../routers/model/homeParams.dart';
import '../utils/fluro_convert_util.dart';
import 'compoents.dart';
import 'native.dart';

class HomePage extends StatefulWidget {
  final int index;
  final String paramsJson;
  HomePage({this.index, this.paramsJson});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 创建数组, 引入当前页面
  List<Widget> pageList = [ListPage(), CompoentsPage(), NativePage(), AboutPage()]; 
  int currentPage = 0; // 当前页面index
  // 底部菜单item文字
  List titles = [];
  // List titles = [];
  // 底部菜单item图片正常状态
  List normalImgUrls = ['assets/image/icon/a_0.png', 'assets/image/icon/b_0.png', 'assets/image/icon/c_0.png', 'assets/image/icon/d_0.png'];
  // 底部菜单item图片选中状态
  List selectedImgUrls = ['assets/image/icon/a_1.png', 'assets/image/icon/b_1.png', 'assets/image/icon/c_1.png', 'assets/image/icon/d_1.png'];
  // 对应页面是否显示appbar
  List appBarShow = [false, true, true, true];
  //对应页面appbar显示的内容
  List appBarText = [];

  List<Widget> _pages = List();
  PageController _controller;

  _getAppInfo() async {
    var result = await PackageUtil.getVersionString();
    print('获取APP版本号+$result');
  }
  getlocalset(){
    var currentLanguage = Translations.of(context);
  }
  void initState() {
    super.initState();
    _getAppInfo();
    setState(() {
      currentPage = widget.index;
    });
    _pages..add(ListPage())..add(CompoentsPage())..add(NativePage())..add(AboutPage());
    _controller = PageController(initialPage: currentPage);
    
  }

  @override
  Widget build(BuildContext context) {
    // 获取传递过来的参数
    int index = widget.index;
    HomeParams homeparams = HomeParams.fromJson(FluroConvertUtils.string2map(widget.paramsJson));
    // print('homeparms params1 is: ${homeparams.params1}');
    // print('homeparms params2 is: ${homeparams.params2}');
    setState(() {
      titles = [Translations.of(context).text('listpage'), Translations.of(context).text('compoentspage'), Translations.of(context).text('nativepage'), Translations.of(context).text('aboutpage')];
      appBarText = [Translations.of(context).text('listpage'), Translations.of(context).text('compoentspage'), Translations.of(context).text('nativepage'), Translations.of(context).text('aboutpage')];
    });
    
    double itemWidth = MediaQuery.of(context).size.width / 5;
    return Scaffold(
        appBar: appBarShow[currentPage] ? new AppBar(
          elevation: 0, ///设置AppBar透明，必须设置为0
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: new Text(
            appBarText[currentPage],
            textAlign:TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ) : null,
        // body: pageList[currentPage], // 当前选中页面
        body: buildBody(),
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
  Widget buildBody(){
    return PageView.builder(
      controller: _controller,
      itemCount: _pages.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _pages[index];
      },
      onPageChanged: (index) {
        if (index != _controller) {
          setState(() {
            currentPage = index;
          });
        }
      },
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
          _controller.jumpToPage(index);
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
