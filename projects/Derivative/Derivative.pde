
int canvasWidth = 500;
int canvasHeight = 500;

Boolean graphDrawn;

PImage graph;

float xCoord = .02;

float a = xCoord-10;
float b = xCoord+10;

float currentWindowDelta = 10;

float zoomCt = 0.0;
Boolean zoomOut = false;
Boolean zoomIn = false;

float xMin = a-1;
float xMax = b+1;
float yMin;
float yMax;

float xOffset = 0;
float yOffset = 0;
float xScale = 1;
float yScale = 1;

int sketchWidth = 500;
int sketchHeight = 500;

String theFunction = "(x^2 + 2)";

float stepSize = .04;

float xVal;
float yVal;

int drawCt = 0;

float delta = 2;
float slope;

Boolean auto = false;

Control rectControl;

Boolean needsDisplay = false;

void setup() {
  setFunction(theFunction, "1");

  size(500, 500);
  frameRate(5);

  updateWindow();
}

void draw() {

  if (!needsDisplay && !auto) return;

  background(255, 255, 255);

  pushMatrix();

  translate(250-convertXCoord(xOffset), 250-convertYCoord(yOffset));

  /* AXES */
  strokeWeight(2);
  stroke(0, 0, 0, 50);
  line(convertXCoord(0), -convertYCoord(-100), convertXCoord(0), -convertYCoord(100));
  line(convertXCoord(100), -convertYCoord(0), convertXCoord(-100), -convertYCoord(0));

  strokeWeight(3);
  stroke(0, 0, 0);
  
  drawGraph();

  float x0 = xCoord;
  float x1 = xCoord + delta;

  xVal = x0;
  float y0 = float(parse(theFunction));
  xVal = x1;
  float y1 = float(parse(theFunction));

  if (y1-y0 != 0) {
    /* our approximation has topped out */
    slope = (y1-y0)/(x1-x0);
  }
  else{
    if(abs(x0-x1) >= 1){
      /* the slope is 0 */
     slope = 0; 
    }
  }

  stroke(120, 0, 0);
  line(convertXCoord(x0-1), -convertYCoord(y0-slope), convertXCoord(x1+1), -convertYCoord(y1+slope));

  stroke(0, 0, 0);
  fill(0, 0, 0);
  xVal = xCoord;
  float yCoord = float(parse(theFunction));
  ellipse(convertXCoord(xCoord), -convertYCoord(yCoord), 10, 10);
  ellipse(convertXCoord(x1), -convertYCoord(y1), 10, 10);

  float displayDelta = round(delta*1000.0)/1000.0;
  slope = round(slope*100.0)/100.0;

  /* display information */
  popMatrix();

  fill(255, 255, 255);
  noStroke();
  rect(10, 0, 150, 120);
  fill(0, 0, 0);
  textSize(20);
  textAlign(LEFT);
  text("y = " + theFunction, 25, 20);
  text("Δy/Δx = " + slope, 25, 45);
  text("Δx = " + displayDelta, 25, 70);
  text("x_0 = " + xCoord, 25, 95);

  needsDisplay = false;

  if (auto){
    if(delta > .1){
     delta = max(0,delta-.1);
    }
    else{
     delta *= .5; 
    }
  }
}

void takeLimit() {
  auto = true;
}
void stopLimit() {
  auto = false;
}
void increaseDelta() {
  delta=delta*2;
  needsDisplay = true;
}
void decreaseDelta() {
  delta=delta*.5;
  needsDisplay = true;
}
void resetDelta() {
  delta=2;
  auto = false;
  needsDisplay = true;
}
void zoomOut() {
  
}
void zoomIn() {
  
}


void setFunction(String str, String xCoordString) {
  theFunction = str;
  xCoord = int(xCoordString);
  updateWindow();
  needsDisplay = true;
  graphDrawn = false;

  //println("function set");
  /*
  xMax = b+.25;
   xMin = a-.25;
   yMax = -100;
   yMin = 100;
   
   // GRAPH
   for (float i = xMin; i < xMax; i += stepSize) {
   i = min(i, 20-stepSize);
   xVal = i;
   float y1 = float(parse(theFunction));
   xVal = i+stepSize;
   float y2 = float(parse(theFunction));
   
   yMax = max(yMax, ceil(y1));
   yMin = min(yMin, floor(y1));
   }
   
   yMax+=2;
   yMin-=2;
   
   // set scale 
   
   //xOffset = (xMax + xMin)/2;
   //yOffset = (yMax + yMin)/2;
   
   float x0 = xCoord;
   xVal = x0;
   float y0 = float(parse(theFunction));
   
   //yMax = y0 + 1;
   //yMin = y0 - 1;
   
   xOffset = x0;
   yOffset = y0;
   
   xScale = sketchWidth/((xMax-xMin));
   yScale = sketchHeight/((yMax-yMin));
   */
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
}

float convertXCoord(float xInput) {
  return((xInput - xOffset)*xScale);
}

float convertYCoord(float yInput) {
  return((yInput - yOffset)*yScale);
}

void zoom() {
  if (!zoomIn && !zoomOut) return;
  if (zoomCt >= 1 && zoomIn) return; 
  if (zoomCt <= 0 && zoomOut) return; 

  //println("zooming");

  currentWindowDelta = 10*(1-zoomCt) + .5*zoomCt;

  a = xCoord - currentWindowDelta;
  b = xCoord + currentWindowDelta;

  float x0 = xCoord;
  xVal = x0;
  float y0 = float(parse(theFunction));

  xOffset = x0;
  yOffset = y0;

  xScale = sketchWidth/(currentWindowDelta);
  yScale = sketchHeight/(currentWindowDelta);

  //setFunction(theFunction);

  if (zoomIn) zoomCt += .005;
  if (zoomOut) zoomCt -= .005;


  delta = 2*delta;
}

void updateWindow() {
  a = xCoord - currentWindowDelta;
  b = xCoord + currentWindowDelta;
  xMin = a;
  xMax = b;

  float x0 = xCoord;
  xVal = x0;
  float y0 = float(parse(theFunction));

  xOffset = x0;
  yOffset = y0;

  xScale = sketchWidth/(currentWindowDelta);
  yScale = sketchHeight/(currentWindowDelta);
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

