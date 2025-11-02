//////
/// A program to draw knots from their grid diagram and visualize their arc presentation

/// Instructions:

// To construct a grid diagram type an 'x' when the mouse is in a box you would like an x in and type 'o' when the mouse is in a box you would like an o in

/* What this app should do */
/*
- Draw a grid diagram
 - compute Jones?
 - toggle through states?
 - make work in Processing.js
 */

StateChange[] changeArray = new StateChange[0];

boolean showGrid = true;
boolean showKnot = true;

// Global variables
import processing.opengl.*;

int[][] crossings;
int[][] vertPairs;

int gridSize;

int [] rowColors;
int [] colColors;

int underdiagonal;

int colWidth;

int knotDepth;

int[][] xoArray;

float rotX;
float rotY;
float rotZ;

boolean unlock;
boolean arcpres;
boolean drawPages;
boolean animate;

boolean diagonal;

float p;
float q;
float r;
float t;
float s;

float a;
float angle;

float drawCt;

int[][] colorsArr;

void initializeXOArray() {
  /////
  // Initialize xoArray
  xoArray = new int[gridSize][gridSize];

  for (int i1 = 0; i1 < gridSize; i1++) {
    for (int i2 = 0; i2 < gridSize; i2++) {
      xoArray[i1][i2] = -1;
    }
  }
  colWidth = round((width-200)/float(gridSize));
}

void setup() {

  gridSize = 5; // 25,12 is neat

  // Set this to false to create your own diagrams
  diagonal = true;
  underdiagonal = 2; // The y value in D_(x,y)

  // Controls amounts knot come out of screen
  knotDepth = 150;

  rotX = 0;
  rotY = 0;
  rotZ = 0;

  p = 0;
  q = 0;
  t = 0;
  s = 0;
  r = 0;

  drawCt = 0;

  unlock = false;
  arcpres = false;
  drawPages = false;
  animate = false;

  size(700, 700, OPENGL);



  initializeXOArray();



  ///////
  /// Initialize Grid

  //background(255, 255, 255);

  colWidth = round((width-200)/float(gridSize));



  //////
  // Draw Grid

  strokeWeight(2);
  drawGrid();

  if (diagonal) {
    //////
    // Automate a diagonal diagram

    for (int i1 = 0; i1 < gridSize; i1++) {
      for (int i2 = 0; i2 < gridSize; i2++) {
        if (i1 == i2) {
          xoArray[i1][i2] = 0;
          printX(i1, i2);
        }
        if (gridSize-i2 + i1 == underdiagonal) {
          xoArray[i1][i2] = 1;
          printO(i1, i2);
        }
        if (gridSize-i1+i2 == gridSize - underdiagonal) {
          xoArray[i1][i2] = 1;
          printO(i1, i2);
        }
      }
    }
  }

  initializeColors();

  drawKnot();
  //fill(255,0,0);
  //rect(400,400,400,400);
}




void printX(int xCoord, int yCoord) {
  fill(0, 0, 0);
  textAlign(CENTER, CENTER);
  //text("X", 100 + colWidth*x + colWidth/2.0, 100+colWidth*y + colWidth/2.0, 1);

  draw3DLine(100 + colWidth*xCoord + colWidth/2.0+(colWidth-15)/2.0, 100+colWidth*yCoord + colWidth/2.0-(colWidth-15)/2.0, 100 + colWidth*xCoord + colWidth/2.0-(colWidth-15)/2.0, 100+colWidth*yCoord + colWidth/2.0+(colWidth-15)/2.0);
  draw3DLine(100 + colWidth*xCoord + colWidth/2.0+(colWidth-15)/2.0, 100+colWidth*yCoord + colWidth/2.0+(colWidth-15)/2.0, 100 + colWidth*xCoord + colWidth/2.0-(colWidth-15)/2.0, 100+colWidth*yCoord + colWidth/2.0-(colWidth-15)/2.0);

  return;
}

void printO(int xCoord, int yCoord) {
  fill(0, 0, 0);
  textAlign(CENTER, CENTER);
  //text("O", 100 + colWidth*x, 100+colWidth*y, colWidth, colWidth);

  stroke(0, 0, 0);

  strokeWeight(3);

  for (int i = 0; i < 100; i++) {
    beginShape();
    vertex(100 + colWidth*xCoord + colWidth/2.0 + (colWidth-15)/2.0*cos(i*2*PI/100), 100+colWidth*yCoord + colWidth/2.0 + (colWidth-15)/2.0*sin(i*2*PI/100), 0);
    vertex(100 + colWidth*xCoord + colWidth/2.0 + ((colWidth-15)/2.0-3)*cos(i*2*PI/100), 100+colWidth*yCoord + colWidth/2.0 + ((colWidth-15)/2.0-3)*sin(i*2*PI/100), 0);
    vertex(100 + colWidth*xCoord + colWidth/2.0 + ((colWidth-15)/2.0-3)*cos((i+1)*2*PI/100), 100+colWidth*yCoord + colWidth/2.0 + ((colWidth-15)/2.0-3)*sin((i+1)*2*PI/100), 0);
    vertex(100 + colWidth*xCoord + colWidth/2.0 + (colWidth-15)/2.0*cos((i+1)*2*PI/100), 100+colWidth*yCoord + colWidth/2.0 + (colWidth-15)/2.0*sin((i+1)*2*PI/100), 0);
    endShape(CLOSE);
  }


  return;
}


void draw() {

  //lights();

  //colorMode(RGB, 255);

  ambientLight(100, 100, 100);
  directionalLight(52, 100, 63, 0.5, -1, -1);
  directionalLight(52, 100, 63, 0.5, -1, 1);

  //directionalLight(100,100,100, 0, 0, -1);
  //directionalLight(52,100,63, 0, 0, -1);

  background(255, 255, 255);

  translate(350, 350, 0);

  /* Set rotation */
  for (int i = changeArray.length - 1; i >= 0; i--) {
    StateChange change = changeArray[i];
    rotateX(change.deltaRotX);
    rotateY(change.deltaRotY);
    rotateZ(change.deltaRotZ);
  }

  translate(-350, -350, 0);

  drawGrid();
  drawKnot();


  if (true) return;

  if (unlock) {
    background(255, 255, 255);
    translate(width/2.0, height/2.0, 0);
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    translate(-width/2.0, -height/2.0, 0); 
    if (!arcpres && !animate) {
      //lights();
      drawKnot();
    }

    /*
    if (arcpres) {
     drawArcPres();
     }
     
     if (animate) {
     
     if (floor(drawCt) >= 3) {
     ambientLight(20, 20, 153);
     directionalLight(150, 150, 150, 0, .8, -1);
     directionalLight(30, 30, 30, 1, 0, -1);
     }
     
     switch(floor(drawCt)) {
     
     case 0:
     p = p + .005;
     drawKnot();
     break;
     
     case 1:
     p = 1;
     q = q + .005;
     drawKnot();
     
     break;
     
     case 2:
     q = 1;
     drawKnot();
     // text("The grid diagram of the knot.", 0, 600, 700, 100);
     break;
     
     case 3:
     
     q = 1;
     r = r + .005;
     animate();
     break;
     
     case 4:
     r = 1;
     s = s + .005;
     animate();
     break;
     
     case 5:
     s = 1;
     t = t + .005;
     animate();
     break;
     
     case 6:
     t = 1;
     rotY = rotY + .01;
     animate();
     break;
     
     case 7:
     rotY = rotY + .01;
     rotX = rotX - .005;
     drawPages = true;
     drawCt = drawCt + .005;
     animate();
     break;
     
     default:
     rotY = rotY + .01;
     drawPages = true;
     animate();
     break;
     }
     
     drawCt = drawCt + .005;
     }
     */
  }

  // used for creating animation
  // saveFrame("images/grid####.jpg");
}



void drawKnot() {

  if (!showKnot) return;

  //lights();

  crossings = new int[gridSize][gridSize];
  vertPairs = new int[gridSize][4];

  background(255, 255, 255);

  //colorKnot();

  stroke(0, 0, 0);
  strokeWeight(4);


  ////
  // Drawing Vertical Lines

  float y1Index = 0;
  float y2Index = 0;

  for (int i = 0;i < gridSize; i++) {
    for (int j = 0;j < gridSize; j++) {
      if (xoArray[i][j] == 0) {
        y1Index = j;
      }
      if (xoArray[i][j] == 1) {
        y2Index = j;
      }
    }

    float minX = min(y1Index, y2Index);
    float maxX = max(y1Index, y2Index);

    vertPairs[i][0] = i;
    vertPairs[i][1] = int(minX);
    vertPairs[i][2] = i;
    vertPairs[i][3] = int(maxX);

    for (int j = 0; j < gridSize; j++) {
      if (minX < j && j < maxX) {
        noStroke();
        fill(255, 255, 255);
        //rect(100 + colWidth*i + colWidth/3, 100+colWidth*j + colWidth/3, colWidth/3.0, colWidth/3.0);
      }
    }


    p = 1;

    y2Index = y1Index*(1-p) + y2Index*p;

    stroke(0, 0, 0);
    strokeWeight(7);

    /*
    if (rowColors[i] > 10) {
     //// We need to make up a new color
     stroke((rowColors[i]-10)*30, (rowColors[i]-10)*30, (rowColors[i]-10)*30);
     }
     else {
     stroke(colorsArr[rowColors[i]-1][0], colorsArr[rowColors[i]-1][1], colorsArr[rowColors[i]-1][2]);
     }
     strokeWeight(4);
     */

    if (knotDepth*r == 0) {
      //line(100 + colWidth*i + colWidth/2, 100+colWidth*y1Index+ colWidth/2, knotDepth*r, 100 + colWidth*i+ colWidth/2, 100+colWidth*y2Index+ colWidth/2, knotDepth*r);
      draw3DLine(100 + colWidth*i + colWidth/2, 100+colWidth*y1Index+ colWidth/2, 100 + colWidth*i+ colWidth/2, 100+colWidth*y2Index+ colWidth/2);

      // lines coming out of screen
      draw3DLine(100 + colWidth*i + colWidth/2, 100+colWidth*y1Index+ colWidth/2+1, 100 + colWidth*i + colWidth/2, 100+colWidth*y1Index+ colWidth/2);
      draw3DLine(100 + colWidth*i+ colWidth/2, 100+colWidth*y2Index+ colWidth/2+1, 100 + colWidth*i+ colWidth/2, 100+colWidth*y2Index+ colWidth/2);
    }
    else {

      /*
      int otherX1Index = 0;
       int otherX2Index = 0;
       for(int x_0 = 0; x_0 < gridSize; x_0++){
       if(xoArray[x_0][int(y1Index)] != -1 && x_0 != i){
       otherX1Index = x_0;
       }
       if(xoArray[x_0][int(y2Index)] != -1 && x_0 != i){
       otherX2Index = x_0;
       }
       }
       */

      float midPoint1 = gridSize/2.0 - 0.5; //(i + otherX1Index)/2.0;
      float midPoint2 = gridSize/2.0 - 0.5; //(i + otherX2Index)/2.0;
      float x1IndexDown = (1-a)*i + a*midPoint1;
      float x2IndexDown = (1-a)*i + a*midPoint2;


      // start at angle ??
      // end at angle -pi + 2pi/(gridsize*2) + i*2pi/gridsize



      /*
      // vertical lines
       sline(100 + colWidth*i + colWidth/2, 100+colWidth*y1Index+ colWidth/2, knotDepth*r, 100 + colWidth*i+ colWidth/2, 100+colWidth*y2Index+ colWidth/2, knotDepth*r);
       */
      // lines coming out of screen
      sline(100 + colWidth*i + colWidth/2, 100+colWidth*y1Index+ colWidth/2+1, knotDepth*r, 100 + colWidth*x1IndexDown + colWidth/2, 100+colWidth*y1Index+ colWidth/2, 0);
      sline(100 + colWidth*i+ colWidth/2, 100+colWidth*y2Index+ colWidth/2+1, knotDepth*r, 100 + colWidth*x2IndexDown+ colWidth/2, 100+colWidth*y2Index+ colWidth/2, 0);




      float yUP = 100+colWidth*y1Index+ colWidth/2;
      float yDOWN = 100+colWidth*y2Index+ colWidth/2;

      float currX = (1-angle)*(100 + colWidth*i + colWidth/2.0) + angle*(2*knotDepth*r*sin(-PI + i*2*PI/gridSize) + 350);
      float currZ = (1-angle)*knotDepth*r + angle*2*knotDepth*r*cos(-PI + i*2*PI/gridSize);

      sline(currX, yUP, currZ, currX, yDOWN, currZ);
      //sline(currX, yUP, currZ, 100 + colWidth*x1IndexDown + colWidth/2, yUP, 0);
      //sline(currX, yDOWN, currZ, 100 + colWidth*x2IndexDown + colWidth/2, yDOWN, 0);
    }
  } 



  ///// Drawing white rectangles, so can see crossings
  for (int i = 1; i < gridSize - 1; i++) {
    for (int j = 1; j < gridSize - 1; j++) {
      // should a square be placed at (i,j)?
      //println("(" + i + "," + j +  ")");

      boolean foundV1Marker = false;
      boolean foundV2Marker = false;
      boolean foundH1Marker = false;
      boolean foundH2Marker = false;

      for (int k = 0; k < j; k++) {
        //println(xoArray[i][k]);
        if (xoArray[i][k] == 1 || xoArray[i][k] == 0) foundV1Marker = true;
      }
      //println();
      for (int k = j+1; k < gridSize; k++) {
        //println(xoArray[i][k]);
        if (xoArray[i][k] == 1 || xoArray[i][k] == 0) foundV2Marker = true;
      }
      //println();
      for (int k = 0; k < i; k++) {
        //println(xoArray[k][j]);
        if (xoArray[k][j] == 1 || xoArray[k][j] == 0) foundH1Marker = true;
      }
      //println();
      for (int k = i+1; k < gridSize; k++) {
        //println(xoArray[k][j]);
        if (xoArray[k][j] == 1 || xoArray[k][j] == 0) foundH2Marker = true;
      }
      //println();

      if (foundV1Marker && foundV2Marker && foundH1Marker && foundH2Marker) { 
        fill(255, 255, 0);
        noStroke();
        //rect(100 + colWidth*i + colWidth/3, 100+colWidth*j + colWidth/3, colWidth/3.0, colWidth/3.0);
        //beginShape();
        //vertex(100 + colWidth*i + colWidth/3, 100+colWidth*j + colWidth/3);
        //vertex(100 + colWidth*i + 2*colWidth/3, 100+colWidth*j + colWidth/3);
        //vertex(100 + colWidth*i + 2*colWidth/3, 100+colWidth*j + 2*colWidth/3);
        //vertex(100 + colWidth*i + colWidth/3, 100+colWidth*j + 2*colWidth/3);
        //endShape(CLOSE);
        crossings[i][j] = 1;
      }
    }
  }

  ////
  // Drawing Horizontal Lines

  float x1Index = 0;
  float x2Index = 0;

  for (int j = 0;j < gridSize; j++) {
    // find crossing and endpoints in this row
    int crossingIndex = -1;


    for (int i = 0;i < gridSize; i++) {
      if (crossings[i][j] == 1) {
        crossingIndex = i;
      }
      if (xoArray[i][j] == 0) {
        x1Index = i;
      }
      if (xoArray[i][j] == 1) {
        x2Index = i;
      }
    }


    if (knotDepth*r == 0) {
      int startIndex = 0;
      int stopIndex = 0;
      while (startIndex < gridSize && xoArray[startIndex][j] == -1) {
        startIndex++;
      }

      stopIndex = startIndex+1;
      while (stopIndex < gridSize && xoArray[stopIndex][j] == -1) {
        stopIndex++;
      }

      int[] rowCrossings = new int[0];

      for (int i = 0; i < gridSize; i++) {
        if (crossings[i][j] == 1) {
          rowCrossings = append(rowCrossings, i);
        }
      }
      // rowCrossings contains index of crossings in this row, in order

      if (rowCrossings.length != 0) {
        //first segment
        draw3DLine(100+colWidth*startIndex+ colWidth/2, 100+colWidth*j+colWidth/2, 100+colWidth*rowCrossings[0]+colWidth/4, 100 + colWidth*j+colWidth/2);

        for (int i = 0; i < rowCrossings.length-1; i++) {
          draw3DLine(100+colWidth*rowCrossings[i]+3*colWidth/4.0, 100 + colWidth*j+colWidth/2, 100+colWidth*rowCrossings[i+1]+colWidth/4.0, 100 + colWidth*j+colWidth/2);
        }

        //last segment
        draw3DLine(100+colWidth*stopIndex+ colWidth/2, 100+colWidth*j+colWidth/2, 100+colWidth*rowCrossings[rowCrossings.length-1]+3*colWidth/4.0, 100 + colWidth*j+colWidth/2);
      }
      else {
        // no crossings
        draw3DLine(100+colWidth*startIndex+ colWidth/2, 100+colWidth*j+colWidth/2, 100+colWidth*stopIndex+ colWidth/2, 100+colWidth*j+colWidth/2);
      }
    }



    if (knotDepth*r == 0) {
      // in the plane
      /*
      if (crossingIndex == -1) {
       // no crossing
       draw3DLine(100+colWidth*x1Index+ colWidth/2, 100+colWidth*j+colWidth/2, 100+colWidth*x2Index+colWidth/2, 100 + colWidth*j+colWidth/2);
       } 
       else {
       // there is a crossing
       if (crossingIndex > x1Index) {
       draw3DLine(100+colWidth*x1Index+ colWidth/2, 100+colWidth*j+colWidth/2, 100+colWidth*crossingIndex+colWidth/4, 100 + colWidth*j+colWidth/2);
       draw3DLine(100+colWidth*crossingIndex+ 3*colWidth/4, 100+colWidth*j+colWidth/2, 100+colWidth*x2Index+colWidth/2, 100 + colWidth*j+colWidth/2);
       }
       else {
       draw3DLine(100+colWidth*x2Index+ colWidth/2, 100+colWidth*j+colWidth/2, 100+colWidth*crossingIndex+colWidth/4, 100 + colWidth*j+colWidth/2);
       draw3DLine(100+colWidth*crossingIndex+ 3*colWidth/4, 100+colWidth*j+colWidth/2, 100+colWidth*x1Index+colWidth/2, 100 + colWidth*j+colWidth/2);
       }
       } */
    }
    else {
      // (k)not in plane
      fill(0, 0, 0);

      float midPoint = gridSize/2.0 - 0.5; //(x1Index + x2Index)/2.0;

      x1Index = (1-a)*x1Index + a*midPoint;
      x2Index = (1-a)*x2Index + a*midPoint;

      if (a != 1) {
        sline(100+colWidth*x1Index+ colWidth/2, 100+colWidth*j+colWidth/2, 0, 100+colWidth*x2Index+colWidth/2, 100 + colWidth*j+colWidth/2, 0);
      }
    }

    q = 1;
    x1Index = x2Index*(1-q) + x1Index*q;

    /*
    if (colColors[i] > 10) {
     //// We need to make up a new color
     stroke((colColors[i]-10)*30, (colColors[i]-10)*30, (colColors[i]-10)*30);
     }
     else {
     stroke(colorsArr[colColors[i]-1][0], colorsArr[colColors[i]-1][1], colorsArr[colColors[i]-1][2]);
     }
     */

    //line(100+colWidth*x1Index+ colWidth/2, 100+colWidth*i+colWidth/2, 100+colWidth*x2Index+colWidth/2, 100 + colWidth*i+colWidth/2);


    //stroke(0,200,0);
    //line(100+colWidth*x1Index+ colWidth/2, 100+colWidth*i+colWidth/2, 100+colWidth*x2Index+colWidth/2, 100 + colWidth*i+colWidth/2);
  } 





  /*
  ///// Drawing white rectangles, so can see crossings
   for (int i = 0; i < gridSize; i++) {
   for (int j = 0; j < gridSize; j++) {
   if (xoArray[i][j] != 1 && xoArray[i][j] != 0) {
   fill(255, 0, 0);
   noStroke();
   rect(100 + colWidth*i + colWidth/3, 100+colWidth*j + colWidth/3, colWidth/3.0, colWidth/3.0);
   }
   }
   }
   */

  strokeWeight(2);
  drawGrid();

  drawPlanes();

  return;
}



////////
/// Is like line, but draws a tube

void sline(float x1, float y1, float z1, float x2, float y2, float z2) {

  float xdisp = x1-x2;
  float ydisp = y1-y2;
  float zdisp = z1-z2;

  xdisp = xdisp/dist(x1, y1, z1, x2, y2, z2);
  ydisp = ydisp/dist(x1, y1, z1, x2, y2, z2);
  zdisp = zdisp/dist(x1, y1, z1, x2, y2, z2);

  float vx1 = y1-y2;
  float vy1 = x2-x1;
  float vz1 = 0;

  float magv1 = mag(vx1, vy1, vz1);

  vx1 = vx1/magv1;
  vy1 = vy1/magv1;
  vz1 = vz1/magv1;

  float vx2 = vy1*zdisp-vz1*ydisp;
  float vy2 = vz1*xdisp-vx1*zdisp;
  float vz2 = vx1*ydisp-vy1*xdisp;

  fill(255, 255, 0, 200);
  noStroke();

  for (float i = 0; i<=1; i = i + .1) {

    beginShape();
    vertex(x1+5*cos(2*PI*i)*vx1+5*sin(2*PI*i)*vx2, y1+5*cos(2*PI*i)*vy1+5*sin(2*PI*i)*vy2, z1+5*cos(2*PI*i)*vz1+5*sin(2*PI*i)*vz2);
    i = i + .1;
    vertex(x1+5*cos(2*PI*i)*vx1+5*sin(2*PI*i)*vx2, y1+5*cos(2*PI*i)*vy1+5*sin(2*PI*i)*vy2, z1+5*cos(2*PI*i)*vz1+5*sin(2*PI*i)*vz2);

    vertex(x2+5*cos(2*PI*i)*vx1+5*sin(2*PI*i)*vx2, y2+5*cos(2*PI*i)*vy1+5*sin(2*PI*i)*vy2, z2+5*cos(2*PI*i)*vz1+5*sin(2*PI*i)*vz2);
    i = i - .1;
    vertex(x2+5*cos(2*PI*i)*vx1+5*sin(2*PI*i)*vx2, y2+5*cos(2*PI*i)*vy1+5*sin(2*PI*i)*vy2, z2+5*cos(2*PI*i)*vz1+5*sin(2*PI*i)*vz2);
    endShape();
  }
}



void drawArcPres() {

  ////
  // Drawing Vertical Lines

    int y1Index = 0;
  int y2Index = 0;

  for (int i = 0;i < gridSize; i++) {
    for (int j = 0;j < gridSize; j++) {
      if (xoArray[i][j] == 0) {
        y1Index = j;
      }
      if (xoArray[i][j] == 1) {
        y2Index = j;
      }
    } 

    float angle = 2.0*PI/float(gridSize)*float(i);

    //vertical
    sline(width/2.0 + knotDepth*cos(angle), 100+colWidth*y1Index+ colWidth/2, knotDepth*sin(angle), width/2.0 + knotDepth*cos(angle), 100+colWidth*y2Index+ colWidth/2, knotDepth*sin(angle));


    //coming out of screen
    sline(width/2.0 + knotDepth*cos(angle), 100+colWidth*y1Index+ colWidth/2+1, knotDepth*sin(angle), width/2.0, 100+colWidth*y1Index+ colWidth/2, 0);
    sline(width/2.0 + knotDepth*cos(angle), 100+colWidth*y2Index+ colWidth/2+1, knotDepth*sin(angle), width/2.0, 100+colWidth*y2Index+ colWidth/2, 0);


    if (drawPages) {

      fill(255, 255, 255, 100);
      beginShape();
      vertex(width/2.0, 100, 0);
      vertex(width/2.0 + 2*knotDepth*cos(angle), 100, 2*knotDepth*sin(angle));
      vertex(width/2.0 + 2*knotDepth*cos(angle), height-100, 2*knotDepth*sin(angle));
      vertex(width/2.0, height-100, 0);
      vertex(width/2.0, 100, 0);
      endShape();
    }
  } 

  return;
}






void animate() {

  ////
  // Drawing Vertical Lines

  int y1Index = 0;
  int y2Index = 0;

  for (int i = 0;i < gridSize; i++) {
    for (int j = 0;j < gridSize; j++) {
      if (xoArray[i][j] == 0) {
        y1Index = j;
      }
      if (xoArray[i][j] == 1) {
        y2Index = j;
      }
    } 

    float angle = 2.0*PI/float(gridSize)*(float(-i)+ gridSize/2.0);

    float initialAngle = atan2(knotDepth*r, (100+colWidth*i+colWidth/2)-width/2.0);

    sline(width/2.0 + (knotDepth*t+dist(width/2.0, 0, 0, 100 + colWidth*i + colWidth/2, 0, r*knotDepth)*(1-t))*cos(angle*t+initialAngle*(1-t)), (100+colWidth*y1Index+ colWidth/2), (knotDepth*t+dist(width/2.0, 0, 0, 100 + colWidth*i + colWidth/2, 0, r*knotDepth)*(1-t))*sin(angle*t+initialAngle*(1-t)), width/2.0 + (knotDepth*t+dist(width/2.0, 0, 0, 100 + colWidth*i + colWidth/2, 0, r*knotDepth)*(1-t))*cos(angle*t+initialAngle*(1-t)), (100+colWidth*y2Index+ colWidth/2), (knotDepth*(t)+dist(width/2.0, 0, 0, 100 + colWidth*i + colWidth/2, 0, r*knotDepth)*(1-t))*sin(angle*t+initialAngle*(1-t)));

    //coming out of screen
    sline(width/2.0 + (knotDepth*t+dist(width/2.0, 0, 0, 100 + colWidth*i + colWidth/2, 0, r*knotDepth)*(1-t))*cos(angle*t+initialAngle*(1-t)), (100+colWidth*y1Index+ colWidth/2+1), (knotDepth*(t)+dist(width/2.0, 0, 0, 100 + colWidth*i + colWidth/2, 0, r*knotDepth)*(1-t))*sin(angle*t+initialAngle*(1-t)), (width/2.0)*s+(100 + colWidth*i + colWidth/2)*(1-s), (100+colWidth*y1Index+ colWidth/2), 0);
    sline(width/2.0 + (knotDepth*t+dist(width/2.0, 0, 0, 100 + colWidth*i + colWidth/2, 0, r*knotDepth)*(1-t))*cos(angle*t+initialAngle*(1-t)), (100+colWidth*y2Index+ colWidth/2+1), (knotDepth*(t)+dist(width/2.0, 0, 0, 100 + colWidth*i + colWidth/2, 0, r*knotDepth)*(1-t))*sin(angle*t+initialAngle*(1-t)), (width/2.0)*s+(100 + colWidth*i + colWidth/2)*(1-s), (100+colWidth*y2Index+ colWidth/2), 0);

    if (drawPages) {

      fill(255, 255, 255, 100);
      beginShape();
      vertex(width/2.0, 100, 0);
      vertex(width/2.0 + 2*knotDepth*cos(angle), 100, 2*knotDepth*sin(angle));
      vertex(width/2.0 + 2*knotDepth*cos(angle), height-100, 2*knotDepth*sin(angle));
      vertex(width/2.0, height-100, 0);
      vertex(width/2.0, 100, 0);
      endShape();
    }
  } 

  ////
  // Drawing Horizontal Lines

  int x1Index = 0;
  int x2Index = 0;

  for (int i = 0;i < gridSize; i++) {
    for (int j = 0;j < gridSize; j++) {
      if (xoArray[j][i] == 0) {
        x1Index = j;
      }
      if (xoArray[j][i] == 1) {
        x2Index = j;
      }
    } 
    sline((100+colWidth*x1Index+ colWidth/2)*(1-s)+width/2*s, (100+colWidth*i+colWidth/2), 0, (100+colWidth*x2Index+colWidth/2)*(1-s)+width/2*s, (100 + colWidth*i+colWidth/2), 0);
  } 
  return;
}















void colorKnot() {

  rowColors = new int[gridSize];
  colColors = new int[gridSize];
  int colors = 0;

  for (int i = 0; i< gridSize; i++) {
    rowColors[i] = 1000;
    colColors[i] = 1000;
  }

  int y1Index = 0;
  int y2Index = 0;

  for (int i = 0;i < gridSize; i++) {
    for (int j = 0;j < gridSize; j++) {
      if (xoArray[i][j] == 0) {
        y1Index = j;
      }
      if (xoArray[i][j] == 1) {
        y2Index = j;
      }
    }

    ////
    // ith row has same component as y1Index and y2Index column
    if (rowColors[i] == 1000 && colColors[y1Index] == 1000 && colColors[y2Index] == 1000) {
      // This component is not colored yet 
      colors++;
      rowColors[i] = colors; 
      colColors[y1Index] = colors; 
      colColors[y2Index] = colors;
    }
    else {
      // This component does have a color
      int newColor = min(rowColors[i], colColors[y1Index], colColors[y2Index]);

      if (rowColors[i] == 1000) {
        rowColors[i] = newColor;
      }
      else {
        int oldColor = rowColors[i];

        for (int k = 0; k < gridSize; k++) {
          if (rowColors[k] == oldColor) {
            rowColors[k] = newColor;
          }
          if (colColors[k] == oldColor) {
            colColors[k] = newColor;
          }
        }
      }

      if (colColors[y1Index] == 1000) {
        colColors[y1Index] = newColor;
      }
      else {
        int oldColor = colColors[y1Index];

        for (int k = 0; k < gridSize; k++) {
          if (rowColors[k] == oldColor) {
            rowColors[k] = newColor;
          }
          if (colColors[k] == oldColor) {
            colColors[k] = newColor;
          }
        }
      }

      if (colColors[y2Index] == 1000) {
        colColors[y2Index] = newColor;
      }
      else {
        int oldColor = colColors[y2Index];

        for (int k = 0; k < gridSize; k++) {
          if (rowColors[k] == oldColor) {
            rowColors[k] = newColor;
          }
          if (colColors[k] == oldColor) {
            colColors[k] = newColor;
          }
        }
      }
    }
  }

  colors = 0;

  for (int j = 1; j < gridSize; j++) {
    for (int i = 0; i < gridSize; i++) {
      if (colColors[i] == j || rowColors[i] == j) {
        colors++;
        i = gridSize;
      }
    }
  }

  fill(0, 0, 0);
  // text("There are " + colors + " components.", 5, 5, 400, 50);
}



void initializeColors() {

  colorsArr = new int[10][3];

  // red
  colorsArr[0][0] = 240;
  colorsArr[0][1] = 0;
  colorsArr[0][2] = 0;


  // green
  colorsArr[1][0] = 0;
  colorsArr[1][1] = 139;
  colorsArr[1][2] = 0;

  // blue
  colorsArr[2][0] = 0;
  colorsArr[2][1] = 0;
  colorsArr[2][2] = 240;

  // yellow
  colorsArr[3][0] = 240;
  colorsArr[3][1] = 240;
  colorsArr[3][2] = 0;

  // purple
  colorsArr[4][0] = 155;
  colorsArr[4][1] = 48;
  colorsArr[4][2] = 255;

  // pink
  colorsArr[5][0] = 255;
  colorsArr[5][1] = 192;
  colorsArr[5][2] = 203;

  // brown
  colorsArr[6][0] = 165;
  colorsArr[6][1] = 42;
  colorsArr[6][2] = 42;

  // orange
  colorsArr[7][0] = 255;
  colorsArr[7][1] = 128;
  colorsArr[7][2] = 0;

  // chartreuse
  colorsArr[9][0] = 113;
  colorsArr[9][1] = 198;
  colorsArr[9][2] = 113;

  // grey
  colorsArr[8][0] = 85;
  colorsArr[8][1] = 85;
  colorsArr[8][2] = 85;

  return;
}

