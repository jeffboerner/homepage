float[] sinX = new float[0];
float[] sinY = new float[0];

float[] cosX = new float[0];
float[] cosY = new float[0];

float[] tanX = new float[0];
float[] tanY = new float[0];

float[] squineX = new float[0];
float[] squineY = new float[0];

float[] cosquineX = new float[0];
float[] cosquineY = new float[0];

float squinX;
float squinY;

float[] squinXG = new float[0];
float[] squinYG = new float[0];

int circleX = 250;
int circleY = 120;

float autoAngle = 0;

int tailLength = 100;
float angleStep = .01;

Boolean cosOn = false;
Boolean sinOn = false;
Boolean squineOn = true;
Boolean cosquineOn = false;
Boolean auto = true;

float n = 3;
float xInt;
float yInt;

float currentAngle = 0;

void setup() {
  size(500, 500);
  frameRate(200);
}


void draw() {
  background(255, 255, 255);

  fill(0, 0, 0);
  stroke(0, 0, 0);
  ellipse(circleX, circleY, 10, 10);

  /* draw n-gon */

  float angle = 2.0*PI/n;

  for (int i = 0; i < n; i++) {
    line(100*cos(i*angle + angle/2.0 +PI/2.0) + circleX, 100*sin(i*angle + angle/2.0 +PI/2.0) + circleY, 100*cos(i*angle - angle/2.0 +PI/2.0) + circleX, 100*sin(i*angle - angle/2.0 +PI/2.0) + circleY);
  }

  currentAngle -= angleStep;
  while (currentAngle < 0) currentAngle += 2*PI;

  /* calculate point on n-gon */
  /* solve for i in above for loop */
  int i =  (int) ceil((currentAngle - PI/2.0 - angle/2.0)/angle);

  if (i < 0) i+=n;

  float x_0 = 100*cos(i*angle + angle/2.0 +PI/2.0);
  float y_0 = 100*sin(i*angle + angle/2.0 +PI/2.0);
  float x_1 = 100*cos(i*angle - angle/2.0 +PI/2.0);
  float y_1 = 100*sin(i*angle - angle/2.0 +PI/2.0);

  float m_1 = (y_1-y_0)/(x_1-x_0);

  float m_2 = sin(currentAngle)/cos(currentAngle);

  xInt = (-m_1*x_0 + y_0)/(m_2-m_1);

  if (x_1 == x_0) {
    // slope undefined
    xInt = x_0;
    }

    yInt = xInt*m_2;

    //println(xInt + ":" + yInt);




  /*n-gon*/
  ellipse(xInt+circleX, yInt+circleY, 8, 8);
  stroke(0, 0, 0);
  line(circleX, circleY, xInt + circleX, yInt+circleY);

  /*circle*/
  if (sinOn || cosOn) ellipse(circleX + 100*cos(currentAngle), circleY + 100*sin(currentAngle), 8, 8);
  if (sinOn || cosOn) line(circleX, circleY, circleX + 100*cos(currentAngle), circleY + 100*sin(currentAngle));
  noFill();
  ellipse(circleX, circleY, 200, 200);

  drawFunction();
}

void drawFunction() {

  int xOffset = 10;
  int yOffset = 150;

  float yStretch = 100;
  float xStretch = (500-2*xOffset)/(2*PI);

  /* Lines */
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

  float angle = currentAngle;

  /* squine */
  fill(0, 120, 0);
  if (squineOn) ellipse(10 + (500-2*xOffset) - xStretch*angle, (500-yOffset) + yInt, 5, 5);
  squineX = append(squineX, 10 + (500-2*xOffset) - xStretch*angle);
  squineY = append(squineY, (500-yOffset) + yInt);

  /* cosquine */
  fill(0, 0, 120);
  if (cosquineOn) ellipse(10 + (500-2*xOffset) - xStretch*angle, (500-yOffset) + xInt, 5, 5);
  cosquineX = append(cosquineX, 10 + (500-2*xOffset) - xStretch*angle);
  cosquineY = append(cosquineY, (500-yOffset) + xInt);


  /* sin */
  fill(0, 120, 0);
  if (sinOn) ellipse(10 + (500-2*xOffset) - xStretch*angle, (500-yOffset) + yStretch*sin(angle), 5, 5);
  sinX = append(sinX, 10 + (500-2*xOffset) - xStretch*angle);
  sinY = append(sinY, (500-yOffset) - yStretch*sin(-angle));

  /* cos */
  fill(0, 0, 120);
  if (cosOn) ellipse(10 + (500-2*xOffset) - xStretch*angle, (500-yOffset) + yStretch*cos(angle), 5, 5);
  cosX = append(cosX, 10 + (500-2*xOffset) - xStretch*angle);
  cosY = append(cosY, (500-yOffset) + yStretch*cos(-angle));





  // Graph last 50 points
  int lookbackLength = tailLength;

  for (int i = max(sinX.length-lookbackLength,0); i < sinX.length-1; i++) {
    int fadeAmount = 255*(lookbackLength-sinX.length+i)/lookbackLength;

    /* graph squine */
    stroke(0, 120, 0, fadeAmount);
    if (sqrt(pow(squineX[i]-squineX[i+1], 2)+pow(squineY[i]-squineY[i+1], 2)) < 200 && squineOn) line(squineX[i], squineY[i], squineX[i+1], squineY[i+1]); 

    /* graph cosquine */
    stroke(0, 0, 120, fadeAmount);
    if (sqrt(pow(cosquineX[i]-cosquineX[i+1], 2)+pow(cosquineY[i]-cosquineY[i+1], 2)) < 200 && cosquineOn) line(cosquineX[i], cosquineY[i], cosquineX[i+1], cosquineY[i+1]); 

    /* graph sin */
    stroke(0, 120, 0, fadeAmount);
    if (sqrt(pow(sinX[i]-sinX[i+1], 2)+pow(sinY[i]-sinY[i+1], 2)) < 200 && sinOn) line(sinX[i], sinY[i], sinX[i+1], sinY[i+1]); 

    /* graph cos */
    stroke(0, 0, 120, fadeAmount);
    if (sqrt(pow(cosX[i]-cosX[i+1], 2)+pow(cosY[i]-cosY[i+1], 2)) < 200 && cosOn) line(cosX[i], cosY[i], cosX[i+1], cosY[i+1]); 

    //    stroke(0, 0, 120, fadeAmount);
    //    if (sqrt(pow(cosX[i]-cosX[i+1], 2)+pow(cosY[i]-cosY[i+1], 2)) < 200 && cosOn)line(cosX[i], cosY[i], cosX[i+1], cosY[i+1]);
    //    //if(sqrt(pow(tanX[i]-tanX[i+1],2)+pow(tanY[i]-tanY[i+1],2)) < 200)line(tanX[i], tanY[i], tanX[i+1], tanY[i+1]);
    //
    //    stroke(120, 0, 0, fadeAmount);
    //    if (sqrt(pow(squinXG[i]-squinXG[i+1], 2)+pow(squinYG[i]-squinYG[i+1], 2)) < 200 && squinOn)line(squinXG[i], squinYG[i], squinXG[i+1], squinYG[i+1]);
  }

  // trim arrays
  if (sinX.length >= tailLength) sinX = reverse(shorten(reverse(sinX)));
  if (sinY.length >= tailLength) sinY = reverse(shorten(reverse(sinY)));

  if (cosX.length >= tailLength) cosX = reverse(shorten(reverse(cosX)));
  if (cosY.length >= tailLength) cosY = reverse(shorten(reverse(cosY)));

  if (squineX.length >= tailLength) squineX = reverse(shorten(reverse(squineX)));
  if (squineY.length >= tailLength) squineY = reverse(shorten(reverse(squineY)));

  if (cosquineX.length >= tailLength) cosquineX = reverse(shorten(reverse(cosquineX)));
  if (cosquineY.length >= tailLength) cosquineY = reverse(shorten(reverse(cosquineY)));

  //if(tanX.length >= tailLength) tanX = reverse(shorten(reverse(tanX)));
  //if(tanY.length >= tailLength) tanY = reverse(shorten(reverse(tanY)));
}





void keyPressed() {

  if (key == 's') sinOn = !sinOn;
  if (key == 'c') cosOn = !cosOn;
  if (key == 'q') squineOn = !squineOn;
  if (key == 'w') cosquineOn = !cosquineOn;
  if (key == 'a') auto = !auto;

  if (keyCode == UP) n++;
  if (keyCode == DOWN) n--;

  if (keyCode == LEFT) tailLength += 10;
  if (keyCode == RIGHT) tailLength -= 10;
  tailLength = max(tailLength, 10);

  if (key == '+') angleStep+= .01;
  if (key == '-') angleStep-= .01;
  angleStep = max(0, angleStep);

  n = max(3.0, n);
}


float[] trimToLength(float[] arr) {
  arr = subset(arr, max(arr.length-tailLength, 0));
  return arr;
}

