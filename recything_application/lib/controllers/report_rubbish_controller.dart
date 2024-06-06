import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recything_application/models/maps/search_autocomplete_maps_model.dart';
import 'package:recything_application/services/maps/maps_service.dart';

class ReportRubbishController extends GetxController {
  Rx<LatLng?> currentLatLng = Rx<LatLng?>(null);
  Rx<Position?> currentPosition = Rx<Position?>(null);
  RxString currentAddress = RxString('');
  final Completer<GoogleMapController> mcontroller = Completer<GoogleMapController>();
  TextEditingController searchController = TextEditingController();
  RxList<Prediction> autoCompleteData = <Prediction>[].obs;
  RxString searchQuery = ''.obs;
  RxList<String> autocomplete = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentPosition();
  }

  void onSubmitSearch(String query) {
    searchQuery.value = query;
    fetchSearchAutoComplete(query);
  }

  void onChangeQuery(String query) {
    autocomplete.clear();
  }

  void fetchSearchAutoComplete(String query) async {
    autocomplete.clear();
    final data = await MapsService().getAutocomplete(query);
    autocomplete.value = data.map((item) => item.description).toList();
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) {
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
