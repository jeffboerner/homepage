float[] sinX = new float[0];
float[] sinY = new float[0];

float[] cosX = new float[0];
float[] cosY = new float[0];

float[] tanX = new float[0];
float[] tanY = new float[0];

int circleX = 250;
int circleY = 120;

boolean showSin = true;
boolean showCos = false;
boolean showTan = false;

boolean auto = false;
float autoCt = 0;
float speed = .02;

int tailLength = 80;

void setup() {
  size(500, 500);
  frameRate(300);
}


void draw() {
  background(255, 255, 255);
  
  scale(1);

  fill(0, 0, 0);
  stroke(0, 0, 0);
  ellipse(circleX, circleY, 10, 10);

  noFill();
  ellipse(circleX, circleY, 200, 200);

  float length = sqrt((mouseX-circleX)*(mouseX-circleX) + (mouseY-circleY)*(mouseY-circleY));

  if (!auto) {

    line(circleX, circleY, circleX+100*(mouseX-circleX)/length, circleY+100*(mouseY-circleY)/length);
    fill(0, 0, 0);
    ellipse( circleX+100*(mouseX-circleX)/length, circleY+100*(mouseY-circleY)/length, 8, 8);
  }
  else {
    line(circleX, circleY, circleX+100.0*(cos(-autoCt)), circleY+100.0*(sin(-autoCt)));
    fill(0, 0, 0);
    ellipse( circleX+100*cos(-autoCt), circleY+100*sin(-autoCt), 8, 8);
  }

  drawFunction();

  if(auto) autoCt += speed;

  if (autoCt >= 2*PI) autoCt = 0;
}

void drawFunction() {
  float angle = -atan2(mouseY-circleY, mouseX-circleX);

  if (auto) angle = autoCt;

  int xOffset = 10;
  int yOffset = 150;

  float yStretch = 100;
  float xStretch = (500-2*xOffset)/(2*PI);

  if (angle < 0) angle += 2*PI;

  stroke(0, 0, 0, 100);
  line(xOffset, (500-yOffset), 500-xOffset, (500-yOffset));
  stroke(0, 0, 0, 50);
  line(xOffset, (500-yOffset)+yStretch, 500-xOffset, (500-yOffset)+yStretch);
  stroke(0, 0, 0, 50);
  line(xOffset, (500-yOffset)-yStretch, 500-xOffset, (500-yOffset)-yStretch);

  line(xOffset, (500-yOffset)+10, xOffset, (500-yOffset)-10);
  line(xOffset + xStretch*PI/2.0, (500-yOffset)+10, xOffset + xStretch*PI/2.0, (500-yOffset)-10);
  line(xOffset + xStretch*2*PI/2.0, (500-yOffset)+10, xOffset + xStretch*2*PI/2.0, (500-yOffset)-10);
  line(xOffset + xStretch*3*PI/2.0, (500-yOffset)+10, xOffset + xStretch*3*PI/2.0, (500-yOffset)-10);
  line(xOffset + xStretch*4*PI/2.0, (500-yOffset)+10, xOffset + xStretch*4*PI/2.0, (500-yOffset)-10);

  /* sin */
  fill(0, 120, 0);
  if (showSin) ellipse(10 + xStretch*angle, (500-yOffset) - yStretch*sin(angle), 5, 5);

  sinX = append(sinX, 10 + xStretch*angle);
  sinY = append(sinY, (500-yOffset) - yStretch*sin(angle));

  /* cos */
  fill(120, 0, 0);
  if (showCos) ellipse(10 + xStretch*angle, (500-yOffset) - yStretch*cos(angle), 5, 5);

  cosX = append(cosX, 10 + xStretch*angle);
  cosY = append(cosY, (500-yOffset) - yStretch*cos(angle));

  /* tan */
  fill(0, 0, 120);
  if (showTan) ellipse(10 + xStretch*angle, (500-yOffset) - yStretch*tan(angle), 5, 5);

  tanX = append(tanX, 10 + xStretch*angle);
  tanY = append(tanY, (500-yOffset) + -yStretch*tan(angle));


  // Graph last tailLength points
  for (int i = max(sinX.length-tailLength,0); i < sinX.length-1; i++) {
    stroke(0, 120, 0, 255*(tailLength-sinX.length+i)/tailLength);
    if (sqrt(pow(sinX[i]-sinX[i+1], 2)+pow(sinY[i]-sinY[i+1], 2)) < 200 && showSin) line(sinX[i], sinY[i], sinX[i+1], sinY[i+1]); 

    stroke(120, 0, 0, 255*(tailLength-sinX.length+i)/tailLength);
    if (sqrt(pow(cosX[i]-cosX[i+1], 2)+pow(cosY[i]-cosY[i+1], 2)) < 200 && showCos)line(cosX[i], cosY[i], cosX[i+1], cosY[i+1]);

    stroke(0, 0, 120, 255*(tailLength-sinX.length+i)/tailLength);
    if (sqrt(pow(tanX[i]-tanX[i+1], 2)+pow(tanY[i]-tanY[i+1], 2)) < 200 && showTan)line(tanX[i], tanY[i], tanX[i+1], tanY[i+1]);
  }
  
  // trim arrays
  if(sinX.length >= tailLength) sinX = reverse(shorten(reverse(sinX)));
  if(sinY.length >= tailLength) sinY = reverse(shorten(reverse(sinY)));
  
  if(cosX.length >= tailLength) cosX = reverse(shorten(reverse(cosX)));
  if(cosY.length >= tailLength) cosY = reverse(shorten(reverse(cosY)));
  
  if(tanX.length >= tailLength) tanX = reverse(shorten(reverse(tanX)));
  if(tanY.length >= tailLength) tanY = reverse(shorten(reverse(tanY)));
}

void keyPressed() {
  if (key == 'c') showCos = !showCos;
  if (key == 's') showSin = !showSin;
  if (key == 't') showTan = !showTan;

  if (key == 'a') auto = !auto;

  if (keyCode == UP) speed+=.005;
  if (keyCode == DOWN) speed-=.005;

  speed = max(.001, speed);

  if (keyCode == RIGHT) tailLength-=10;
  if (keyCode == LEFT) tailLength+=10;
}

