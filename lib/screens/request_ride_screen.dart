import 'package:flutter/material.dart';
import '../providers/ride_provider.dart';
import 'package:provider/provider.dart';



class RequestRideScreen extends StatelessWidget {
  const RequestRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RideProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Request a Ride')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(child: Text('Map Here')),
            ),
            TextField(
              onChanged: (value) => provider.pickupLocation = value,
              decoration: const InputDecoration(labelText: 'Pickup Location'),
            ),
            TextField(
              onChanged: (value) => provider.dropoffLocation = value,
              decoration: const InputDecoration(labelText: 'Dropoff Location'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: provider.requestRide,
               child: provider.isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text('Find Ride'),
            ),
            const SizedBox(height: 20),
            if (provider.errorMessage != null)
              Text(provider.errorMessage!, style: const TextStyle(color: Colors.red)),
            if (provider.rideOffer != null)
              Column(
                children: [
                  Text('Driver: ${provider.rideOffer!.driverName}'),
                  Text('Vehicle: ${provider.rideOffer!.vehicleType}'),
                  Text('Fare: \$${provider.rideOffer!.fare}'),
                  Text('ETA: ${provider.rideOffer!.etaMinutes} mins'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}