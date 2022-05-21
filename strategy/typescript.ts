class Animal {
  public flyType!: Fly

  tryFly(){
    return this.flyType.fly()
  }

  setFlyType(type: Fly){
    this.flyType = type
  }
}

class Dog extends Animal {
  constructor(){
    super()
    this.setFlyType(new CanotFly())
  }
}

class Bird extends Animal {
  constructor() {
    super()
    this.setFlyType(new ItFly())
  }
}

interface Fly {
  fly(): string;
}

class ItFly implements Fly {
  fly(): string {
    return "Im flying"
  }
}

class CanotFly implements Fly {
  fly(): string {
    return "Im cant fly"
  }
}

console.log(new Dog().tryFly())
console.log(new Bird().tryFly())
