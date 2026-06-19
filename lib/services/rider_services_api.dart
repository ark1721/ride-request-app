import 'package:http/http.dart' as http;
import '../models/ride_offer.dart';

/// Handles all API communication for ride requests.
class RiderServicesApi {
  /// Base URL of the fake API endpoint.
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/todos/1';

  /// Fetches a ride offer from the API.
  /// 
  /// Takes [pickup] and [dropoff] location strings.
  /// Returns a [RideOffer] on success.
  /// Throws an [Exception] if the request fails.
  Future<RideOffer> fetchRideOffer(String pickup, String dropoff) async {
     // Make a GET request to the fake API
      final response = await http.get(
        Uri.parse('$baseUrl'),
      );

    // If server returns anything other than 200, throw an error

      if (response.statusCode != 200) {
      throw Exception('Failed to fetch ride');
    }
// API call succeeded — return a fake ride offer
     return RideOffer.fromJson({
      'vehicle_type': 'Bike',
      'driver_name': 'Ahmed Raza',
      'fare': 180,
      'eta_minutes': 4, 
    }); 
  }
}