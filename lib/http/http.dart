import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import '../model/outResult.dart';

class Http{
  static Http instance;
  static String token;
  static Dio _dio;
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
  String _contentType = 'application/json';
  BaseOptions _options;
  static Http getInstance(){
    print("getInstance");
    if(instance == null){
      instance  = new Http();
    }
  }

  Http(){
  		// 初始化 Options
    _options = new BaseOptions(
      //请求基地址,可以包含子路径 此处不设置，由外面调用设置
      // baseUrl: "http://www.google.com",
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10*1000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      //Http请求头.
      headers: {
        //do something
        "version": "1.0.0"
      },
      //请求的Content-Type，默认值是[ContentType.json]. 也可以用ContentType.parse("application/x-www-form-urlencoded")
      contentType: _contentType,
      //表示期望以那种格式(方式)接受响应数据。接受4种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.json,
    );

    _dio = new Dio(_options);
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      var currentConnected = await isConnected();
      // 检查当前网络状况之后再处理
      print("请求之前");
      print('currentConnected: $currentConnected');
      if(currentConnected) {
        return options;
      } else {
        return null;
      }
    }, onResponse: (Response response) {
      print("响应之前 ----- $response");
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      print("错误之前");
      // Do something with response error
      return e; //continue
    }));
  }



   // get 请求封装
  get(url,{data}) async {
    print('get:::url：$url ,body: $data');
    Response response;
    try{
      response = await _dio.get(url, queryParameters: data);
    }on DioError catch(e){
      print('post error---------$e');
      formatError(e);
    }
    return response.data;
  }
	
	// post请求封装
  post(url,{data}) async {
    print('post请求::: url：$url ,body: $data');
    Response response;
    try{
      response = await _dio.post(url,queryParameters: data);
      print('打印response-- $response');
    }on DioError catch(e){
      print('post error---------$e');
      formatError(e);
    }
    print('打印response-- $response');
    print('打印response.data-- ${response.data}');
    return response.data;
  }
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }
}