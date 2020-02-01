// 获取app相关信息
import 'package:package_info/package_info.dart';

class PackageUtil {
  static PackageInfo packageInfo;

  //初始化
  static init() async {
    packageInfo = await PackageInfo.fromPlatform();
    print('packageInfo: $packageInfo');
  }
  //APP名称
  static dynamic getAppNameString(){
    return packageInfo.appName.toString();
  }
  //包名
  static dynamic getPackageNameString(){
    return packageInfo.packageName.toString();
  }
  //版本名
  static dynamic getVersionString(){
    return packageInfo.version.toString();
  }
  //版本号
  static dynamic getBuildNumberString(){
    return packageInfo.buildNumber.toString();
  }
}