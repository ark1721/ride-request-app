import 'package:http/http.dart' as http;
import '../models/ride_offer.dart';

class RiderServicesApi {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/todos/1';

  Future<RideOffer> fetchRideOffer(String pickup, String dropoff) async {
   
      final response = await http.get(
        Uri.parse('$baseUrl'),
      );

      if (response.statusCode != 200) {
      throw Exception('Failed to fetch ride');
    }

     return RideOffer.fromJson({
      'vehicle_type': 'Sedan',
      'driver_name': 'John Doe',
      'fare': 15,
      'eta_minutes': 5, 
    }); 
  }
}