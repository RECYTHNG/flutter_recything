import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/maps/places_maps_model.dart';
import 'package:recything_application/models/maps/search_autocomplete_maps_model.dart';

class MapsService {
  final _dio = Dio();

  Future<List<Prediction>> getAutocomplete(String query) async {
    try {
      final response = await _dio.get(
        '$placesBaseUrl/autocomplete/json',
        queryParameters: {
          'input': query,
          'key': mapsApiKey,
        },
      );
      if (response.statusCode == 200) {
        final decodedResponse = response.data;
        if (decodedResponse['status'] == "OK") {
          final List<dynamic> predictionData = decodedResponse['predictions'];
          return predictionData
              .map((data) => Prediction.fromJson(data))
              .toList();
        } else {
          throw 'Error: ${decodedResponse['status']}';
        }
      } else {
        throw 'Error Status Code ${response.statusCode}';
      }
    } catch (e) {
      throw 'Error: $e';
    }
  }

  Future<PlacesMapsModel> getPlacesDetails(String placeId) async {
    try {
      final response = await _dio.get(
        '$placesBaseUrl/details/json',
        queryParameters: {
          'place_id': placeId,
          'key': mapsApiKey,
        },
      );
      if (response.data['status'] == "OK") {
        final data = response.data;
        return PlacesMapsModel.fromJson(data['result'],);
      } if (response.data['status'] == "ZERO_RESULTS") {
        throw Exception;
      }
      else {
        throw 'Error Status Code ${response.statusCode}';
      }
    } catch (e) {
      throw '$e';
    }
  }
}