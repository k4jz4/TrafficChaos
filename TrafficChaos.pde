
TrafficLight light1, light2;
Car car1, car2;

PImage greenMan;
PImage redMan;


void setup() {
  size(1600, 1200);

  Car car1;
  Car car2;

  light1 = new TrafficLight(50, 200);
  light2 = new TrafficLight(800, 300);
  
 //  car1 = new Car(new PVector(0, height/2), 3, 0.04);
 //  car2 = new Car(new PVector(0, height/2), 3, 0.1);
}

void draw() {
  background(180);

  light1.update();
  light2.update();
}
