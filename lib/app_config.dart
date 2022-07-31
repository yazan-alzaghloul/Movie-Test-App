class AppConfig {
  final baseUrl;
  final apiKey;

  String get apiBaseUrl => '$baseUrl';

  AppConfig({required this.baseUrl, required this.apiKey});
}
