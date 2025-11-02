float[] sinX = new float[0];
float[] sinY = new float[0];

float[] cosX = new float[0];
float[] cosY = new float[0];

float[] tanX = new float[0];
float[] tanY = new float[0];

float squinX;
float squinY;

float[] squinXG = new float[0];
float[] squinYG = new float[0];

int circleX = 250;
int circleY = 120;

float autoAngle = 0;

int tailLength = 400;
float angleStep = .01;

Boolean cosOn = false;
Boolean sinOn = false;
Boolean squinOn = true;
Boolean auto = true;

void setup() {
  size(500, 500);
  frameRate(200);
}


void draw() {
  background(255, 255, 255);

  fill(0, 0, 0);
  stroke(0, 0, 0);
  ellipse(circleX, circleY, 10, 10);

  noFill();
  if (sinOn || cosOn) ellipse(circleX, circleY, 200, 200);
  if (squinOn) {
    line(circleX+100, circleY+100, circleX+100, circleY-100);
    line(circleX-100, circleY+100, circleX-100, circleY-100);
    line(circleX+100, circleY+100, circleX-100, circleY+100);
    line(circleX+100, circleY-100, circleX-100, circleY-100);
  }

  float length = sqrt((mouseX-circleX)*(mouseX-circleX) + (mouseY-circleY)*(mouseY-circleY));

  float angle = -atan2(mouseY-circleY, mouseX-circleX);
  if (angle < 0) angle += 2*PI;

  autoAngle += angleStep;
  if (autoAngle >= 2*PI) autoAngle = 0;

  fill(0, 0, 0);
  //ellipse( circleX+100*(mouseX-circleX)/length, circleY+100*(mouseY-circleY)/length, 8, 8);

  if (auto) angle = autoAngle;

  if (sinOn || cosOn) {
    line(circleX, circleY, circleX+100*cos(angle), circleY-100*sin(angle));
    // ellipse on circle
    ellipse(circleX+100*cos(angle), circleY-100*sin(angle), 8, 8);
  }

  if (angle <= PI/4.0 || angle > 7*PI/4.0) {
    //ellipse( circleX+100, circleY+100*(mouseY-circleY)/(mouseX-circleX), 8, 8);
    squinX = 100;
    squinY = -100*tan(angle);//(mouseY-circleY)/(mouseX-circleX);
  }
  if (angle > PI/4.0 && angle <= 3*PI/4.0) {
    //ellipse( circleX-100*(mouseX-circleX)/(mouseY-circleY), circleY-100, 8, 8);
    squinX = 100*1/tan(angle);
    squinY = -100;
  }
  if (angle > 3*PI/4.0 && angle <= 5*PI/4.0) {
    //ellipse( circleX-100, circleY-100*(mouseY-circleY)/(mouseX-circleX), 8, 8);
    squinX = -100;
    squinY = 100*tan(angle);//(mouseY-circleY)/(mouseX-circleX);
  }
  if (angle > 5*PI/4.0 && angle <= 7*PI/4.0) {
    //ellipse( circleX+100*(mouseX-circleX)/(mouseY-circleY), circleY+100, 8, 8);
    squinX = -100*1/tan(angle);
    squinY = +100;
  }

  if(squinOn){
  ellipse(circleX+squinX, circleY+squinY, 8, 8);
  line(circleX, circleY, circleX+squinX, circleY+squinY);}

  drawFunction();
}

void drawFunction() {
  float angle = -atan2(mouseY-circleY, mouseX-circleX);

  if (auto) angle = autoAngle;

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
  if (sinOn) ellipse(10 + xStretch*angle, (500-yOffset) - yStretch*sin(angle), 5, 5);

  sinX = append(sinX, 10 + xStretch*angle);
  sinY = append(sinY, (500-yOffset) - yStretch*sin(angle));

  sinY = trimToLength(sinY);
  sinX = trimToLength(sinX);

  /* cos */
  fill(0, 0, 120);
  if (cosOn) ellipse(10 + xStretch*angle, (500-yOffset) - yStretch*cos(angle), 5, 5);

  cosX = append(cosX, 10 + xStretch*angle);
  cosY = append(cosY, (500-yOffset) - yStretch*cos(angle));

  cosY = trimToLength(cosY);
  cosX = trimToLength(cosX);

  /* squin */
  fill(120, 0, 0);
  if (squinOn) ellipse(10 + xStretch*angle, (500-yOffset) + squinY, 5, 5);

  squinXG = append(squinXG, 10 + xStretch*angle);
  squinYG = append(squinYG, (500-yOffset) + squinY);

  squinXG = trimToLength(squinXG);
  squinYG = trimToLength(squinYG);

  /* sec */
  //  fill(120, 0, 0);
  //  ellipse(10 + xStretch*angle, -((500-yOffset) + yStretch*1/cos(angle)), 5, 5);
  //
  //  tanX = append(tanX, 10 + xStretch*angle);
  //  tanY = append(tanY, (500-yOffset) + yStretch*1/cos(angle));


  // Graph last 50 points
  int lookbackLength = tailLength;

  for (int i = max(sinX.length-lookbackLength,0); i < sinX.length-1; i++) {
    stroke(0, 0, 0, 255*(lookbackLength-sinX.length+i)/lookbackLength);

    int fadeAmount = 255*(lookbackLength-sinX.length+i)/lookbackLength;

    stroke(0, 120, 0, fadeAmount);
    if (sqrt(pow(sinX[i]-sinX[i+1], 2)+pow(sinY[i]-sinY[i+1], 2)) < 200 && sinOn) line(sinX[i], sinY[i], sinX[i+1], sinY[i+1]); 

    stroke(0, 0, 120, fadeAmount);
    if (sqrt(pow(cosX[i]-cosX[i+1], 2)+pow(cosY[i]-cosY[i+1], 2)) < 200 && cosOn)line(cosX[i], cosY[i], cosX[i+1], cosY[i+1]);
    //if(sqrt(pow(tanX[i]-tanX[i+1],2)+pow(tanY[i]-tanY[i+1],2)) < 200)line(tanX[i], tanY[i], tanX[i+1], tanY[i+1]);

    stroke(120, 0, 0, fadeAmount);
    if (sqrt(pow(squinXG[i]-squinXG[i+1], 2)+pow(squinYG[i]-squinYG[i+1], 2)) < 200 && squinOn)line(squinXG[i], squinYG[i], squinXG[i+1], squinYG[i+1]);
  }
}





void keyPressed() {

  if (key == 's') sinOn = !sinOn;
  if (key == 'c') cosOn = !cosOn;
  if (key == 'q') squinOn = !squinOn;
  if (key == 'a') auto = !auto;
}


float[] trimToLength(float[] arr) {
  arr = subset(arr, max(arr.length-tailLength, 0));
  return arr;
}

