import 'package:flutter/material.dart';
import '../providers/ride_provider.dart';
import 'package:provider/provider.dart';


/// Main screen where users request a ride.
/// 
/// Shows a fake map, location inputs, and displays
/// the ride result after a successful API call.
class RequestRideScreen extends StatelessWidget {
  const RequestRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch provider — rebuilds UI when state changes
    final provider = context.watch<RideProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Request a Ride')),
      body: Padding( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Fake map placeholder — replace with GoogleMap in production
            Container(
              height: 350,
              color: Colors.grey[200],
              child: const Center(child: Text('Map Here')),
            ),
            // Pickup location input field
            TextField(
              onChanged: (value) => provider.pickupLocation = value,
              decoration: const InputDecoration(labelText: 'Pickup Location'),
            ),
             // Drop location input field
            TextField(
              onChanged: (value) => provider.dropoffLocation = value,
              decoration: const InputDecoration(labelText: 'Dropoff Location'),
            ),

            const SizedBox(height: 10),

            // Find Ride button — shows spinner while loading
            // Disabled while loading to prevent duplicate requests
            ElevatedButton(
              onPressed: provider.requestRide,
               child: provider.isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text('Find Ride'),
            ),
            const SizedBox(height: 20),
            // Show error message if API call fails
            if (provider.errorMessage != null)
              Text(provider.errorMessage!, style: const TextStyle(color: Colors.red)),
              // Show ride details card when offer is available
            if (provider.rideOffer != null)
              Column(
                children: [
                  Text('Driver: ${provider.rideOffer!.driverName}'),
                  Text('Vehicle: ${provider.rideOffer!.vehicleType}'),
                  Text('Fare: ${provider.rideOffer!.fare} PKR'),
                  Text('ETA: ${provider.rideOffer!.etaMinutes} mins'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}