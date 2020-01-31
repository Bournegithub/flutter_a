import '../config/env.dart';
import './api.dart';
import '../http/http.dart';
import '../http/result_data.dart';

// 获取对应环境的host地址, 只能区分prod和dev
final currentEnv = bool.fromEnvironment('dart.vm.product') ? Config.env = Env.PROD : Config.env = Env.DEV;
final baseUrl = Config.apiHost;
// baseurl不放在dio处统一配置是为了更灵活的使用，以防出现请求不同的host时候需要改动dio的封装代码
class Service {
  static login(parms) async {
    try {
      var result = await Http().post(baseUrl + ApiList.login, data: parms);
      int code = result['code'];
      var data = result['data'];
      if (code == 0) {
        return data;
      } else {
        // 外层拦截操作
      }
    } catch (e) {
      print('await报错--- $e');
    }
    
    // final responseJson = json.decode(response);
    // Map<String, dynamic> newTitle = responseJson ;
    // print(newTitle['title']);
    // print('aaaaa');
    // final result = await Http().post(baseUrl + ApiList.login);
    // print('bbbb');
    // print(result);
    // // http().post的返回的是类似于前端的promise对象，在这里需要处理一下
    // result.then((res) {
    //   print('ccccc');
    //   print(res);
    //   return res;
    // });
    // return reslut;
  }
  static getAD() async {
    try {
      var result = await Http().post(baseUrl + ApiList.ad,data: {'ad':1});
      int code = result['code'];
      var data = result['data'];
      print('reslut is $result');
      if (code == 0) {
        return data;
      } else {
        // 外层拦截操作
      }
    } catch (e) {
      print('await报错--- $e');
    }
  }
  static getList(parms) async {
    try {
      var result = await Http().post(baseUrl + ApiList.list, data: parms);
      int code = result['code'];
      var data = result['data'];
      if (code == 0) {
        return data;
      } else {
        // 外层拦截操作
      }
    } catch (e) {
      print('list接口/await报错--- $e');
    }
  }
}