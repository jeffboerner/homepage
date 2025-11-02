//float n = 6;
//float fraction = 1/3.0;

//float n = 5;
//float fraction = 3/8.0;

//float n = 3;
//float fraction = 1/2.0;

//int n = 8;
//float fraction = .295;

// n = 6, fraction = .48 yields a snowflake type thing

float n = 3;
float fraction = .5;

float direction = -1;

int currentX;
int currentY;

int speed = 1000;

int canvasSize = 500;

Boolean go = false;

Boolean paused = true;

Point[] vertices;// = new Point[round(n)];

void setup() {
  frameRate(10);
  size(canvasSize, canvasSize);
  initialize();
}

void initialize() {
  
  //println("initialize() called with n=" + n);
  
  vertices = new Point[round(n)];
  noStroke();
  fill(120, 0, 0);
  background(255, 255, 255);

  for (int i = 0; i < n; i++) {
    vertices[i] = new Point();
    vertices[i].xCoord = round(canvasSize/2.0*cos(i*2*PI/(n) - PI/2.0));
    vertices[i].yCoord = round(canvasSize/2.0*sin(i*2*PI/(n) - PI/2.0));
  }

  currentX = vertices[0].xCoord;
  currentY = vertices[0].yCoord;

  for (int i = 0; i < 100; i++) {
    int randomNum = floor(random(n));
    currentX = round((vertices[randomNum].xCoord + currentX)*fraction);
    currentY = round((vertices[randomNum].yCoord + currentY)*fraction);
  }
}

void draw() {
  translate(canvasSize/2.0, canvasSize/2.0);
  //background(255,255,255);
  
  if(paused) return;

  for (int i = 0; i < speed; i++) {
    fill(0, 120, 0);
    ellipse(currentX/(2*fraction), currentY/(2*fraction), 1, 1);
    int randomNum = floor(random(n));
    currentX = round((vertices[randomNum].xCoord + currentX)*fraction);
    currentY = round((vertices[randomNum].yCoord + currentY)*fraction);
  }
  if (go) {
    fraction+=direction*.01;
  }
}

void keyPressed() {
  if (key == ' ') {
    go = ! go;
    println("Current Fraction is " + fraction);
  }
  if (key == 's') {
    direction = -direction;
  }
}

public class Point extends Object {
  int xCoord;
  int yCoord;
}

void update(String speedString, String fractionString, String verticesString) {
  background(255, 255, 255);

  n = int(verticesString);
  fraction = float(fractionString);
  
  switch(int(speedString)){
    case 1:
    speed = 50;
    break;
    case 2:
    speed = 500;
    break;
     case 3:
    speed = 1000;
    break;
    case 4:
    speed = 5000;
    break;
     case 5:
    speed = 10000;
    break;
  }

  //println(n);
  //println(fraction);
  //println(speed);
  
  initialize();

  //println("The speed is " + speed);
  //println("Vertices: " + verticesString); 
  //println("Fraction: " + fractionString);
}

void stepAnimation(String stepSizeString){
  //println("stepAnimation called");
  
  if(!paused) return;
  
  int stepAmount = int(stepSizeString);
  
  pushMatrix();
  translate(canvasSize/2.0, canvasSize/2.0);
  
  for (int i = 0; i < stepAmount; i++) {
    fill(0, 120, 0);
    ellipse(currentX/(2*fraction), currentY/(2*fraction), 1, 1);
    int randomNum = floor(random(n));
    currentX = round((vertices[randomNum].xCoord + currentX)*fraction);
    currentY = round((vertices[randomNum].yCoord + currentY)*fraction);
  }
  
  popMatrix();
}

void play(){
  //println("play");
  paused = !paused;
}

void pause(){
  //println("pause");
  paused = true;
}
