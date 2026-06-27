import 'environment.dart';

class AppConfig{
  final String appName;
  final String baseUrl;
  final Environment environment;

  const AppConfig({
    required this.appName,
    required this.baseUrl,
    required this.environment,
  });
}