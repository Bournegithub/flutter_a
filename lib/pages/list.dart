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
  List <Object> _listData ;
  _getList () {
    Future result = Service.getList({'count': _count, 'page': _page});
    result.then((val){
      _listData = val;
      print('getlist result is: $val');
    });
  }
  @override
  void initState(){
    super.initState();
    _getList();
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
            await Future.delayed(Duration(seconds: 2), () {
              if (mounted) {
                setState(() {
                  _count = 5;
                });
              }
            });
          },
          onLoad: () async {
            await Future.delayed(Duration(seconds: 2), () {
              if (mounted) {
                setState(() {
                  _count += 5;
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
    print('endInfo: $endInfo');
    print('endInfo.name: ${endInfo.name}');
    print('endInfo.phone: ${endInfo.phone}');
    print('endInfo.token: ${endInfo.token}');
    print('endInfo.address: ${endInfo.address}');
    print('endInfo.company: ${endInfo.company}');
    print('endInfo.avatar: ${endInfo.avatar}');
    return Container(
      width: 60.0,
      height: 80.0,
      child: Center(
        child: Text('${endInfo.name}'),
      ),
      color: index%2==0 ? Colors.grey[300] : Colors.transparent,
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}

