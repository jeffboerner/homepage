import processing.opengl.*;

boolean xyPlane = true;
boolean yzPlane = true;
boolean zxPlane = true;

boolean axes = false;

StateChange[] changeArray;

float zoom = 1;

int time = 0;

Boolean grow = false;
int growDirection = 1;

Boolean planes = false;
Boolean colors = false;

int mesh = 10;

int side = 100;

float angle = 0.5;

void setup() {
  size(500, 500, OPENGL);
  changeArray = new StateChange[0];
  StateChange change = new StateChange();
  change.deltaRotX = -.4;
  change.deltaRotY = .5;
  changeArray = (StateChange[]) append(changeArray, change);
}

void draw() {
  background(255, 255, 255);

  /* Lighting */
  //lights();
  ambientLight(180, 180, 180);
  directionalLight(50, 50, 50, 1, 1, -1);
  directionalLight(20, 10, 10, -1, 1, -1);

  translate(250, 250, 0);
  scale(zoom);

  /* Set translation */
  for (int i = changeArray.length - 1; i >= 0; i--) {
    StateChange change = changeArray[i];
    translate(change.deltaX, change.deltaY, change.deltaZ);
  }
  /* Set rotation */
  for (int i = changeArray.length - 1; i >= 0; i--) {
    StateChange change = changeArray[i];
    rotateX(change.deltaRotX);
    rotateY(change.deltaRotY);
    rotateZ(change.deltaRotZ);
  }

  if (axes) drawAxes();

  drawCube(time);

  if (planes) drawPlanes();

  if (grow) {
    time += -growDirection;
    time = max(time, 0);
  }

  /* Coordinate axes
   stroke(0, 0, 0);
   line(-250, 0, 0, 250, 0, 0);
   stroke(255, 0, 0);
   line(0, -250, 0, 0, 250, 0);
   stroke(0, 255, 0);
   line(0, 0, -250, 0, 0, 250);
   */
}

void drawPlanes() {

  fill(200, 200, 200);

  //y=z plane
  if (yzPlane) {
    beginShape();
    vertex(side, -side, -side);
    vertex(side, side, side);
    vertex(-side, side, side);
    vertex(-side, -side, -side);
    endShape(CLOSE);
  }

  //x=z plane
  if (zxPlane) {
    beginShape();
    vertex(side, side, side);
    vertex(-side, side, -side);
    vertex(-side, -side, -side);
    vertex(side, -side, side);
    endShape(CLOSE);
  }

  //x=y plane
  if (xyPlane) {
    beginShape();
    vertex(side, side, side);
    vertex(-side, -side, side);
    vertex(-side, -side, -side);
    vertex(side, side, -side);
    endShape(CLOSE);
  }
}

void drawCube(int t) {

  if (t < 0) {
    return;
  }

  for (int i = -50; i <= 50; i+=mesh) {
    for (int j = -50; j <= 50; j+=mesh) {
      for (int k = -50; k <= 50; k+=mesh) {

        stroke(0, 0, 0);
        fill(0, 0, 0);

        //(1,1,1)_PERP spanned by
        Vector basis1 = new Vector(1, -1, 0);
        Vector basis2 = new Vector(-1, -1, 1);
        Vector offset = new Vector(0, 0, 0);

        float theta = .64*PI;

        if (i < j && j < k) {
          // RED
          stroke(255, 0, 0);
          fill(255, 0, 0);

          basis1 = basis1.scalarMultiple(cos(theta));
          basis2 = basis2.scalarMultiple(sin(theta));

          offset = offset.sum(basis1);
          offset = offset.sum(basis2);

          stroke(255, 0, 0);
        }

        theta += PI/3.0;

        if (i < k && k < j) {
          // GREEN
          stroke(0, 180, 0);
          fill(0, 180, 0);

          basis1 = basis1.scalarMultiple(cos(theta));
          basis2 = basis2.scalarMultiple(sin(theta));

          offset = offset.sum(basis1);
          offset = offset.sum(basis2);
        }

        theta += PI/3.0;

        if (k < i && i < j) {
          // Orange
          stroke(255, 165, 0);
          fill(255, 165, 0);

          basis1 = basis1.scalarMultiple(cos(theta));
          basis2 = basis2.scalarMultiple(sin(theta));

          offset = offset.sum(basis1);
          offset = offset.sum(basis2);
        }

        theta += PI/3.0;

        if (k < j && j < i) {
          // YELLOW
          stroke(255, 255, 0);
          fill(255, 255, 0);

          basis1 = basis1.scalarMultiple(cos(theta));
          basis2 = basis2.scalarMultiple(sin(theta));

          offset = offset.sum(basis1);
          offset = offset.sum(basis2);
        }

        theta += PI/3.0;

        if (j < k && k < i) {
          // PURPLE
          stroke(255, 0, 255);
          fill(255, 0, 255);

          basis1 = basis1.scalarMultiple(cos(theta));
          basis2 = basis2.scalarMultiple(sin(theta));

          offset = offset.sum(basis1);
          offset = offset.sum(basis2);
        }

        theta += PI/3.0;

        if (j < i && i < k) {
          // BLUE
          stroke(0, 0, 255);
          fill(0, 0, 255);

          basis1 = basis1.scalarMultiple(cos(theta));
          basis2 = basis2.scalarMultiple(sin(theta));

          offset = offset.sum(basis1);
          offset = offset.sum(basis2);
        }

        if (!colors) { 
          fill(255, 255, 255);
          noStroke();
        }

        if (i != j && i != k && j != k) {
          placeBox(i + t*offset.x, j + t*offset.y, k + t*offset.z, mesh);
        }
        else {
          if (t == 0 && !colors) {
            fill(255, 255, 255);
            noStroke();
            placeBox(i, j, k, mesh);
          }
        }
      }
    }
  }
}

void placeBox(float xCoord, float yCoord, float zCoord, int boxSize) {
  translate(xCoord, yCoord, zCoord);
  box(boxSize);
  translate(-xCoord, -yCoord, -zCoord);
}

