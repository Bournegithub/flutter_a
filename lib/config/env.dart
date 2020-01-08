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
        return 'https://www.fastmock.site/mock/837f5a3e982ac769f34129083f6581fc/api';
      case Env.DEV:
        return 'https://www.fastmock.site/mock/75b5458fc158b357c674f8520e355db0/api';
      case Env.LOCAL:
      default:
        return 'https://www.fastmock.site/mock/75b5458fc158b357c674f8520e355db0/api';
    }
  }
}