import '../map_constants.dart';
import 'truck_class.dart';

abstract class Vehicle {
  final int cylinderCap;
  final int maxSpeed;
  final String engineType;
  final int model;
  final String manufacturer;
  final int price;
  final String vehicleName;

  Vehicle({
    required this.cylinderCap,
    required this.maxSpeed,
    required this.engineType,
    required this.model,
    required this.manufacturer,
    required this.price,
    this.vehicleName = "NoName",
  });

  String details() {
    return "Cylinder Capacity: $cylinderCap cc\n"
        "Max Speed: $maxSpeed Km/hr\n"
        "Engine Type: $engineType engine\n"
        "Model: $model\n"
        "Manufacturer: $manufacturer\n"
        "Price: $price\$";
  }

  static Vehicle getFastest(List<Vehicle> vehiclesList) {
    Vehicle fastest = vehiclesList[0];
    for (Vehicle vehicle in vehiclesList) {
      if (vehicle.maxSpeed > fastest.maxSpeed) fastest = vehicle;
    }
    return fastest;
  }

  static Vehicle getCheapest(List<Vehicle> vehiclesList) {
    Vehicle cheapest = vehiclesList[0];
    for (Vehicle vehicle in vehiclesList) {
      if (vehicle.price < cheapest.price) cheapest = vehicle;
    }
    return cheapest;
  }

  static Truck? getHeaviest(List<Vehicle> vehicleList) {
    Truck? heaviest;

    for (Vehicle truck in vehicleList) {
      if (truck is Truck) {
        heaviest ??= truck;
        if (truck.loadCapacity > heaviest.loadCapacity) heaviest = truck;
      }
    }
    return heaviest;
  }

  static Map<String, dynamic> compareAll(List<Vehicle> vehiclesList) {
    return {
      kFastest: getFastest(vehiclesList),
      kCheapest: getCheapest(vehiclesList),
      kHeaviest: getHeaviest(vehiclesList),
    };
  }
}
