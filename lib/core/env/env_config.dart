class EnvConfig {
  static Map? get devConfig => _data['envs']!['dev']!;

  static final _data = {
    "envs": {
      "dev": {
        "base_url": "https://api-perdimeupet.herokuapp.com",
      }
    },
  };
}
