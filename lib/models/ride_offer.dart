

class RideOffer {
  final String vehicleType;
  final String driverName;
  final int fare;
  final int etaMinutes;

const RideOffer({
  required this.vehicleType,
  required this.driverName,
  required this.fare,
  required this.etaMinutes,
});

factory RideOffer.fromJson(Map<String, dynamic> json) {
  return RideOffer(
    vehicleType: json['vehicle_type'] as String,
    driverName: json['driver_name'] as String,
    fare: json['fare'] as int,
    etaMinutes: json['eta_minutes'] as int,
  );
}
}