// Declare initial values here
float rCt;
float iCt;
float stepSize;
float cVal;
float zoomFactor;
int shiftX;
int shiftY;
boolean mouseCl;

float firstX;
float firstY;

float secondX;
float secondY;

int drawCt;

float tVar;

void setup() {
  size(1000, 500);
  //background(300, 300, 300);
  frameRate(100);
  smooth();

  cVal = 2; // 2 gives you typical set
  rCt = -2;
  iCt = -2;
  stepSize = .01;
  zoomFactor=1;
  shiftX = 250;
  shiftY = 250;
 
  drawCt = 1;
  
  translate(shiftX, shiftY);
  
//  iCt=iCt + stepSize;
  
//    while (rCt <= 2/zoomFactor && iCt <=2/zoomFactor) {
//    checkVal();
//    rCt=rCt + stepSize;
//  }
  
  for(rCt = -2; rCt <= 2/zoomFactor; rCt += stepSize){
    for(iCt = -2; iCt <= 2/zoomFactor; iCt += stepSize){
     checkVal();   
    }
  }
  
}


void draw() {
  /*
  translate(shiftX, shiftY);

  rCt = -2/zoomFactor;
  iCt=iCt + stepSize;

    if (mouseCl) {
    frameRate(10);

    juliaCalc((1-tVar)*firstX + tVar*secondX, (1-tVar)*firstY+tVar*secondY);
    tVar = tVar+.01;

    stroke(300, 300, 300);
    ellipse((1-tVar)*firstX*125 + 125*tVar*secondX, (1-tVar)*firstY*125+tVar*secondY*125, 3, 3);

    if (tVar == 1) {
      tVar = 0;
    }
  }*/
}

void checkVal() {

  int ct = 0;
  float rVal = 0;
  float iVal = 0;

  while (ct < 100 && (rVal*rVal + iVal*iVal) <= cVal*cVal) {

    float rValTemp = rVal;

    rVal = rVal*rVal-iVal*iVal+rCt;
    iVal = 2*rValTemp*iVal+iCt;

    ct++;
  } 

  if ((rVal*rVal + iVal*iVal) <= cVal*cVal) {
    //println("in set!");
    stroke(0, 0, 300);
    ellipse(rCt*125*zoomFactor, iCt*125*zoomFactor, 1, 1);
  }
  else {
    //println("not in set!");
    stroke(0, 0, ct*3);
    ellipse(rCt*125*zoomFactor, iCt*125*zoomFactor, 1, 1);
  }
}

void mouseClicked() {
  //println("mouseClicked");
  juliaCalc((mouseX-250)/125.0,(mouseY-250)/125.0);
}

void juliaCalc(float rCoord, float iCoord) {
  //println("juliaCalc called");
  
  // PImage fractal;
  // fractal = loadImage("fractal1997.jpg");
  // image(fractal, -250, -250);


  // For clicking and drawing  
  //  float rCoord = (mouseX-250)/125.0;
  //  float iCoord = (mouseY-250)/125.0;

  float rJulia = -2;
  float iJulia = -2;

  while (rJulia <= 2) {

    iJulia = -2;

    while (iJulia <= 2) {

      float rVal = rJulia;
      float iVal = iJulia;

      int ct = 0;

      while (ct < 100 && (rVal*rVal + iVal*iVal) <= cVal*cVal) {
        float rValTemp = rVal;
        rVal = rVal*rVal-iVal*iVal+rCoord;
        iVal = 2*rValTemp*iVal+iCoord;
        ct++;
      } 

      if ((rVal*rVal + iVal*iVal) <= cVal*cVal) {
        //println("in set!");
        stroke(0,0,300);
        fill(0,0,300);
        ellipse(rJulia*125*zoomFactor+750, iJulia*125*zoomFactor + 250, 1, 1);
      }
      else {
        //println("not in set!");
        stroke(100-3*ct, 0, ct*3);
        fill(100-3*ct, 0, ct*3);
        ellipse(rJulia*125*zoomFactor+750, iJulia*125*zoomFactor + 250, 1, 1);
      }

      iJulia = iJulia + stepSize;
    }
    rJulia = rJulia+stepSize;
  }
  //println("juliaCalc done");
}


