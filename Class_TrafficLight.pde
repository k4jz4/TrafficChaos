class TrafficLight {

  String state; 
  int stateTimer;
  float xpos, ypos;

  TrafficLight(float _xpos, float _ypos) {
    xpos = _xpos;
    ypos = _ypos;
    state = "RED";
    stateTimer = millis();
  }

  void render(boolean lightsR, boolean lightsY, boolean lightsG, boolean walkOn) {
    renderTrafficLight(lightsR, lightsY, lightsG);
    // renderWalkSignal(walkOn);
    // renderButton(true);
  }

  void update() {

    switch(state) {

    case "RED":
      render(true, false, false, true);
      if (millis() - stateTimer > 2000) {
        state = "RED_YELLOW";
        stateTimer = millis();
      }
      break;

    case "RED_YELLOW":
      render(true, true, false, false);
      if (millis() - stateTimer > 2000) {
        state = "GREEN";
        stateTimer = millis();
      }
      break;

    case "GREEN":
      render(false, false, true, false);
      if (millis() - stateTimer > 2000) {
        state = "YELLOW";
        stateTimer = millis();
      }
      break;

    case "YELLOW":
      render(false, true, false, false);
      if (millis() - stateTimer > 2000) {
        state = "RED";
        stateTimer = millis();
      }
      break;
    }

    if (buttonPressed()) {
      state = "RED";
    }
  }


  void renderTrafficLight(boolean redOn, boolean yellowOn, boolean greenOn) {
    color black = color(0);
    color redLight = color(255, 0, 0);
    color yellowLight = color(255, 255, 0);
    color greenLight = color(0, 255, 0);
    color offLight = color(200);


    fill(black);
    rect(100, 100, 100, 300);

    if (redOn) {
      fill(redLight);
    } else {
      fill (offLight);
    }

    ellipse(150, 150, 75, 75);

    if (yellowOn) {
      fill(yellowLight);
    } else {
      fill (offLight);
    }
    ellipse(150, 250, 75, 75);

    if (greenOn) {
      fill(greenLight);
    } else {
      fill (offLight);
    }
    ellipse(150, 350, 75, 75);
  }

  boolean buttonPressed() {
    // Returns true if the button is pressed, false otherwise
    if (mousePressed && sqrt(sq(mouseX-450)+sq(mouseY-550)) < 18) {
      return true;
    } else {
      return false;
    }
  }
}
