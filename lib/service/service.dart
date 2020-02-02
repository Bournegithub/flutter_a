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
      ResultData endResult = ResultData.fromJson(result);
      // print('Service- endResult.code: ${endResult.code}');
      // print('Service- endResult.status: ${endResult.status}');
      // print('Service- endResult.env: ${endResult.env}');
      if (endResult.code == 0) {
        return endResult.data;
      } else {
        // 外层拦截操作
      }
    } catch (e) {
      print('await报错--- $e');
    }
  }
  static getAD() async {
    try {
      var result = await Http().post(baseUrl + ApiList.ad,data: {'ad':1});
      ResultData endResult = ResultData.fromJson(result);
      print('Service- endResult.code: ${endResult.code}');
      print('Service- endResult.status: ${endResult.status}');
      print('Service- endResult.env: ${endResult.env}');
      if(endResult.code == 0) {
        return endResult.data;
      } else {
        // 异常处理
      }
      print('reslut is $result');
      if (result.code == 0) {
        return result.data;
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
      print('Service- result: $result');
      ResultData endResult = ResultData.fromJson(result);
      print('Service- endResult.code: ${endResult.code}');
      print('Service- endResult.status: ${endResult.status}');
      print('Service- endResult.env: ${endResult.env}');
      if(endResult.code == 0) {
        return endResult.data;
      } else {
        // 异常处理
      }
    } catch (e) {
      print('list接口/await报错--- $e');
    }
  }
}