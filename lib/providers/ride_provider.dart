import '../services/rider_services_api.dart';
import 'package:flutter/material.dart';
import '../models/ride_offer.dart';

/// Manages all ride request state for the UI.
/// 
/// Extends [ChangeNotifier] so widgets can listen
/// and rebuild when state changes.
class RideProvider extends ChangeNotifier {
    /// API service instance used to fetch ride data.
  final RiderServicesApi _api = RiderServicesApi();

  /// User entered pickup location.
  String? pickupLocation;
   /// User entered dropoff location.
  String? dropoffLocation;
  /// True while the API call is in progress.
  bool isLoading = false;
  /// Holds error message if the API call fails.
  String? errorMessage;
  /// Holds the ride offer returned from the API.
  RideOffer? rideOffer;


  /// Triggers a ride search using [pickupLocation] and [dropoffLocation].
  /// 
  /// Shows a loading spinner for minimum 2 seconds using [Future.wait].
  /// Updates [rideOffer] on success or [errorMessage] on failure.
  Future<void> requestRide() async {
    // Validate that both locations are entered
    if (pickupLocation == null || dropoffLocation == null) {
      errorMessage = 'Please enter both pickup and dropoff locations.';
      notifyListeners();
      return;
    }

 // Set loading state and notify UI
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
           // Run API call and 2 second delay at the same time.
      // Waits for BOTH to finish before continuing.
        final results = await Future.wait([
          _api.fetchRideOffer(pickupLocation!, dropoffLocation!),
          Future.delayed(const Duration(seconds: 2)),
        ]);
         // Extract the RideOffer from results
        rideOffer = results[0] as RideOffer;
    } catch (e) {
       // Store error message to display in UIcatch (e) {
  // Print real error to console
  print('ERROR: $e');
  errorMessage = 'Failed to fetch ride offer. Please try again.';
    } finally {
      // Always stop loading whether success or failure
      isLoading = false;
      notifyListeners();
    }
  }
}