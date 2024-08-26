import 'vehicle_class.dart';

class MotorCycle extends Vehicle {
  final int tyreNumber;
  final bool haveSideCar;

  MotorCycle({
    required super.cylinderCap,
    required super.maxSpeed,
    required super.engineType,
    required super.model,
    required super.manufacturer,
    required super.price,
    super.vehicleName,
    this.tyreNumber = 2,
    this.haveSideCar = false,
  });

  @override
  String details() {
    return "${super.details()}\n"
        "Tyre Number: $tyreNumber tyres\n"
        "${haveSideCar ? "Has" : "Doesn't have"} a side car";
  }
}
