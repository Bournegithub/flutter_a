import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../i18n/translations.dart';
import '../routers/navigatorUtil.dart';
import '../routers/model/detailParams.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../service/service.dart';
import '../model/listResult.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State <ListPage> with AutomaticKeepAliveClientMixin  {
  @protected
  bool get wantKeepAlive => true;
  // 条目总数
  int _count = 0;
  int _page = 1;
  int _pageSize = 10;
  List <Object> _listData = [];
  _getList (_page, _pageSize) {
    var parms = {
      'page': _page,
      'pagesize': _pageSize
    };
    Future result = Service.getList(parms);
    result.then((val){
      print('val is: $val');
      print('val.length: ${val.length}');
      _listData.addAll(val);
      setState(() {
        _listData;
      });
      // _listData.addAll(val);
      // print('getlist result is: $_listData');
      // print('getlist result.length is: ${_listData.length}');
    });
  }
  // 为了传参示例，写了一个比较复杂的参数
  _goDetail(id,name){
    int a = 0;
    String b = 'b';
    bool c = true;
    DetailParams detailParms = new DetailParams(
      id: id,
      name: name,
      examplelist: ['1','2']
    );
    NavigatorUtil.goDetailPage(context, a, b, c, detailParms);
  }

  @override
  void initState(){
    super.initState();
    // _getList(_page, _pageSize);
  }

  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SafeArea( // 没有appbar的情况下去除刘海
        child: EasyRefresh.custom(
          firstRefresh: true,
          firstRefreshWidget: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
              child: SizedBox(
              height: 200.0,
              width: 300.0,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitFadingCube(
                        color: Theme.of(context).primaryColor,
                        size: 25.0,
                      ),
                    ),
                    Container(
                      child: Text(Translations.of(context).text('loading')),
                      // child: Text(AppLocalizations.of(context).loading),
                    )
                  ],
                ),
              ),
            )),
          ),
          slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // print('context is $context');
                    return Item(index);
                  },
                  childCount: _count,
                ),
              ),
            ],
          onRefresh: () async {
            _listData = [];
            await  _getList(_page, _pageSize);
            await Future.delayed(Duration(seconds: 1), () {
              if (mounted) {
                setState(() {
                  _count = 10;
                  _page = 1;
                });
              }
            });
          },
          onLoad: () async {
            _getList(_page, _pageSize);
            await Future.delayed(Duration(seconds: 1), () {
              if (mounted) {
                setState(() {
                  _count += 10;
                  _page += 1;
                });
              }
            });
          },
        ),
      )
    );
  }

  Widget Item(int index) {
    var info = _listData[index];
    ListResult endInfo = ListResult.fromJson(info);
    return Card(
      child: Container (
        child:GestureDetector(
          onTap: (){
            _goDetail(endInfo.phone, endInfo.name);
          },
          behavior: HitTestBehavior.opaque,
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 90.0,
                child: CachedNetworkImage(
                  imageUrl: endInfo.avatar,
                  placeholder: (context, url) => Image.asset('assets/image/public/placeholder.jpg'),
                  errorWidget: (context, url, error) => Image.asset('assets/image/public/error.jpg'),
                )
              ),
              Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.all(
                      10.0,
                    ),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 120.0,
                                  height: 18.0,
                                  // color: Colors.grey[800],
                                  child: Text(endInfo.name),
                                ),
                                Container(
                                  width: 60.0,
                                  height: 18.0,
                                  margin: EdgeInsets.only(top: 8.0),
                                  // color: Colors.grey[200],
                                  child: Text(endInfo.phone),
                                ),
                              ],
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey[200],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 18.0,
                              // color: Colors.grey[200],
                              child: Text(endInfo.address),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Container(
                              width: double.infinity,
                              height: 18.0,
                              // color: Colors.grey[200],
                              child: Text(endInfo.company),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
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

