// Package to draw graphs
// Jeffrey Boerner
// 2011

// To Do
// 
// automate menu button naming?
// 
// ablilty save to access saved graphs?

// mark initial vertex with text??

// ability to modify graph while keeping euler circuits, etc, untouched; two different modes needed??

// determine if coloring is optimal....?

// fix band-aid for euler circuit after eulerizing


//// global variables
PFont font;

int[] verticesX;
int[] verticesY;
boolean[][] iMatrix;

boolean edgeSelected;
boolean vertexSelected;

int selectedIndex;       // holds a vertex so it can be accessed globally
int mode;                // holds current mode, check changeMode for which mode is which

int prevMode;            // this is to ensure that Dragging doesn't change weights

int clickedVertex;       // holds the vertex that has just been clicked for dragging

boolean savedGraph = false;  // indicates whether the user stored a graph
boolean[][] storedGraph;
int[] storedX;
int[] storedY;

///////////
/// Euler circuit global variables
boolean[][] foundEdge;
int edgeCt;
int initialVertex;

boolean eulerize;
boolean[][] eulerized;
//////////

////////
/// Spanning tree global variables
int[][] weights;

boolean[][] treeCheck;
boolean[][] tempTreeCheck;

int weightFontSize = 20;

boolean noWeights = false;//true;
////////

////////
/// Hamiltonian global variables
boolean[] foundVertex;

int completeNum;
//////

///////
/// Coloring global variables
int[][] colors;
int currentColor;
int[] vertexColors;
//////

void setup() {
  size(700, 650);

  font = loadFont("AlBayan-Bold-15.vlw"); 
  textFont(font); 
  textAlign(CENTER, CENTER);

  completeNum = 4;

  reset();
  drawMenu();
}




/////
// resets the drawing space and program to the initial conditions

void reset() {
  initialize();
  // Clears the drawing space
  noStroke();
  fill(255, 255, 255);
  rect(0, 0, 500, 500);
  changeMode(0);
  printMessage("");
  return;
}


void drawGraph() {

  // Clears the drawing space
  noStroke();
  fill(255, 255, 255);
  rect(0, 0, 500, 500);

  // draw Vertices
  strokeWeight(0);
  stroke(0, 0, 0);
  fill(0, 0, 0);

  int ct = 0;

  while (ct < verticesX.length) {
    ellipse(verticesX[ct], verticesY[ct], 10, 10);
    ct++;
  }

  // draw edges
  ct = 0;
  int ct2 = 0;

  strokeWeight(3);

  while (ct < verticesX.length) {
    ct2=0;
    while (ct2 < verticesX.length) {
      if (iMatrix[ct][ct2]) {
        line(verticesX[ct], verticesY[ct], verticesX[ct2], verticesY[ct2]);
      }   
      ct2++;
    }
    ct++;
  }
  return;
}







//////////////////////////////////////////////
//////////////////////////////////////////////

void snapGraph() {
  int ct = 0;
  int ct2 = 0;

  while (ct < verticesX.length) {

    ct2 = ct; 

    while (ct2 < verticesX.length) {

      if (abs(verticesX[ct]-verticesX[ct2]) < 20) {
        verticesX[ct2] = verticesX[ct];
      }

      if (abs(verticesY[ct]-verticesY[ct2]) < 20) {
        verticesY[ct2] = verticesY[ct];
      }

      ct2++;
    }
    ct++;
  }
  drawGraph();
  changeMode(mode);
}










//////////////////////////////////////////////
//////////////////////////////////////////////

void deleteVertex(int delVertex) {

  if (delVertex == -1) {
    return;
  }

  if (verticesX.length == 1) {
    reset();
    return;
  }

  int[] tempX = concat(subset(verticesX, 0, delVertex), subset(verticesX, delVertex+1, verticesX.length-delVertex-1));
  int[] tempY = concat(subset(verticesY, 0, delVertex), subset(verticesY, delVertex+1, verticesY.length-delVertex-1));

  verticesX = new int[tempX.length];
  verticesY = new int[tempY.length];

  arrayCopy(tempX, verticesX);
  arrayCopy(tempY, verticesY);

  deleteEdges(delVertex);

  drawGraph();
  changeMode(mode);
  return;
}






///////////////////////////////////////
/////////////////////////////////////

void deleteEdges(int delVertex) {

  int ct = 0;
  int ct2 = 0;

  boolean[][] iMatrixTemp = new boolean[100][100];
  arrayCopy(iMatrix, iMatrixTemp);
  iMatrix = new boolean[100][100];

  while (ct < iMatrixTemp.length-1) {
    ct2 = 0;
    while (ct2 < iMatrixTemp.length-1) {

      int newCt = ct;
      int newCt2 = ct2;

      if (ct >= delVertex) {
        newCt = ct+1;
      }
      if (ct2 >= delVertex) {
        newCt2 = ct2+1;
      }

      iMatrix[ct][ct2] = iMatrixTemp[newCt][newCt2];

      ct2++;
    }
    ct++;
  }

  //Last row needs to be copied  
  arrayCopy(iMatrixTemp[99], iMatrix[99]);


  return;
}


















// We don't draw anything in the program
void draw() {
}

