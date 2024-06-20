class PlacesMapsModel {
  final String formattedAddress;
  final String name;
  final String placeId;
  final Geometry geometry;

  PlacesMapsModel({
    required this.formattedAddress,
    required this.name,
    required this.placeId,
    required this.geometry,
  });

  factory PlacesMapsModel.fromJson(Map<String, dynamic> json) {
    return PlacesMapsModel(
      formattedAddress: json['formatted_address'],
      name: json['name'],
      placeId: json['place_id'],
      geometry: Geometry.fromJson(
        json['geometry'],
      ),
    );
  }
}

class Geometry {
  final Location location;

  Geometry({
    required this.location,
  });

  factory Geometry.fromJson(Map<String, dynamic> geometryJson) {
    return Geometry(
      location: Location.fromJson(
        geometryJson['location'],
      ),
    );
  }
}

class Location {
  final double lat;
  final double long;

  Location({
    required this.lat,
    required this.long,
  });

  factory Location.fromJson(Map<String, dynamic> jsonLocation) {
    return Location(
      lat: jsonLocation['lat'],
      long: jsonLocation['lng'],
    );
  }
}
