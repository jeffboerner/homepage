
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

public class Control extends Object {

  String[] titles;

  int originX = 0;
  int originY = 0;

  int selectedComponent;

  int theWidth = 50;

  Control(String[] t) {
    titles = new String[t.length];
    arrayCopy(t, titles);
    //controlArray = (Control[]) append(controlArray, this);
  }

  void display() {
    
    selectedComponent = min(selectedComponent,titles.length-1);
    selectedComponent = max(selectedComponent,0);
    
    stroke(0);
    
    for (int i = 0; i < titles.length; i++) {
      if (selectedComponent == i) {
        fill(0, 0, 0, 20);
        rect(originX+i*theWidth, originY, theWidth, 25);
      }
      else {
        fill(255, 255, 255);
        rect(originX+i*theWidth, originY, theWidth, 25);
      }
      stroke(0,0,0);
      fill(0, 0, 0);
      textAlign(CENTER);
      textSize(20);
      text(titles[i], originX+i*theWidth, originY+5, theWidth, 25);
    }
  }

  Boolean touched() {
    if (mouseX >= originX && mouseY >= originY && mouseX <= originX + theWidth*titles.length && mouseY <= originY + 25) {
      selectedComponent = floor((mouseX-originX)/((float)theWidth));
      currentn--;
      return true;
    }
    return false;
  }
}
/* Responsible for turning a string into a float value */

/****
 ISSUES
 - still is having problems with negatives
 - more error checking needed
 - operations on end
 
 *****/


int indexOfMatchingParen(String str, int startIndex) {

  int parenCt = 1;

  while (parenCt > 0 && startIndex+1 < str.length ()) {
    startIndex++;

    /* 
     increment if we find open paren
     decrement if we find closed paren
     */

    if (indexEqualsString(startIndex, str, "(")) parenCt++; 
    if (indexEqualsString(startIndex, str, ")")) parenCt--;
  } 
  return startIndex;
}

String parse(String inputStr) {

  if (inputStr.equals("")) return "";

  /*************
   Replace variables and parameters
   **************/

  /* replace all x with xVal */
  while (inputStr.indexOf ('x') != -1) {
    inputStr = inputStr.substring(0, inputStr.indexOf ('x')) + 
      xVal +
      inputStr.substring(inputStr.indexOf ('x')+1);
  }
  while (inputStr.indexOf ('y') != -1) {
    inputStr = inputStr.substring(0, inputStr.indexOf ('y')) + 
      yVal +
      inputStr.substring(inputStr.indexOf ('y')+1);
  }

  /*************
   Evaluate Functions
   **************/

  /* sin */
  while (inputStr.indexOf ("sin") != -1) {
    int matchIndex = indexOfMatchingParen(inputStr, inputStr.indexOf("sin")+4);
    inputStr = inputStr.substring(0, inputStr.indexOf ("sin")) + 
      sin(float(parse(inputStr.substring(inputStr.indexOf("sin")+4, matchIndex)))) +
      inputStr.substring(matchIndex+1);
  }
  /* cos */
  while (inputStr.indexOf ("cos") != -1) {
    int matchIndex = indexOfMatchingParen(inputStr, inputStr.indexOf("cos")+4);
    inputStr = inputStr.substring(0, inputStr.indexOf ("cos")) + 
      cos(float(parse(inputStr.substring(inputStr.indexOf("cos")+4, matchIndex)))) +
      inputStr.substring(matchIndex+1);
  }

  /*************
   Evaluate everything in parens
   **************/

  while (inputStr.indexOf ('(') != -1) {
    /* open paren present */

    int parenCt = 1;
    int index = inputStr.indexOf('(');

    while (parenCt > 0 && index+1 < inputStr.length ()) {
      index++;

      /********* 
       increment if we find open paren
       decrement if we find closed paren
       ********/
      if (indexEqualsString(index, inputStr, "(")) parenCt++; 
      if (indexEqualsString(index, inputStr, ")")) parenCt--;
    }

    if (parenCt != 0) {
      println("PARSE ERROR - mismatched parentheses");
    }
    else {
      inputStr = inputStr.substring(0, inputStr.indexOf('(')) + 
        parse(inputStr.substring(inputStr.indexOf('(')+1, index)) +
        inputStr.substring(index+1);
    }
  }

  /* All parens have been removed */

  /* replace "--" with "+" */
  while (inputStr.indexOf ("--") != -1) {
    inputStr = inputStr.substring(0, inputStr.indexOf ("--")) + 
      "+" +
      inputStr.substring(inputStr.indexOf ("--")+2);
  }

  /* adjust if leads with + */
  if (indexEqualsString(0, inputStr, "+")) {
    inputStr = inputStr.substring(1);
  }

  String[] expressionArray = new String[1];
  expressionArray[0] = inputStr;

  /* create expressionArray */
  for (int i = 0; i < inputStr.length(); i++) {
    if (indexEqualsString(i,inputStr, "*")) {
      inputStr = expressionArray[expressionArray.length-1];
      expressionArray[expressionArray.length-1] = inputStr.substring(0, i);
      expressionArray = append(expressionArray, "*");
      expressionArray = append(expressionArray, inputStr.substring(i+1));
      inputStr = expressionArray[expressionArray.length-1];
      i = 0;
    }
    else if (indexEqualsString(i,inputStr, "/")) {
      inputStr = expressionArray[expressionArray.length-1];
      expressionArray[expressionArray.length-1] = inputStr.substring(0, i);
      expressionArray = append(expressionArray, "/");
      expressionArray = append(expressionArray, inputStr.substring(i+1));
      inputStr = expressionArray[expressionArray.length-1];
      i = 0;
    }
    else if (indexEqualsString(i,inputStr, "^")) {
      inputStr = expressionArray[expressionArray.length-1];
      expressionArray[expressionArray.length-1] = inputStr.substring(0, i);
      expressionArray = append(expressionArray, "^");
      expressionArray = append(expressionArray, inputStr.substring(i+1));
      inputStr = expressionArray[expressionArray.length-1];
      i = 0;
    }
    else if (indexEqualsString(i,inputStr, "+")) {
      inputStr = expressionArray[expressionArray.length-1];
      expressionArray[expressionArray.length-1] = inputStr.substring(0, i);
      expressionArray = append(expressionArray, "+");
      expressionArray = append(expressionArray, inputStr.substring(i+1));
      inputStr = expressionArray[expressionArray.length-1];
      i = 0;
    }/*
    else if (inputStr.charAt(i) == '-') {
     inputStr = expressionArray[expressionArray.length-1];
     expressionArray[expressionArray.length-1] = inputStr.substring(0, i);
     expressionArray = append(expressionArray, "-");
     expressionArray = append(expressionArray, inputStr.substring(i+1));
     inputStr = expressionArray[expressionArray.length-1];
     i = 0;
     }*/
  }

  if (expressionArray.length == 1) return expressionArray[0];

  //println(expressionArray);

  /* apply operations to array */

  for (int i = 1; i < expressionArray.length; i+=2) {
    if (expressionArray[i].equals("^")) {
      expressionArray[i-1] = "" + pow(float(parse(expressionArray[i-1])), float(parse(expressionArray[i+1])));

      /* update expressionArray */
      String[] tempArray = new String[expressionArray.length];
      arrayCopy(expressionArray, tempArray);
      expressionArray = new String[expressionArray.length-2];
      expressionArray[i-1] = tempArray[i-1];
      for (int j = 0; j < i-1; j++) {
        expressionArray[j] = tempArray[j];
      }
      for (int j = i+2; j < tempArray.length; j++) {
        expressionArray[j-2] = tempArray[j];
      }
      i-=2;
    }
  }

  for (int i = 1; i < expressionArray.length; i+=2) {
    if (expressionArray[i].equals("*")) {
      expressionArray[i-1] = "" + float(parse(expressionArray[i-1]))*float(parse(expressionArray[i+1]));

      /* update expressionArray */
      String[] tempArray = new String[expressionArray.length];
      arrayCopy(expressionArray, tempArray);
      expressionArray = new String[expressionArray.length-2];
      expressionArray[i-1] = tempArray[i-1];
      for (int j = 0; j < i-1; j++) {
        expressionArray[j] = tempArray[j];
      }
      for (int j = i+2; j < tempArray.length; j++) {
        expressionArray[j-2] = tempArray[j];
      }
      i-=2;
    }
    else if (expressionArray[i].equals("/")) {
      expressionArray[i-1] = "" + float(parse(expressionArray[i-1]))/float(parse(expressionArray[i+1]));

      /* update expressionArray */
      String[] tempArray = new String[expressionArray.length];
      arrayCopy(expressionArray, tempArray);
      expressionArray = new String[expressionArray.length-2];
      expressionArray[i-1] = tempArray[i-1];
      for (int j = 0; j < i-1; j++) {
        expressionArray[j] = tempArray[j];
      }
      for (int j = i+2; j < tempArray.length; j++) {
        expressionArray[j-2] = tempArray[j];
      }
      i-=2;
    }
  }

  //inputStr = expressionArray[0];

  //println("About to look for +-");
  //println(expressionArray);

  for (int i = 1; i < expressionArray.length; i+=2) {

    //println("2nd order operations present");

    if (expressionArray[i].equals("+")) {
      expressionArray[i-1] = "" + (float(expressionArray[i-1])+float(expressionArray[i+1]));

      /* update expressionArray */
      String[] tempArray = new String[expressionArray.length];
      arrayCopy(expressionArray, tempArray);
      expressionArray = new String[expressionArray.length-2];
      expressionArray[i-1] = tempArray[i-1];
      for (int j = 0; j < i-1; j++) {
        expressionArray[j] = tempArray[j];
      }
      for (int j = i+2; j < tempArray.length; j++) {
        expressionArray[j-2] = tempArray[j];
      }
      i-=2;
    }/*
    else if (expressionArray[1].equals("-")) {
     expressionArray[0] = "" + (float(expressionArray[0])-float(expressionArray[2]));
     
     // update expressionArray 
     String[] tempArray = new String[expressionArray.length];
     arrayCopy(expressionArray, tempArray);
     expressionArray = new String[expressionArray.length-2];
     expressionArray[i-1] = tempArray[i-1];
     for (int j = 0; j < i-1; j++) {
     expressionArray[j] = tempArray[j];
     }
     for (int j = i+2; j < tempArray.length; j++) {
     expressionArray[j-2] = tempArray[j];
     }
     }*/
  }

  inputStr = expressionArray[0];

  /*
  for(int i = 0; i < inputStr.length(); i++){
   if(inputStr.charAt(i) == '*'){
   inputStr = "" + float(parse(inputStr.substring(0,i)))*float(parse(inputStr.substring(i+1)));
   i = 0;
   } 
   if(inputStr.charAt(i) == '^'){
   inputStr = "" + pow(float(parse(inputStr.substring(0,i))),float(parse(inputStr.substring(i+1))));
   i = 0;
   } 
   }
   */

  return inputStr;
}

void mouseClicked(){
  
  if(key == 'f'){
  //gifExport.finish();
  }
  
  //if(true) return;
  
  if(rectControl.touched()) return;
  
  if(mouseX <= 50 && mouseY >= 450){
    auto = !auto;
    n++;
  }
  else{
  n++;
  }
}

