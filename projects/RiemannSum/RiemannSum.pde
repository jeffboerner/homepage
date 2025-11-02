
Boolean graphDrawn;
PImage graph;

int canvasWidth = 500;
int canvasHeight = 500;

int a = 0;
int b = 5;

int xMin = a-1;
int xMax = b+1;
int yMin;
int yMax;

int xOffset = 0;
int yOffset = 0;
int xScale = 1;
int yScale = 1;

int sketchWidth = 500;
int sketchHeight = 500;

String theFunction = "(x^2)";//"(x+-1)^(0+-1)";//"4*(1+-1*x^2)^(.5)";//"x";//"2.5*6+-2.5*(0.4*x+-1*4)^2";

float stepSize = .02;

int n = 2;
int currentn = 1;

float xVal;
float yVal;

int drawCt = 0;

Boolean auto = false;

Control rectControl;

Boolean indexEqualsString(int index, String mainString, String charString) {
  char[] checkChar = new char[1];
  checkChar[0] = mainString.charAt(index);
  String checkString = new String(checkChar);
  return (checkString.equals(charString));
}

void setup() {
  setFunction(theFunction, "" + a, "" + b);

  size(500, 500);
  frameRate(30);

  /* set up control */
  String[] controlArray = {
    "Left", "Right", "Mid"
  };
  rectControl = new Control(controlArray);
  rectControl.originX = 240;
  rectControl.theWidth = 70;
}

void draw() {

  if (currentn == n) return;

  background(255, 255, 255);

  pushMatrix();

  translate(250-convertXCoord(xOffset), 250-convertYCoord(yOffset));

  strokeWeight(4);
  stroke(0, 0, 0);

  /* AXES */
  line(convertXCoord(0), -convertYCoord(yMax), convertXCoord(0), -convertYCoord(yMin));
  line(convertXCoord(xMin), -convertYCoord(0), convertXCoord(xMax), -convertYCoord(0));

  strokeWeight(3);
  stroke(0, 0, 0);

  /* GRAPH */
  /*
  for (float i = xMin; i < xMax; i += stepSize) {
    i = min(i, 20-stepSize);
    xVal = i;
    float y1 = float(parse(theFunction));
    xVal = i+stepSize;
    float y2 = float(parse(theFunction));

    line(convertXCoord(i), -convertYCoord(y1), convertXCoord(i+stepSize), -convertYCoord(y2));
  }
  */
  drawGraph();

  float area = 0;
  float delta = float(b-a)/float(n);

  /**** RECTANGLES */
  float offset = rectControl.selectedComponent;

  noFill();
  fill(0, 120, 0, 70);
  stroke(0, 0, 0, 40);

  for (float i = 0; i < n; i += 1) {

    switch(rectControl.selectedComponent) {
    case 0: // Left
      xVal = a+i*delta;
      break;
    case 1: // Right
      xVal = a+(i+1)*delta;
      break;
    case 2: // Mid
      xVal = a+i*delta+.5*delta;
      break;
    }  

    float y0 = float(parse(theFunction));

    rect(convertXCoord(a+i*delta), -convertYCoord(0), xScale*delta, -yScale*y0);

    area+=y0;
  }

  area*=delta;

  area = round(area*100.0)/100.0;
  float displayDelta = round(delta*100.0)/100.0;

  /* ENDPOINTS */
  strokeWeight(1);
  fill(0, 0, 0, 40);
  line(convertXCoord(a), -convertYCoord(yMax), convertXCoord(a), -convertYCoord(yMin));
  line(convertXCoord(b), -convertYCoord(yMax), convertXCoord(b), -convertYCoord(yMin));

  textAlign(CENTER);
  fill(0, 0, 0);
  text(a, convertXCoord(a), -convertYCoord(-3));
  text(b, convertXCoord(b), -convertYCoord(-3));

  popMatrix();

  fill(255, 255, 255);
  noStroke();
  rect(0,0,150,90);
  fill(0, 0, 0);
  textSize(20);
  textAlign(LEFT);
  text("Area: " + area, 10, 20);
  text("n = " + n, 10, 40);
  text("Δx = " + displayDelta, 10, 60);
  rectControl.display();

  currentn = n;

  if (auto) n++;
}

void startAuto() {
  auto = true;
  n++;
}
void stopAuto() {
  auto = false;
}
void increaseN() {
  n++;
}
void decreaseN() {
  n--;
}


void setFunction(String functionString, String aString, String bString) {
  a = int(aString);
  b = int(bString);
  graphDrawn = false;

  theFunction = functionString; 

  xMax = b+1;
  xMin = a-1;
  yMax = -100;
  yMin = 100;

  /* GRAPH */
  for (float i = xMin; i < xMax; i += stepSize) {
    i = min(i, 20-stepSize);
    xVal = i;
    float y1 = float(parse(theFunction));
    xVal = i+stepSize;
    float y2 = float(parse(theFunction));

    yMax = max(yMax, ceil(y1));
    yMin = min(yMin, floor(y1));
  }

  yMin = min(yMin,0);
  yMax = max(0,yMax);

  yMax+=2;
  yMin-=2;

  /* set scale */

  xOffset = (xMax + xMin)/2;
  yOffset = (yMax + yMin)/2;

  xScale = sketchWidth/((xMax-xMin));
  yScale = sketchHeight/((yMax-yMin));

  /*
  println("xOffset = " + xOffset);
   println("yOffset = " + yOffset);
   
   println("yMax = " + yMax);
   println("yMin = " + yMin);
   println(yMax-yMin);
   
   println("xScale = " +xScale);
   println("yScale = " +yScale);
   
   println("0 converts X to " + convertXCoord(0));
   println("0 converts Y to " + convertYCoord(0));
   
   println("38 converts Y to " + convertYCoord(38));
   */
  currentn--;
}

float convertXCoord(float xInput) {
  return((xInput - xOffset)*xScale);
}

float convertYCoord(float yInput) {
  return((yInput - yOffset)*yScale);
}

void drawGraph() {

  if (graphDrawn) {
    image(graph, -canvasWidth/2.0, -canvasHeight/2.0);
  }
  else {
    /* draw Graph from scratch */
    for (float i = xMin; i < xMax; i += stepSize) {
      i = min(i, 20-stepSize);
      xVal = i;
      float y1 = float(parse(theFunction));
      xVal = i+stepSize;
      float y2 = float(parse(theFunction));

      line(convertXCoord(i), -convertYCoord(y1), convertXCoord(i+stepSize), -convertYCoord(y2));
    }
    
    /* save graph to image */
    
    graph = get();
  }

  graphDrawn = true;
}

