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
    
    pushMatrix();
    translate(xpos, ypos);
    renderTrafficLight(lightsR, lightsY, lightsG);
    renderWalkSignal(walkOn);
    renderButton(true);
    popMatrix();
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

void renderWalkSignal(boolean walk) {

  color black = color(0);
  color offLight = color(75);

  fill(black);
  rect(300, 0, 100, 200);

  fill (offLight);
  ellipse(350, 50, 75, 75);
  ellipse(350, 150, 75, 75);

  if (walk) {
    greenMan = loadImage("GreenMan.png");
    image(greenMan, 305, 0, 100, 100);
  } else {
    redMan = loadImage ("RedMan.png");
    image(redMan, 275, 55, 300, 300);
  }
}

void renderButton(boolean buttonOn) {
  color black = color(0);
  color buttonOffColor = color(54, 74, 183);
  color buttonOnColor = color(182, 179, 203);

  fill(black);
  rect(300, 400, 100, 100);

  if (buttonOn) {
    fill(buttonOnColor);
  } else {
    fill(buttonOffColor);
  }
  ellipse(350, 450, 36, 36);
}

  boolean buttonPressed() {
    if (mousePressed && sqrt(sq(mouseX-(xpos+350))+sq(mouseY-(ypos+450))) < 18) {
      return true;
    } else {
      return false;
    }
  }
}
