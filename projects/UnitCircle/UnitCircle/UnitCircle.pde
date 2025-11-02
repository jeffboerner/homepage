float circleRadius = 150;

void setup() {
  size(500, 500);
}

void draw() {
  background(255, 255, 255);

  drawCircle();
  drawAxes();

  String string = "" + atan2(mouseY-250, mouseX-250);
  string = string + ".  " + cos(atan2(mouseY-250, mouseX-250));

  float angle = atan2(mouseY-250, mouseX-250);

  /* make angle obey mathematical convention */
  angle = -angle;
  if (angle < 0) angle += 2*PI;

  float cosVal = cos(angle);
  float sinVal = sin(angle);

  String angleStr = round(angle/PI*100.0)/100.0 + " π";
  String cosValStr = round(cosVal*100.0)/100.0 + "";
  String sinValStr = round(sinVal*100.0)/100.0 + "";

  float vecLength = sqrt(pow(mouseX-250, 2) + pow(mouseY-250, 2));
  float xCoord = 250 + circleRadius*(mouseX-250)/vecLength;
  float yCoord = 250 + circleRadius*(mouseY-250)/vecLength;

  float textXCoord = 250 + (40+circleRadius)*(mouseX-250)/vecLength;
  float textYCoord = 250 + (40+circleRadius)*(mouseY-250)/vecLength;

  line(250, 250, xCoord, yCoord);
  fill(0, 0, 0);
  ellipse(xCoord, yCoord, 10, 10);

  textAlign(CENTER);
  text("(" + cosValStr + "," + sinValStr + ")", textXCoord, textYCoord);




  /* fill in angle */

  stroke(0);
  fill(120, 0, 0, 40);
  beginShape();
  vertex(250, 250);

  for (int i = 0; i <= 100; i++) {
    vertex(250+circleRadius*cos(-i*angle/100.0)/2.0, 250+circleRadius*sin(-i*angle/100.0)/2.0);
  }

  endShape(CLOSE);
  
  fill(255, 255, 255);
  noStroke();
  rect(200, 225, 100, 50);
  fill(0);
  text(angleStr, 250, 242);
}

void drawCircle() {
  stroke(0);
  noFill();
  beginShape();
  for (int i=0; i < 100; i++) {
    vertex(250+circleRadius*cos(i*2*PI/100.0), 250+circleRadius*sin(i*2*PI/100.0));
  }
  endShape(CLOSE);
}


void drawAxes() {
  stroke(0);
  line(250, 250 + 1.5*circleRadius, 250, 250 - 1.5*circleRadius);
  line(250 + 1.5*circleRadius, 250, 250 - 1.5*circleRadius, 250);
}





























