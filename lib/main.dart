import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/ride_provider.dart';
import 'screens/request_ride_screen.dart';

void main() {
  runApp(const RideApp());
}

/// Root widget. Wraps the whole tree with [RideProvider] so any
/// descendant can read or watch ride state.
class RideApp extends StatelessWidget {
  const RideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Create the provider at the top level; it will be disposed
      // automatically when the app is removed from the widget tree.
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
        home: const RequestRideScreen(),
      ),
    );
  }
}
