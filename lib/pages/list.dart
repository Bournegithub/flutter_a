import 'package:flutter/material.dart';
import 'package:flutter_a/i18n/applocalizations.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../service/service.dart';
import '../model/listResult.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}


class _ListPageState extends State <ListPage>  {
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
      // _listData.addAll(val);
      print('getlist result is: $_listData');
      print('getlist result.length is: ${_listData.length}');
    });
  }
  @override
  void initState(){
    super.initState();
    // _getList(_page, _pageSize);
  }
  Widget build(BuildContext context) {
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
                      child: Text(AppLocalizations.of(context).loading),
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
    // print('endInfo: $endInfo');
    // print('endInfo.name: ${endInfo.name}');
    // print('endInfo.phone: ${endInfo.phone}');
    // print('endInfo.token: ${endInfo.token}');
    // print('endInfo.address: ${endInfo.address}');
    // print('endInfo.company: ${endInfo.company}');
    // print('endInfo.avatar: ${endInfo.avatar}');
    return Card(
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80.0,
                    height: 90.0,
                    child: new Image.network(
                      endInfo.avatar,
                    ),
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
            ),
          );
    // return Container(
    //   width: double.infinity,
    //   height: 80.0,
    //   child: Center(
    //     child: Text('${endInfo.name}'),
    //   ),
    //   color: index%2==0 ? Colors.grey[300] : Colors.transparent,
    // );
  }
  @override
  void dispose() {
    super.dispose();
  }
}

