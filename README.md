# flutter_a

微信:13816099235, 邮箱:xuhui.yon@gmail.com

flutter基础架构包, 包含路由封装, 页面传参(string/int/bool以及obj参数序列化示例), env环境变量, dio请求封装, 不同请求状态, 变量存储, 国际化, 版本更新, 图片缓存, webview, 基于请求返回结果分层反序列化(service请求封装处做外层解析,业务页面做内层解析)

页面包含启动页, 引导页, 广告页, 首页以及其他demo页面. 流程是首次（或版本更新后首次）打开app, 启动页 > 引导页 > 首页 > 其他页面, 正常情况则是 启动页 > 广告页（点击广告页到达webviewh5页面后返回首页）> 首页 > 其他页面


写给和我一样刚入坑flutter的菜鸟, 一开始觉得很难搞懂的不要纠结一个点钻牛角尖, 往下写, 写得多了对dart熟悉一点有点积累, 回头在看。

参考:

参考了以下文章，谢谢各位大神

路由封装/传参:

https://github.com/LZQL/flutter_learning_demo

https://github.com/LZQL/flutter_learning_demo/tree/master/fluro_test

国际化多语言切换:

https://flutterchina.club/tutorials/internationalization/

https://www.jianshu.com/p/77e51069b90e

请求封装:

https://github.com/flutterchina/dio

https://www.jianshu.com/p/5ead0cf96642

序列化反序列化:

https://juejin.im/post/5b5d782ae51d45191c7e7fb3

序列化工具:

https://javiercbk.github.io/json_to_dart/

下拉重载下拉刷新:

https://pub.dev/packages/flutter_easyrefresh
