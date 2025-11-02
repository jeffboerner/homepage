import processing.opengl.*;

float theta_0 = 0;
float theta_1 = 0;

boolean theta_0Active = false;

StateChange[] changeArray = new StateChange[0];

void setup() {
  size(600, 600, OPENGL);
}

void drawSheet() {
  fill(255, 255, 240);
  noStroke();

  beginShape();
  vertex(-150*cos(theta_0*PI), -150*cos(theta_1*PI), 150*sin(theta_0*PI) + 150*sin(theta_1*PI));
  vertex(-150*cos(theta_0*PI), 0, 150*sin(theta_0*PI));
  vertex(0, 0, 0);
  vertex(0, -150*cos(theta_1*PI), 150*sin(theta_1*PI));
  endShape(CLOSE);

  beginShape();
  vertex(-150*cos(theta_0*PI), 150, 150*sin(theta_0*PI));
  vertex(-150*cos(theta_0*PI), 0, 150*sin(theta_0*PI));
  vertex(0, 0, 0);
  vertex(0, 150, 0);
  endShape(CLOSE);

  beginShape();
  vertex(150, 150, 0);
  vertex(150, 0, 0);
  vertex(0, 0, 0);
  vertex(0, 150, 0);
  endShape(CLOSE);



  beginShape();
  vertex(150, -150*cos(theta_1*PI), 150*sin(theta_1*PI));
  vertex(150, 0, 0);
  vertex(0, 0, 0);
  vertex(0, -150*cos(theta_1*PI), 150*sin(theta_1*PI));
  endShape(CLOSE);
}

void drawConfigSpace() {
  int xOffset = 225;
  int yOffset = -225;
  stroke(255, 255, 255);
  fill(255,255,255);
  strokeWeight(3);

  /*
  line(-48+xOffset, -50+yOffset,0, 48+xOffset, -50+yOffset,0);  
  line(50+xOffset, 48+yOffset, 50+xOffset, -48+yOffset);
  line(48+xOffset, 50+yOffset, -48+xOffset, 50+yOffset);
  line(-50+xOffset, -48+yOffset, -50+xOffset, 48+yOffset);

  line(xOffset, 50+yOffset, xOffset, -50+yOffset);
  line(-50+xOffset, yOffset, 50+xOffset, yOffset);
  */

/* 3DLine needed for Processing.js */
  draw3DLine(-48+xOffset, -50+yOffset, 48+xOffset, -50+yOffset);
  draw3DLine(50+xOffset, 48+yOffset, 50+xOffset, -48+yOffset);
  draw3DLine(48+xOffset, 50+yOffset, -48+xOffset, 50+yOffset);
  draw3DLine(-50+xOffset, -48+yOffset, -50+xOffset, 48+yOffset);
  
  draw3DLine(xOffset, 50+yOffset, xOffset, -50+yOffset);
  draw3DLine(-50+xOffset, yOffset, 50+xOffset, yOffset);

  fill(255, 0, 0);
  strokeWeight(1);
  ellipse(50*theta_0+xOffset, 50*theta_1+yOffset, 10, 10);
}

void draw() {
  background(0, 0, 0);
  translate(300, 300, 0);
  drawConfigSpace();

  directionalLight(120, 100, 100, 0, 0, -1);
  directionalLight(120, 100, 100, 0, 0, 1);
  ambientLight(75, 75, 75);

  /* Set rotation */
  for (int i = changeArray.length - 1; i >= 0; i--) {
    StateChange change = changeArray[i];
    rotateX(change.deltaRotX);
    rotateY(change.deltaRotY);
    rotateZ(change.deltaRotZ);
  }

  drawSheet();
}

void draw3DLine(int x0, int y0, int x1, int y1){
  stroke(255, 255, 255);
  fill(255,255,255);
  strokeWeight(3);
  
  beginShape();
  vertex(x0-1, y0-1,-1);
  vertex(x1-1, y1-1,-1);
  vertex(x1+1, y1+1,-1);
  vertex(x0+1, y0+1,-1);
  endShape(CLOSE);
}
