import '../services/rider_services_api.dart';
import 'package:flutter/material.dart';
import '../models/ride_offer.dart';


class RideProvider extends ChangeNotifier {
  final RiderServicesApi _api = RiderServicesApi();

  String? pickupLocation;
  String? dropoffLocation;
  bool isLoading = false;
  String? errorMessage;
  RideOffer? rideOffer;

  Future<void> requestRide() async {
    if (pickupLocation == null || dropoffLocation == null) {
      errorMessage = 'Please enter both pickup and dropoff locations.';
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
        final results = await Future.wait([
          _api.fetchRideOffer(pickupLocation!, dropoffLocation!),
          Future.delayed(const Duration(seconds: 2)),
        ]);
        rideOffer = results[0] as RideOffer;
    } catch (e) {
      errorMessage = 'Failed to fetch ride offer. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}