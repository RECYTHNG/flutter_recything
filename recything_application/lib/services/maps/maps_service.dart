import 'package:dio/dio.dart';
import 'package:recything_application/models/maps/places_maps_model.dart';
import 'package:recything_application/models/maps/search_autocomplete_maps_model.dart';

class MapsService {
  final _dio = Dio();
  String baseUrl = 'https://maps.googleapis.com/maps/api/place';
  String apiKey = 'AIzaSyDyIO9UzX_LRye-t1Q_Zro1pHH6_VlvPnA';

  Future<List<Prediction>> getAutocomplete(String query) async {
    try {
      final response =
          await _dio.get('$baseUrl/autocomplete/json', queryParameters: {
        'input': query,
        'key': apiKey,
      });

      if (response.statusCode == 200) {
        final decodedResponse = response.data;
        // print('decode $decodedResponse');
        if (decodedResponse['status'] == "OK") {
          final List<dynamic> predictionData = decodedResponse['predictions'];
          return predictionData
              .map((data) => Prediction.fromJson(data))
              .toList();
        } else {
          throw 'Error: ${decodedResponse['status']}';
        }
      } else {
        throw 'Error: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Error: $e';
    }
  }

  Future<PlacesMapsModel> getPlacesDetails(String placeId) async {
    try {
      final response = await _dio.get(
        '$baseUrl/details/json',
        queryParameters: {
          'place_id': placeId,
          'key': apiKey,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final PlacesMapsModel formattedData = PlacesMapsModel.fromJson(data['result']);
        return formattedData;
      } else {
        throw 'Error Status Code ${response.statusCode}';
      }
    } catch (e) {
      throw '$e';
    }
  }
}
