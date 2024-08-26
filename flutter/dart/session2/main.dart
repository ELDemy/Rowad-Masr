import 'Q1/car_class.dart';
import 'Q1/motor_cycle_class.dart';
import 'Q1/truck_class.dart';
import 'Q1/vehicle_class.dart';
import 'map_constants.dart';

void main() {
  Vehicle car1 = Car(
    vehicleName: "Car 1",
    cylinderCap: 1600,
    maxSpeed: 215,
    engineType: "Gasoline",
    model: 2023,
    manufacturer: "Peugeot",
    price: 1250000,
    transmissionType: "Automatic",
    passengersNumber: 5,
  );

  Car car2 = Car(
    vehicleName: "Car 2",
    cylinderCap: 1800,
    maxSpeed: 244,
    engineType: "Hybrid",
    model: 2022,
    manufacturer: "BMW",
    price: 2350000,
    transmissionType: "Automatic",
    passengersNumber: 5,
  );

  Vehicle truck1 = Truck(
      vehicleName: "Truck 1",
      cylinderCap: 2000,
      maxSpeed: 170,
      engineType: "Diesel",
      model: 2015,
      manufacturer: "Chevrolet",
      price: 1215000,
      loadCapacity: 2000);

  Truck truck2 = Truck(
      vehicleName: "Truck 2",
      cylinderCap: 1800,
      maxSpeed: 150,
      engineType: "Diesel",
      model: 2024,
      manufacturer: "Daihatsu",
      price: 1720000,
      loadCapacity: 1250);

  Vehicle motor1 = MotorCycle(
    // vehicleName: "Motor Cycle 1",
    cylinderCap: 750,
    maxSpeed: 110,
    engineType: "Electric",
    model: 2011,
    manufacturer: "Suzuki",
    price: 116000,
    tyreNumber: 3,
    haveSideCar: true,
  );

  MotorCycle motor2 = MotorCycle(
    vehicleName: "Motor Cycle 2",
    cylinderCap: 1400,
    maxSpeed: 200,
    engineType: "Gasoline",
    model: 2021,
    manufacturer: "Honda",
    price: 1040500,
  );

  Map<String, dynamic> vehicleMap =
      Vehicle.compareAll([car1, car2, motor1, motor2]);

  Vehicle fastestVehicle = vehicleMap[kFastest];
  Truck? heaviestTruck = vehicleMap[kHeaviest];
  Vehicle cheapestVehicle = vehicleMap[kCheapest];
  print(
    "The Fastest Vehicle is ${fastestVehicle.vehicleName}:\n${fastestVehicle.details()}\n\n",
  );

  print(
    "${heaviestTruck == null ? "There is no trucks in the list" : "The Heaviest Truck is ${heaviestTruck.vehicleName}:\n${heaviestTruck.details()}"}\n\n",
  );

  print(
    "The Cheapest Vehicle is ${cheapestVehicle.vehicleName}:\n${cheapestVehicle.details()}\n\n",
  );
}
