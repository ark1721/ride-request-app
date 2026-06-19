
/// Represents a single ride offer returned from the API.
class RideOffer {
  final String vehicleType;
  final String driverName;
  final int fare;
  final int etaMinutes;


 /// Creates a [RideOffer] with all required fields.
const RideOffer({
  required this.vehicleType,
  required this.driverName,
  required this.fare,
  required this.etaMinutes,
});


  /// Creates a [RideOffer] from a JSON map.
  /// Example: {'vehicle_type': 'Bike', 'fare': 180}
factory RideOffer.fromJson(Map<String, dynamic> json) {
  return RideOffer(
    vehicleType: json['vehicle_type'] as String,
    driverName: json['driver_name'] as String,
    fare: json['fare'] as int,
    etaMinutes: json['eta_minutes'] as int,
  );
}
}