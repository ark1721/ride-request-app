import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/ride_provider.dart';
import 'screens/request_ride_screen.dart';

/// Entry point of the application.
void main() {
  runApp(const RideApp());
}

/// Root widget of the app.
/// 
/// Wraps the entire widget tree with [ChangeNotifierProvider]
/// so any descendant can access [RideProvider].
class RideApp extends StatelessWidget {
  const RideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Creates one shared RideProvider instance for the whole app
      create: (_) => RideProvider(),
      child: MaterialApp(
        title: 'Ride App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFF1565C0),
          useMaterial3: true,
          fontFamily: 'Roboto',
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.transparent,
          ),
        ),

        // First screen shown when app launches
        home: const RequestRideScreen(),
      ),
    );
  }
}
