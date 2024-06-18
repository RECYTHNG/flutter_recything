import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/controllers/report_litter_controller.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';

class LocationMapsReportLitterWidget extends StatelessWidget {
  const LocationMapsReportLitterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportLitterController locationController = Get.find();
    locationController.initializeData();
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Center(
        child: Obx(() {
          if (locationController.currentLatLng.value == null) {
            return const MyLoading();
          } else {
            return GoogleMap(
              markers: {
                Marker(
                  markerId: const MarkerId('currentPosition'),
                  position: locationController.currentLatLng.value!,
                ),
              },
              onMapCreated: (GoogleMapController mapController) {
                locationController.mcontroller.complete(mapController);
                locationController
                    .moveCamera(locationController.currentLatLng.value!);
              },
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: locationController.currentLatLng.value!,
                zoom: 15,
              ),
            );
          }
        }),
      ),
    );
  }
}
