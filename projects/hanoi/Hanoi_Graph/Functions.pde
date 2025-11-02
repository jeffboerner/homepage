///////////////////
// This function resets the graph and all the variables

///////////////////
////// Increments the vertex

int[] addOne(int[] previousVertex) {

  int ct = disk_num-1;

  previousVertex[disk_num-1]++;

  while (previousVertex[ct] >= peg_num && ct != 0) {

    previousVertex[ct] = 0;
    previousVertex[ct-1]++;
    ct--;
  }
  return previousVertex;
}

void initialize() {

  d_pos = new int[disk_num];
  d_live = new boolean[disk_num];
  // Initialize positions
  int ct = 0;
  while (ct < disk_num) {
    d_pos[ct] = 0;
    d_live[ct] = false;
    ct++;
  }

  drawCt = 0;

  //println("Initialzing canvas and variables....\n");

  background(250, 250, 250);

  edge_count = 0;

  int matrix_size = 0;
  boolean matrixDone = false;

  int[] tempVertex = new int[disk_num];

  ct = 0;

  while (ct < disk_num) {
    tempVertex[ct] = 0;
    ct++;
  }

  ct = 0;

  tempVertex = addOne(tempVertex);
  matrix_size++;


  matrix_size = int(pow(peg_num, disk_num));

  vertexNum = matrix_size;

  vertices = new int[vertexNum][disk_num];

  adjustmentArray = new int[vertexNum][2];
  adjustmentLive = new boolean[vertexNum];
  verticesLiveCt = 0;

  ct = 0;

  while (ct < vertexNum) {
    adjustmentArray[ct][0] = 0;
    adjustmentArray[ct][1] = 0;
    adjustmentLive[ct] = false;
    ct++;
  }

  ct = 0;

  while (ct < disk_num) {
    tempVertex[ct] = 0;
    ct++;
  }

  ct = 0;

  while (ct < vertexNum) {

    arrayCopy(tempVertex, vertices[ct]);

    tempVertex = addOne(tempVertex);
    ct++;
  }


  calcMinPath();

  String outputString = "Disks: " + str(disk_num) + " Pegs: " + str(peg_num) + "\n";
  outputString = outputString + "Edges: " + str(edge_count);

  text(outputString, 25-translateAmount, 25-translateAmount);

  text("Solution takes "+ str(vertDistances[vertexNum-1]) + " steps", translateAmount-250, -translateAmount+50);
  // println("Solution takes "+ str(vertDistances[vertexNum-1]) + " steps");

  //println("Done initializing.\n");

  //println("Calculating minimum path....\n");


  showPath();
  drawDisks();
  drawGraph();

  return;
}











////////////////
///// returns x-y coordinates for corresponding vertex

int[] coordinates(int[] vert) {

  int[] xyCoord = new int[2]; 

  xyCoord[0] = 0;
  xyCoord[1] = 0;
  int ct = 0;
  int currentNode = 0;

  float rotationAngle = HALF_PI; // Current angle of rotation

  while (ct < disk_num) {

    int remainder = ct - 2*floor(ct/2); // Hacky remainder function

    int sign = (remainder*2 - 1); // Finding parity of ct

    rotationAngle = sign*(vert[ct] - currentNode)*2*PI/peg_num + rotationAngle;

    xyCoord[0] = xyCoord[0] + int(cos(rotationAngle)*scale_factor*pow(2, disk_num)/pow(2, ct));
    xyCoord[1] = xyCoord[1] -int(sin(rotationAngle)*scale_factor*pow(2, disk_num)/pow(2, ct));  

    currentNode = vert[ct];

    ct++;
  } 
  return xyCoord;
}
























/////////////
//// Function that builds incident matrix and draws graph
//  This function should only be called by initialize()!

void buildiMatrix() {

  // println("building incidence matrix...\n");

  int ct = 0;
  int ct2 = 0;

  while (ct < vertexNum) {

    if (!cyclic) {
      ct2 = ct;
    }
    else {
      ct2 = 0;
    }

    while (ct2 < vertexNum) {
      //    iMatrix[ct][ct2] = incidentCheck(ct, ct2);
      incidentCheck(ct, ct2);
      if (!cyclic) {
        //      iMatrix[ct2][ct] = iMatrix[ct][ct2]; // since matrix is symmetric if not cyclic Hanoi, let's save time!
      }  
      ct2++;
    } 
    ct++;
  }

  // println("Done building matrix.\n");
}

















//////////////////
/////////////
////// prints vertex label of label with index vertexIndex near that vertex
void printVertexLabel(int vertexIndex) {

  String outputString = "";
  int ct = 0;

  while (ct < disk_num) {
    outputString = outputString + str(vertices[vertexIndex][ct]); 
    ct++;
  }

  translate(750,250);
  
  fill(255,255,255);
  noStroke();
  ellipse(coordinates(vertices[vertexIndex])[0]+adjustmentArray[vertexIndex][0]-4, coordinates(vertices[vertexIndex])[1]+adjustmentArray[vertexIndex][1]-9,50,15);
  stroke(0);
  
  fill(255, 0, 0);
  text(outputString, coordinates(vertices[vertexIndex])[0]+adjustmentArray[vertexIndex][0] - 15, coordinates(vertices[vertexIndex])[1]+adjustmentArray[vertexIndex][1] - 3);
  fill(0, 0, 0);
  translate(-750,-250);
  return;
}


//prints vertex distance of label with index vertexIndex near that vertex
void printVertexDist(int vertexIndex) {

  String outputString = str(vertDistances[vertexIndex]);
  translate(750,250);
  text(outputString, coordinates(vertices[vertexIndex])[0]+adjustmentArray[vertexIndex][0]+5, coordinates(vertices[vertexIndex])[1]+adjustmentArray[vertexIndex][1] - 2);
  translate(-750,-250);
  return;
}








boolean diskCheck(int disk, int peg) {

  int ct = disk_num - 1;

  while (ct > disk) {

    if (d_pos[ct] == peg) {
      return false;
    }
    ct--;
  }

  // move_count++;   // increments move counter (if you check you always move if you can)
  return true;
}










void mouseReleased() {

  int XCoord = mouseX;
  XCoord = XCoord - int(0.5*pegDistance);
  int p_num = floor(XCoord/float(pegDistance));

  int ct = 0;

  while (ct < disk_num) {

    if (d_live[ct]) {
      d_live[ct] = false;

      if (p_num < 0 || p_num >= peg_num) {
        // Disk was dragged to an invalid peg
        // println("Invalid peg placement");
        return;
      }

      if (diskCheck(ct, p_num)) {
        d_pos[ct] = p_num;
      }
      else {
        // println("can't put disk there");
      }
    }
    ct++;
  }

  drawGraph();
}















void mouseClicked() {

  /// Detect peg clicked
  int XCoord = mouseX;
  XCoord = XCoord - int(0.5*pegDistance);
  int p_num = floor(XCoord/float(pegDistance));



  if (p_num == 0 || !straightLine) {
    return;
  }

  print("Peg " + str(p_num) + "selected\n");

  int ct = 0;

  //Check if that peg has a disk
  while (ct < disk_num) {

    //Checking smaller disks first, because they would be on top
    if (d_pos[disk_num-1-ct] == p_num) {

      Boolean move = true;

      //Check if can move disk to the next peg
      int ct2 = 0;
      while (ct2 < ct) {
        if (d_pos[disk_num-1-ct2] == p_num+1) {
          move = false; // A smaller disk is already there
        }
        ct2++;
      }

      if (diskCheck(disk_num-1-ct, 0)) {  
        // Disk can be moved
        d_pos[disk_num-1-ct] = 0;
      }

      ct = disk_num;
    }

    ct++;
  }
}









void mousePressed() {

  pegDistance = max(round(800/(peg_num+1)), 100);  

  int XCoord = mouseX;
  XCoord = XCoord - int(0.5*pegDistance);
  int p_num = floor(XCoord/float(pegDistance));

  // println("p_num = " + str(p_num));

  if (p_num != 0 && straightLine) {
    return;
  }

  int ct = 0;

  while (ct < disk_num) {

    if (d_pos[disk_num-1-ct] == p_num) {
      d_live[disk_num-1-ct] = true;
      ct = disk_num;
    }

    ct++;
  }

  drawGraph();
}







