float canvasWidth = 500;
float canvasHeight = 500;

float currentX = 0;
float currentY = 0;

float totalIterations = 0;
float totalF1 = 0;
float totalF2 = 0;
float totalF3 = 0;
float totalF4 = 0;

int speed = 40;

void setup() {
  size(int(canvasWidth), int(canvasHeight));
  background(255, 255, 255,0);
  frameRate(200);
}

void draw() {
  translate(canvasWidth/2, canvasHeight);

  for (int i = 0; i < speed; i++) {

    plotPoint();

    float randomNum = random(100);

    totalIterations++;

    if (randomNum < 1) {
      function1();
      totalF1++;
    }
    else if (randomNum < 1+85) {
      function2();
      totalF2++;
    }
    else if (randomNum < 1+85+7) {
      function3();
      totalF3++;
    }
    else if (randomNum < 1+85+7+7) {
      function4();
      totalF4++;
    }
    else println("Missed point");
  }
}

void plotPoint() {
  noStroke();
  fill(0, 120, 0,10);
  ellipse(canvasWidth/10.0*currentX, -canvasHeight/10.0*currentY, 1, 1);
}

void function1() {
  currentX = 0;
  currentY = .16*currentY;
}

void function2() {
  float newX = 0.85*currentX + 0.04*currentY;
  float newY = -0.04*currentX + 0.85*currentY + 1.6;
  currentX = newX;
  currentY = newY;
}

void function3() {
  float newX = 0.20*currentX + -0.26*currentY;
  float newY = 0.23*currentX + 0.22*currentY + 1.6;
  currentX = newX;
  currentY = newY;
}

void function4() {
  float newX = -0.15*currentX + 0.28*currentY;
  float newY = 0.26*currentX + 0.24*currentY + 0.44;
  currentX = newX;
  currentY = newY;
}

void keyPressed() {
  println();
  println(totalF1/totalIterations);
  println(totalF2/totalIterations);
  println(totalF3/totalIterations);
  println(totalF4/totalIterations);
  println(totalIterations);
}

