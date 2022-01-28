abstract class Vehicle {
  wheels: string = '' ;
  height: string = '';

  vehicleWheels(){
    console.log(`Vehicle has ${this.wheels} wheels`);
  }

  vehicleHeight(){
    console.log(`Vehicle is ${this.height}`);
  }
}

class Car extends Vehicle {
  constructor(){
    super();
    this.wheels = "4";
    this.height = "1500";
  }
}

class Truck extends Vehicle {
  constructor(){
    super();
    this.wheels = "8";
    this.height = "2500";
  }
}

class Factory{
  build(type: string): Vehicle{
    switch(type){
      case 'car':
        return new Car();
      case 'truck':
        return new Truck();
      default:
        throw new Error(`Vehicle type ${type} not supported`);
    }
  }
}
