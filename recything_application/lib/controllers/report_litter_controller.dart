import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recything_application/models/maps/search_autocomplete_maps_model.dart';
import 'package:recything_application/services/maps/maps_service.dart';

class ReportLitterController extends GetxController {
  final Completer<GoogleMapController> mcontroller =
      Completer<GoogleMapController>();
  Rx<LatLng?> currentLatLng = Rx<LatLng?>(null);
  RxString currentAddress = RxString('');
  Rx<Position?> currentPosition = Rx<Position?>(null);
  TextEditingController searchController = TextEditingController();
  RxList<Prediction> fetchedSearchResultData = <Prediction>[].obs;
  RxString searchQuery = RxString('');
  RxList<String> autocomplete = <String>[].obs;
  RxBool isGettingCurrentLocation = false.obs;

  RxString address = ''.obs;
  RxString city = ''.obs;
  RxString province = ''.obs;
  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   initializeData();
  // }

  void initializeData() async {
    await getCurrentPosition();
  }

  void onSubmitSearch(String query) {
    searchQuery.value = query;
    fetchSearchAutoComplete(query);
  }

  void onChangeQuery(String query) {
    autocomplete.clear();
  }

  void onClearedController() {
    autocomplete.clear();
  }

  void onSearchResultSelected(String selectedPlace) async {
    autocomplete.clear();
    Prediction matchedData = fetchedSearchResultData
        .firstWhere((data) => data.description == selectedPlace);
    final placesData =
        await MapsService().getPlacesDetails(matchedData.placeId);
    final double latPlaces = placesData.geometry.location.lat;
    final double longPlaces = placesData.geometry.location.long;
    lat.value = latPlaces;
    long.value = longPlaces;
    currentLatLng.value = LatLng(latPlaces, longPlaces);
    moveCamera(currentLatLng.value!);
    List<Placemark> placemark =
        await placemarkFromCoordinates(latPlaces, longPlaces);
    await getAddressByPlacemark(placemark.first);
  }

  void fetchSearchAutoComplete(String query) async {
    autocomplete.clear();
    try {
      final data = await MapsService().getAutocomplete(query);
      fetchedSearchResultData.value = data;
      autocomplete.value = data.map((item) => item.description).toList();
    } catch (e) {
      autocomplete.add('Hasil tidak ditemukan');
    }
  }

  Future<void> getCurrentPosition() async {
    isGettingCurrentLocation.value = true;
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) {
      isGettingCurrentLocation.value = false;
      return;
    }
    currentPosition.value = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    if (currentPosition.value != null) {
      await getAddressByLatLong(currentPosition.value!);
      searchController.text = currentAddress.value;
      currentLatLng.value = LatLng(
          currentPosition.value!.latitude, currentPosition.value!.longitude);
      moveCamera(currentLatLng.value!);
    }
    isGettingCurrentLocation.value = false;
  }

  Future<void> getAddressByPlacemark(Placemark placemark) async {
    currentAddress.value =
        '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.postalCode}';
    searchController.text = currentAddress.value;
    address.value =
        '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}';
    city.value = placemark.subAdministrativeArea!;
    province.value = placemark.administrativeArea!;
  }

  Future<void> getAddressByLatLong(Position position) async {
    try {
      final resultAddress = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark placemark = resultAddress.first;
      currentAddress.value =
          '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.postalCode}';
      lat.value = position.latitude;
      long.value = position.longitude;
      address.value =
          '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}';
      city.value = placemark.subAdministrativeArea!;
      province.value = placemark.administrativeArea!;
    } catch (e) {
      // print('Failed to get address: $e');
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
        'Location Service Disabled',
        'Please enable location service',
      );
      return false;
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        Get.snackbar(
          'Location Permission Denied',
          'Please allow location permission',
        );
        return false;
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      Get.snackbar(
        'Location Permission Denied Permanently',
        'Please enable location permission in device settings',
      );
      return false;
    }
    return true;
  }

  void moveCamera(LatLng newLatLng) async {
    final GoogleMapController controller = await mcontroller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: newLatLng,
          zoom: 15,
        ),
      ),
    );
  }
}
