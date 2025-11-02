/*
Hanoi Graph
 */
 
  int offsetX = 250;
  int offsetY = 250;

boolean animationPaused = false;
boolean showGraph = true;

int pegDistance = 0;

int[] d_pos = new int[0];
boolean[] d_live = new boolean[0];

int disk_num = 0;
int peg_num = 0;
int edge_count = 0;
int scale_factor = 0;

int translateAmount = 0;

int[][] vertices = new int[0][0];

int[][] adjustmentArray = new int[0][0];

boolean adjustmentLive[] = new boolean[0];
int verticesLiveCt = 0;

boolean showVertices = false;
boolean showDistances = false;

int mouseLocation[] = new int[0];

int[] pathArray = new int[0];

int[] vertDistances = new int[0];
boolean[] vertVisited = new boolean[0];
int visitCheck = 0;

boolean straightLine = false;
boolean cyclic = false;
boolean inarow = false;

boolean star = false;

boolean memorySave = false;

int drawCt = 0;

boolean animateSolution = false;
boolean showSolution = true;

int vertexNum = 0;

void solvePuzzle(){}

void setup() {

  size(1000, 500);

  //Initial Values
  memorySave = false;
  disk_num = 3;
  peg_num = 3;

  // Only one of these should be true...
  straightLine = false;
  cyclic = false;
  inarow = false;
  star = false;

  scale_factor = 15;
  edge_count = 0;
  showVertices = false;
  showDistances = false;

  mouseLocation = new int[2];
  mouseLocation[0] = 0;
  mouseLocation[1] = 0;

  vertexNum = 0;

  strokeWeight(2);
  fill(0, 0, 0);

  drawCt = 0;

  animateSolution = false;

  initialize(); //// initializes all variables and draw the graph

  frameRate(5);
  smooth();
}

void draw() {

  background(255,255,255);
  
  if (animateSolution && drawCt < vertDistances[vertexNum-1]+1) {
    drawDisks();
    drawGraph();
    if(!animationPaused){
    drawCt++;
    }
  }
  else {
    animateSolution = false;
    drawDisks();
    drawGraph();
  }

  showPath();

  line(500,0,500,500);
}






/////////////////
// Given two vertices returns true if they share an edge, false if they do not
// Edit this function to change Hanoi type

boolean incidentCheck(int vertexA, int vertexB) {

  int diffCt = 0;
  int diffIndex = 0;

  int ct = 0;

  while (ct < disk_num) {
    if (vertices[vertexA][ct] != vertices[vertexB][ct]) {
      diffCt++;
      diffIndex = ct;
    }
    ct++;
  }

  if (diffCt != 1) {
    // Too many differences, can't be incident (or are same vertex)
    return false;
  }

  ct = diffIndex + 1;

  // This checks to see if a smaller disk in on the peg the larger disk is moving to (or from)
  while (ct < disk_num) {
    if (vertices[vertexA][ct] == vertices[vertexA][diffIndex] || vertices[vertexB][diffIndex] == vertices[vertexA][ct]) {
      return false;
    } 
    ct++;
  }


  // Straightline Hanoi has one additional condition

  if (straightLine) {
    //Straightline Hanoi check
    if (vertices[vertexA][diffIndex] != 0 && vertices[vertexB][diffIndex] != 0) {
      return false;
    }
  }


  //////// In a row Hanoi has one additional condition

  if (inarow) {
    if (abs(vertices[vertexA][diffIndex] - vertices[vertexB][diffIndex]) != 1) {
      return false;
    }
  }



  /////// Cylic hanoi has one additional condition

  if (cyclic) {
    if (vertices[vertexA][diffIndex] + 1 == vertices[vertexB][diffIndex] || (vertices[vertexA][diffIndex] == peg_num-1 && vertices[vertexB][diffIndex] == 0)) {
      // there is a directed edge from A to B
    }
    else {
      return false;
    }
  }

  return true;
}



void zoomOut(){
        if (scale_factor > 5) {
      scale_factor = scale_factor - 5;
    }
    else {
      scale_factor = scale_factor/2;
    }
    drawGraph();
  }

void zoomIn(){
  scale_factor = scale_factor + 5;
    drawGraph();
}



// When a key is pressed this function is called

void keyPressed() {

 // if(key == 'g'){
 //   showGraph = !showGraph;
    
//    if(showGraph){
//      drawGraph();
//    }
//  }
  
  if(key == 'p'){
    animationPaused = !animationPaused;
  }
  
  
  if (key == 'i') { //Zoom in
    scale_factor = scale_factor + 5;
    drawGraph();
  }

  if (key == 'o') { // zoom out
    if (scale_factor > 5) {
      scale_factor = scale_factor - 5;
    }
    else {
      scale_factor = scale_factor/2;
    }
    drawGraph();
  }

  if (key == 'h') {

    int ct = 0;

    while (ct < vertexNum) {
      if (adjustmentLive[ct]) {
        adjustmentArray[ct][0]--;
      }
      ct++;
    }
    drawGraph();
  }

  if (key == 'j') {
    int ct = 0;

    while (ct < vertexNum) {
      if (adjustmentLive[ct]) {
        adjustmentArray[ct][0]++;
      }
      ct++;
    }
    drawGraph();
  }

  if (key == 'u') {
    int ct = 0;

    while (ct < vertexNum) {
      if (adjustmentLive[ct]) {
        adjustmentArray[ct][1]--;
      }
      ct++;
    }
    drawGraph();
  }

  if (key == 'n') {
    int ct = 0;

    while (ct < vertexNum) {
      if (adjustmentLive[ct]) {
        adjustmentArray[ct][1]++;
      }
      ct++;
    }
    drawGraph();
  }


  if (key == 'v') {
    showVertices = !showVertices;
    drawGraph();
  }

  if (key == 'd') {
    showDistances = !showDistances;
    drawGraph();
  }

  if (key == 'w') {
    //showSolution = ;
      showSolution = !showSolution;
    //  if (showSolution) {
    //translate(800, 0);
    showPath();
    // }
  }

  if (key == 's') {
    straightLine = !straightLine;
    initialize();
  }

  if (key == 'c') {
    cyclic = !cyclic;
    initialize();
  }

  // Saves frame to image file
  if (key == 'p') {
    //saveFrame();
  }

  // kills All vertices
  if (key == 'k') {
    verticesLiveCt = 0;
    int ct = 0;
    while (ct < vertexNum) {
      adjustmentLive[ct] = false;
      ct++;
    }
    drawGraph();
  }

 // if (key == 'e') {

   // println("toggle screen");

 //   if (width != 1600) {
 //     setPreferredSize(new Dimension(1600, 800));
 //   }
 //   else {
 //     setPreferredSize(new Dimension(800, 800));
 //   }
 // }

  if (key == 'y') {
    showPath();
  }

  if (key == 'a') {
    solvePuzzle();
    animateSolution = !animateSolution;
    //   pathArray = reverse(pathArray);
    drawCt = 0;
  }

  //print(str(width) + "\n");

  if (key == CODED) {
    if (verticesLiveCt == 0) { // No vertices are live
      if (keyCode == UP) {
        // Increase the number of disks
        disk_num++;
        initialize();
        zoomOut();
      }

      if (keyCode == DOWN) {
        if (disk_num > 1) {
          disk_num--;
          initialize();
          zoomIn();
        }
      }

      if (keyCode == LEFT) {
        if (peg_num > 1) {
          peg_num--;
          initialize();
          
        }
      }

      if (keyCode == RIGHT) {
        peg_num++;
        initialize();
        
      }
    }  
    else { // Some vertices are live

        if (keyCode == LEFT) { 
        int ct = 0;
        while (ct < vertexNum) {
          if (adjustmentLive[ct]) { 
            adjustmentArray[ct][0] = adjustmentArray[ct][0] - 5; // adjustmentArray[ct][0]--;
          }
          ct++;
        }
        drawGraph();
      }

      if (keyCode == RIGHT) {
        int ct = 0;

        while (ct < vertexNum) {
          if (adjustmentLive[ct]) {
            adjustmentArray[ct][0] = adjustmentArray[ct][0] + 5; // adjustmentArray[ct][0]++;
          }
          ct++;
        }
        drawGraph();
      }

      if (keyCode == UP) {
        int ct = 0;

        while (ct < vertexNum) {
          if (adjustmentLive[ct]) {
            adjustmentArray[ct][1] = adjustmentArray[ct][1] - 5; // adjustmentArray[ct][1]--;
          }
          ct++;
        }
        drawGraph();
      }

      if (keyCode == DOWN) {
        int ct = 0;

        while (ct < vertexNum) {
          if (adjustmentLive[ct]) {
            adjustmentArray[ct][1] = adjustmentArray[ct][1] + 5;// adjustmentArray[ct][1]++;
          }
          ct++;
        }
        drawGraph();
      }
    }
  }


  if (keyCode == '2') {

    if (drawCt < vertDistances[vertexNum-1]) {
      drawCt++;
    }

    //drawDisks();
    drawGraph();
    print("drawCt incremented\n");
  }
  if (keyCode == '1') {

    if (drawCt > 0) {
      drawCt--;
    }

   // drawDisks();
    drawGraph();
    print("drawCt decremented\n");
  }
}



/////////////
// minimal solution calculated using Dijkstra's_algorithm

void calcMinPath() {

  //println("Calculating minimum path...");

  vertDistances = new int[vertexNum];
  vertVisited = new boolean[vertexNum];
  int visitCheck;

  int startIndex = 0;

  if (star) {
    int k = 0;

    while (k < disk_num) {

      startIndex = int(pow(peg_num, disk_num-1-k)) + startIndex;

      k++;
    }
  }



  int ct = 0;

  while (ct < vertexNum) {

    vertDistances[ct] = int(pow(peg_num, disk_num)+1);
    vertVisited[ct] = false;

    ct++;
  }

  vertDistances[startIndex] = 0;

  //// Algorithm to choose smallest remaining node

  int minDist;
  int minIndex = 0;
  visitCheck = 0;

  while (visitCheck < vertexNum) {

    ct = 0;
    minDist = int(pow(peg_num, disk_num))+2;

    while (ct < vertexNum) {

      if (!vertVisited[ct] && vertDistances[ct] < minDist) {
        minDist = vertDistances[ct];
        minIndex = ct;
      }

      ct++;
    }

    checkNeighbors(minIndex);
    visitCheck++;
  }

  // println("Minimum path calculated.");
}

////////
/// checkNeighbors updates the distances of all vertices adjacent to current vertex

void checkNeighbors(int vertexIndex) {

  int ct = 0;

  while (ct < vertexNum) {

    if (incidentCheck(vertexIndex, ct)) {
      /// vertices are incident


        if (vertDistances[ct] > vertDistances[vertexIndex] + 1) {
        // new path is shorter

        vertDistances[ct] = vertDistances[vertexIndex] + 1;
      }
    }

    ct++;
  }

  ////
  // current vertex has now been visited
  vertVisited[vertexIndex] = true;
}




// This function builds pathArray, the array that shows the vertices to travel to, to solve the puzzle

void showPath() {

  if(!showSolution){
    return;
  }
  
  int offsetX = 750;
  int offsetY = 250;
  
  int ct = 0;

  //translate(800,0);

  int currDist = vertDistances[vertexNum-1];

  pathArray = new int[1];

  int currIndex = vertexNum-1;

  pathArray[0] = currIndex;

  if (currDist > vertexNum) {
    // println("No path detected!!");
    return;
  }

  while (currDist > 0) {

    ct = 0;

    while (ct < vertexNum) {

      if (incidentCheck(ct, currIndex) && vertDistances[ct] == currDist - 1) {
        /// Productive neighbor (one closer to initial vertex) found

        currDist = vertDistances[ct];

        if (!memorySave && showSolution) {
          stroke(240, 0, 0);
          strokeWeight(5);
          line(coordinates(vertices[ct])[0]+adjustmentArray[ct][0]+offsetX, coordinates(vertices[ct])[1]+adjustmentArray[ct][1]+offsetY, coordinates(vertices[currIndex])[0]+adjustmentArray[currIndex][0]+offsetX, coordinates(vertices[currIndex])[1]+adjustmentArray[currIndex][1]+offsetY);
          stroke(0, 0, 0);
          strokeWeight(2);
        }
        currIndex = ct;
        pathArray = append(pathArray, currIndex);
        ct = vertexNum; //Neighbor found, exit loop
      }

      ct++;
    }
  }

  // pathArray was build backwards, so actual path is reversed
  pathArray = reverse(pathArray);


  ///////
  // Saving pathArray to appropriate text file

  String hanoiType = "";

  if (straightLine) {
    hanoiType = "s";
  }
  if (cyclic) {
    hanoiType = "c";
  }
  if (inarow) {
    hanoiType = "i";
  }

  String filename = "p" + str(peg_num) + "d" + str(disk_num) + hanoiType + ".txt";

  return;
}



