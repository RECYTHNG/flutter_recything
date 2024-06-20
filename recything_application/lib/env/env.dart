import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: "RECYTHING_BASE_URL")
  static const String recythingBaseUrl = _Env.recythingBaseUrl;

  @EnviedField(varName: "PLACES_BASE_URL")
  static const String placesBaseUrl = _Env.placesBaseUrl;

  @EnviedField(varName: "MAPS_API_KEY")
  static const String mapsApiKey = _Env.mapsApiKey;

  @EnviedField(varName: "TNC_BASE_URL")
  static const String tncBaseUrl = _Env.tncBaseUrl;
}
