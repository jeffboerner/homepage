void keyPressed() {

  //Rotation, Zooming
  if (keyCode == UP) {
    StateChange change = new StateChange();
    change.deltaY = -5;
    changeArray = (StateChange[]) append(changeArray, change);
  }
  if (keyCode == DOWN) {
    StateChange change = new StateChange();
    change.deltaY = 5;
    changeArray = (StateChange[]) append(changeArray, change);
  }
  if (keyCode == RIGHT) {
    StateChange change = new StateChange();
    change.deltaX = 5;
    changeArray = (StateChange[]) append(changeArray, change);
  }
  if (keyCode == LEFT) {
    StateChange change = new StateChange();
    change.deltaX = -5;
    changeArray = (StateChange[]) append(changeArray, change);
  }

  if(key == ','){
    StateChange change = new StateChange();
    change.deltaRotZ = -.09;
    changeArray = (StateChange[]) append(changeArray, change);
  }
  if(key == '.'){
    StateChange change = new StateChange();
    change.deltaRotZ = .09;
    changeArray = (StateChange[]) append(changeArray, change);
  }

/*
  if (key == 'z') {
    zoom *= .5;
  }
  if (key == 'x') {
    zoom *= 2;
  }
  */

  // Setting flags
  if (key == 'g') {
    grow = !grow;
    if (grow) { 
      growDirection = -growDirection;
    }
  }

  if (key == 'p') {
    planes = !planes;
  }
  if (key == 'c') {
    colors = !colors;
  }
  if (key == 'x'){
    xyPlane = !xyPlane;
  }
  if (key == 'y'){
    yzPlane = !yzPlane;
  }
  if (key == 'z'){
    zxPlane = !zxPlane;
  }
  if (key == 'a'){
    axes = !axes;
  }
}

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

