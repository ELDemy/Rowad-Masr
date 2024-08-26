import 'vehicle_class.dart';

class Truck extends Vehicle {
  final int loadCapacity;

  Truck({
    required super.cylinderCap,
    required super.maxSpeed,
    required super.engineType,
    required super.model,
    required super.manufacturer,
    required super.price,
    super.vehicleName,
    required this.loadCapacity,
  });

  @override
  String details() {
    return "${super.details()}\n"
        "Load Capacity: $loadCapacity Kg";
  }

  static Truck getHeaviest(List<Truck> trucksList) {
    Truck heaviest = trucksList[0];
    for (Truck truck in trucksList) {
      if (truck.loadCapacity > heaviest.loadCapacity) heaviest = truck;
    }
    return heaviest;
  }
}
