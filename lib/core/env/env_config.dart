class EnvConfig {
  static Map? get devConfig => _data['envs']!['dev']!;

  static final _data = {
    "envs": {
      "dev": {
        "base_url": "http://192.168.1.12:8080",
      }
    },
  };
}
