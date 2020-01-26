enum Env {
  PROD,
  DEV,
  LOCAL,
}

class Config {
  static Env env;
  static String get apiHost {
    switch (env) {
      case Env.PROD:
        return 'https://www.fastmock.site/mock/63ee30171b499582c35f9064df5913ea/api';
      case Env.DEV:
        return 'https://www.fastmock.site/mock/911820327f34584a19bd00d2a2deb9db/api';
      case Env.LOCAL:
      default:
        return 'https://www.fastmock.site/mock/911820327f34584a19bd00d2a2deb9db/api';
    }
  }
}