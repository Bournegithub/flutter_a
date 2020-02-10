import 'package:cached_network_image/cached_network_image.dart';
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

class _DetailPageState extends State<DetailPage> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;
  int exampleint;
  String examplestring;
  bool examplebool;
  var defaultparams;
  AnimationController animationController;
  Animation<double> anim;
// anim = Tween(begin: 200.0, end: 0.0).animate(animationController);

// animationController.forward(from:0);
  _goList(){
    // 如需保持上一页状态使用goback
    NavigatorUtil.goBack(context);
    // 不需要保持状态的时候使用传参的形式
    // int index = 0;
    // HomeParams homeParms = new HomeParams(params1: 'detail页面返回example1', params2: 'detail页面返回example2');
    // NavigatorUtil.backHomePage(context, index, homeParms);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    exampleint = widget.paramsInt;
    examplestring = widget.paramsString;
    examplebool = widget.paramsBool;
    DetailParams defaultparams = DetailParams.fromJson(FluroConvertUtils.string2map(widget.paramsJson));
    print('exampleint is: $exampleint & examplestring is: $examplestring & examplebool is: $examplebool');
    return Scaffold(
      body: Listener(

        child: CustomScrollView(
        physics: ClampingScrollPhysics(),  //  BouncingScrollPhysics() or ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                _goList();
              },
            ),
            floating: true,
            pinned: true,
            snap: false,
            elevation: 0.5, ///设置AppBar透明，必须设置为0
            backgroundColor: Colors.grey[200],
            expandedHeight: 160,//必须设定,否则无法显示
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver App Bar'),
              background: CachedNetworkImage(
                imageUrl: 'https://img.zcool.cn/community/010d085e3b96c3a80120a8957e90b7.jpg@1280w_1l_2o_100sh.jpg',
                placeholder: (context, url) => Image.asset('assets/image/public/placeholder.jpg'),
                errorWidget: (context, url, error) => Image.asset('assets/image/public/error.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context,index){
            return Container(
              child: Card(
                child: ListTile(
                  leading: FlutterLogo(),
                  title: Text('One-line with both widgets $index'),
                  trailing: Icon(Icons.more_vert),
                ),
              )
            );
          },
          childCount: 50
        )
      )
    ],
    )
  )
      // appBar: PreferredSize(
      //   child: Container(
      //     width: double.infinity,
      //     height: double.infinity,
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(colors: [Colors.yellow, Colors.pink]),
      //       image: DecorationImage(
      //         image: NetworkImage('https://img.zcool.cn/community/010d085e3b96c3a80120a8957e90b7.jpg@1280w_1l_2o_100sh.jpg'),
      //         fit: BoxFit.cover
      //       ),
      //     ),
      //     child: SafeArea(
      //       child: new AppBar(
      //         centerTitle: true,
      //         title: Text(
      //           defaultparams.name,
      //           textAlign:TextAlign.center,
      //           style: TextStyle(

      //           ),
      //         ),
      //         elevation: 0, ///设置AppBar透明，必须设置为0
      //         backgroundColor: Colors.transparent,
      //         leading: new IconButton(
      //           tooltip: 'Previous choice',
      //           icon: const Icon(Icons.keyboard_arrow_left),
      //           onPressed: () { 
      //             _goList();
      //           },
      //         )
      //       )
      //     ),
      //   ),
      //   preferredSize: Size(double.infinity, 200)
      // ),
      // body: Container(
      //   child:Listener(
      //     onPointerMove: (event) {
      //       var position = event.position.distance;
      //       var dy = event.position.dy;
      //       print('position is $position');
      //       print('dy is $dy');
      //       var mi = position - dy;
      //       print('mi is $mi');
      //       // var detal = position - lastDownY;
            
      //     },
      //     child: ListView(
      //       controller: _scrollController,
      //       children: <Widget>[
      //         Container(
      //           padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             children:<Widget>[
      //               Container(
      //                 width: 60,
      //                 height: 60,
      //                 child: ClipOval(
      //                   child: CachedNetworkImage(
      //                     imageUrl: 'https://img.zcool.cn/community/04253658ccc2d1a801219c77021d16.jpg@160w_160h_1c_1e_1o_100sh.jpg',
      //                     placeholder: (context, url) => Image.asset('assets/image/public/placeholder.jpg'),
      //                     errorWidget: (context, url, error) => Image.asset('assets/image/public/error.jpg'),
      //                   )
      //                 ),
      //               ),
      //               Container(
      //                 width: 60,
      //                 height: 60,
      //                 child: ClipOval(
      //                   child: CachedNetworkImage(
      //                     imageUrl: 'https://img.zcool.cn/community/04253658ccc2d1a801219c77021d16.jpg@160w_160h_1c_1e_1o_100sh.jpg',
      //                     placeholder: (context, url) => Image.asset('assets/image/public/placeholder.jpg'),
      //                     errorWidget: (context, url, error) => Image.asset('assets/image/public/error.jpg'),
      //                   )
      //                 ),
      //               ),
      //               Container(
      //                 width: 60,
      //                 height: 60,
      //                 child: ClipOval(
      //                   child: CachedNetworkImage(
      //                     imageUrl: 'https://img.zcool.cn/community/04253658ccc2d1a801219c77021d16.jpg@160w_160h_1c_1e_1o_100sh.jpg',
      //                     placeholder: (context, url) => Image.asset('assets/image/public/placeholder.jpg'),
      //                     errorWidget: (context, url, error) => Image.asset('assets/image/public/error.jpg'),
      //                   )
      //                 ),
      //               ),
      //               Container(
      //                 width: 60,
      //                 height: 60,
      //                 child: ClipOval(
      //                   child: CachedNetworkImage(
      //                     imageUrl: 'https://img.zcool.cn/community/04253658ccc2d1a801219c77021d16.jpg@160w_160h_1c_1e_1o_100sh.jpg',
      //                     placeholder: (context, url) => Image.asset('assets/image/public/placeholder.jpg'),
      //                     errorWidget: (context, url, error) => Image.asset('assets/image/public/error.jpg'),
      //                   )
      //                 ),
      //               ),
                    
      //             ]
      //           ),
      //         ),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //         Card(child: ListTile(title: Text('One-line ListTile'))),
      //       ]
      //     ),
      //   )
        
      // )
      
    );
  }
}