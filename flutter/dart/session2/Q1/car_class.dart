import 'vehicle_class.dart';

class Car extends Vehicle {
  final String transmissionType;
  final int passengersNumber;

  Car({
    required super.cylinderCap,
    required super.maxSpeed,
    required super.engineType,
    required super.model,
    required super.manufacturer,
    required super.price,
    super.vehicleName,
    required this.transmissionType,
    required this.passengersNumber,
  });

  @override
  String details() {
    return "${super.details()}\n"
        "Transmission Type: $transmissionType car\n"
        "Passengers Number: $passengersNumber passengers";
  }
}
