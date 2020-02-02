# flutter_a

微信 13816099235

flutter基础架构包, 包含路由封装，env环境变量, dio请求封装, 不同请求状态, 变量存储, 国际化, 版本更新, 图片缓存, webview, 基于请求返回结果分层序列化(service请求封装处做外层解析,业务页面做内层解析)

页面包含启动页, 引导页, 广告页, 首页以及其他demo页面. 流程是首次（或版本更新后首次）打开app, 启动页 > 引导页 > 首页 > 其他页面, 正常情况则是 启动页 > 广告页（点击广告页到达webviewh5页面后返回首页）> 首页 > 其他页面


写给和我一样刚入坑的菜鸟, 一开始觉得很难搞懂的不要深究，先往下写。写得多了对dart熟悉一点有点积累, 回头在看。国际化和请求返回的json反序列化都是写到一半有点开窍了又回去重新改。

参考:

参考了以下文章，谢谢各位大神

路由封装:

https://github.com/LZQL/flutter_learning_demo

请求封装:

https://github.com/flutterchina/dio

https://www.jianshu.com/p/5ead0cf96642

序列化反序列化:

https://juejin.im/post/5b5d782ae51d45191c7e7fb3

序列化工具:

https://javiercbk.github.io/json_to_dart/

下拉重载下拉刷新:

https://pub.dev/packages/flutter_easyrefresh
