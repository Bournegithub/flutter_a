// 请求状态组件
import 'package:flutter/material.dart';
// 本来准备写一个上拉加载下拉刷新, 发现已经有很好的轮子，于是这个组件就留待不是列表刷新的页面再用

// 五种状态:无网络, 加载中, 成功, 错误, 空数据
enum LoadState { State_NoConnect, State_Loading, State_Success, State_Error, State_Empty }

class StateLayout extends StatefulWidget {
  final LoadState state; //页面状态
  final Widget successWidget;//成功视图
  final VoidCallback errorRetry; //错误事件处理
  StateLayout(
      {Key key,
      this.state = LoadState.State_Loading,//默认为加载状态
      this.successWidget,
      this.errorRetry})
      : super(key: key);
  @override
  _StateLayoutState createState() => _StateLayoutState();
}

class _StateLayoutState extends State<StateLayout> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      //宽高都充满屏幕剩余空间
      width: double.infinity,
      height: double.infinity,
      child: _buildWidget,
    );
  }
  Widget get _buildWidget {
    switch (widget.state) {
      case LoadState.State_NoConnect:
        return _noConnectView;
        break;
      case LoadState.State_Success:
        return widget.successWidget;
        break;
      case LoadState.State_Error:
        return _errorView;
        break;
      case LoadState.State_Loading:
        return _loadingView;
        break;
      case LoadState.State_Empty:
        return _emptyView;
        break;
      default:
        return null;
    }
  }

  // 无网络
  Widget get _noConnectView {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.transparent),
      alignment: Alignment.center,
      child: Container(
        height: 80,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0x88000000), borderRadius: BorderRadius.circular(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[CircularProgressIndicator(), Text('无网络')],
        ),
      ),
    );
  }

  // 加载中
  Widget get _loadingView {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.transparent),
      alignment: Alignment.center,
      child: Container(
        height: 80,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0x88000000), borderRadius: BorderRadius.circular(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[CircularProgressIndicator(), Text('正在加载')],
        ),
      ),
    );
  }

  // 报错
  Widget get _errorView {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/img/ic_error_page.png',
            height: 80,
            width: 100,
          ),
          Text("加载失败，请重试"),
          RaisedButton(
            color: Color(0xffbc2929),
            onPressed: widget.errorRetry,
            child: Text(
              '重新加载',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  // 空数据
  Widget get _emptyView {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/img/ic_empty.png',
            height: 100,
            width: 100,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('暂无数据'),
          )
        ],
      ),
    );
  }
}

// LoadState _layoutState = LoadState.State_Loading;
  // void getUser () {
  //   Future<dynamic> result = Service.login({'user': 'aa','pwd':'123456'});
  //   result.then((val){
  //     print('userresult: $val');
  //     if(val != null){
  //       setState(() {
  //        _layoutState = LoadState.State_Success;
  //       });
  //     } else {
  //       setState(() {
  //        _layoutState = LoadState.State_Error;
  //       });
  //     }
      
  //   }).catchError((err){
  //     print('usererror: $err');
  //     setState(() {
  //       _layoutState = LoadState.State_Error;
  //     });
  //   });
  //   // return userInfo;
  // }
// body: StateLayout(
//         state: _layoutState,
//         errorRetry: () {
//           setState(() {
//             _layoutState = LoadState.State_Loading;
//           }); 
//           getUser();
//         }, //错误按钮点击过后进行重新加载
//         successWidget: Center(
//           child: Text('加载成功'),
//         ),
//       ),