import 'env_config.dart';

class Env {
  static bool dev = true;
  static bool autoFill = false;

  static Map? get envConfig => EnvConfig.devConfig;
  static String get baseUrl => envConfig!['base_url'];
}
