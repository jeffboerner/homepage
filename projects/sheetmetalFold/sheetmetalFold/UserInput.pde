int prevX;
int prevY;

void mousePressed() {
  prevX = mouseX;
  prevY = mouseY;
}

void mouseDragged() {

  StateChange change = new StateChange();

  change.deltaRotY += 0.05*(mouseX - prevX);
  change.deltaRotX -= 0.05*(mouseY - prevY);

  prevX = mouseX;
  prevY = mouseY;

  changeArray = (StateChange[]) append(changeArray, change);
}

void keyPressed() {
  if (keyCode == RIGHT) {
    // check if other angle allows movement
    if (theta_1 != 1 && theta_1 != 0 && theta_1 != -1) return;
    // check if can move, or is in quarter-size state
    if (theta_0 != 0 && theta_1 !=0 && !theta_0Active) return;
    theta_0 += .05;
    theta_0Active = true;
  }
  if (keyCode == LEFT) {
    if (theta_1 != 1 && theta_1 != 0 && theta_1 != -1) return;
    if (theta_0 != 0 && theta_1 !=0 && !theta_0Active) return;
    theta_0 -= .05;
    theta_0Active = true;
  }

  if (keyCode == DOWN) {
    if (theta_0 != 1 && theta_0 != 0 && theta_0 != -1) return;
    if (theta_0 != 0 && theta_1 !=0 && theta_0Active) return;
    theta_1 += .05;
    theta_0Active = false;
  }
  if (keyCode == UP) {
    if (theta_0 != 1 && theta_0 != 0 && theta_0 != -1) return;
    if (theta_0 != 0 && theta_1 !=0 && theta_0Active) return;
    theta_1 -= .05;
    theta_0Active = false;
  }
  
 //println("1. theta_0 = " + theta_0 + "; theta_1 = " + theta_1);
  
  theta_1 = min(1.0, theta_1);
  theta_0 = min(1.0, theta_0);

  theta_1 = max(-1.0, theta_1);
  theta_0 = max(-1.0, theta_0);
  
  // Processing.js couldn't handle how the rounding was occuring.
  
  if(abs(theta_1) < .05){
    theta_1 = 0;
  }
  if(abs(theta_0) < .05){
    theta_0 = 0;
  }

//println("2. theta_0 = " + theta_0 + "; theta_1 = " + theta_1);

  //theta_0 = (float)round(theta_0*100.0)/100.0;
  //theta_1 = (float)round(theta_1*100.0)/100.0;

  //println("3. theta_0 = " + theta_0 + "; theta_1 = " + theta_1);

  if (key == 'r') {
    theta_1 = 0.0;
    theta_0 = 0.0;
    changeArray = new StateChange[0];
  }
}

