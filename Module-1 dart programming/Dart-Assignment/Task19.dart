// Task 19:
// Create a class hierarchy with a Vehicle superclass and Car and Bike subclasses. Implement
// methods in each subclass that print specific details, like the type of vehicle, fuel type, and
// max speed.


class Vehicle {
  late String type;
  late String fuelType;
  late int maxSpeed;

  Vehicle(this.type, this.fuelType, this.maxSpeed);


  void displayDetails() {
    print("Type: $type");
    print("Fuel Type: $fuelType");
    print("Max Speed: $maxSpeed km/h");
  }
}

class Car extends Vehicle {
  String brand;


  Car(this.brand, String fuelType, int maxSpeed)
      : super("Car", fuelType, maxSpeed);


  @override
  void displayDetails() {
    print("\n--- Car Details ---");
    print("Brand: $brand");
    super.displayDetails();
  }
}


class Bike extends Vehicle {
  bool hasGear;


  Bike(this.hasGear, String fuelType, int maxSpeed)
      : super("Bike", fuelType, maxSpeed);


  @override
  void displayDetails() {
    print("\n--- Bike Details ---");
    print("Has Gear: ${hasGear ? 'Yes' : 'No'}");
    super.displayDetails();
  }
}

void main() {

  Car car = Car("Toyota", "Petrol", 180);
  car.displayDetails();


  Bike bike = Bike(true, "Electric", 120);
  bike.displayDetails();
}
