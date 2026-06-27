import 'app_config.dart';
import 'dev_config.dart';
import 'prod_config.dart';

class EnvironmentConfig {
  static AppConfig get config {
    const env = String.fromEnvironment(
      'ENV',
      defaultValue: 'DEV',
    );

    switch (env) {
      case 'PROD':
        return prodConfig;

      default:
        return devConfig;
    }
  }
}