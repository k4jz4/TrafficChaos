
TrafficLight light1, light2;

PImage greenMan;
PImage redMan;

void setup() {
  size(1600, 1200);

  light1 = new TrafficLight(50, 200);
  light2 = new TrafficLight(800, 300);
}

void draw() {
  background(180);

  light1.update();
  light2.update();
}
