import 'package:flutter/material.dart';
import '../routers/navigatorUtil.dart';


class CompoentsPage extends StatefulWidget {
  CompoentsPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CompoentsPageState createState() => _CompoentsPageState();
}

class _CompoentsPageState extends State<CompoentsPage> with AutomaticKeepAliveClientMixin {
  @protected
  bool get wantKeepAlive => true;

  _goPage(pagename) {
    switch(pagename){
      case 'Scaffold': {
        NavigatorUtil.goCPScaffold(context);
      }
      break;
      case 'RowCloumn': {
        NavigatorUtil.goCPRowcloumn(context);
      }
      break;
      case 'Placeholder': {
        NavigatorUtil.goCPPlaceholder(context);
      }
      break;
      case 'TabBar': {
        NavigatorUtil.goCPTabbar(context);
      }
      break;
      case 'Drawer': {
        NavigatorUtil.goCPDrawer(context);
      }
      break;
      case 'DateTimePickers': {
        NavigatorUtil.goCPDatePickers(context);
      }
      break;
      case 'Form': {
        NavigatorUtil.goCPForm(context);
      }
      break;
      case 'DataTable': {
        NavigatorUtil.goCPDataTable(context);
      }
      break;
      case 'Stepper': {
        NavigatorUtil.goCPStepper(context);
      }
      break;
      case 'Chip': {
        NavigatorUtil.goCPChip(context);
      }
      break;
      case 'ExpansionPanel': {
        NavigatorUtil.goCPPanel(context);
      }
      break;
      case 'Dialog': {
        NavigatorUtil.goCPDialog(context);
      }
      break;

      default: {

      }
      break;
    }
  }

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Scaffold'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                _goPage('Scaffold');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Row & Cloumn'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                _goPage('RowCloumn');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Placeholder'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                _goPage('Placeholder');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('TabBar & TabBarView'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                _goPage('TabBar');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Drawer'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                _goPage('Drawer');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Date & Time Pickers'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                _goPage('DateTimePickers');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Form'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                _goPage('Form');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('DataTable'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                _goPage('DataTable');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Stepper'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                _goPage('Stepper');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Chip'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                _goPage('Chip');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('ExpansionPanel'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                _goPage('ExpansionPanel');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('Dialog'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                _goPage('Dialog');
              },
            ),
          ),
        ],
      )
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}