
void initTrees() {

  ////
  // Weights are only changed if we didn't just drag vertices or if we were already finding trees
  if (prevMode != 2 && prevMode != 5) {
    setWeights();
  }

  foundEdge = new boolean[100][100];

  int ct = 0;
  int ct2 = 0;

  while (ct < verticesX.length) {
    ct2 = 0;
    while (ct2 < verticesX.length) {
      foundEdge[ct][ct2] = false;
      ct2++;
    }
    ct++;
  }
  edgeCt = 0;
  placeWeights();
  return;
}







//////////////////////////////////////////////
//////////////////////////////////////////////

void treesClicked() {

  int ct = 0;
  int newIndex = vertexClicked(mouseX, mouseY);

  if (newIndex == -1) {
    // No vertex selected
    return;
  }

  if (!edgeSelected) {
    // This is first vertex of edge, color it yellow
    stroke(255, 255, 0);
    fill(255, 255, 0);
    strokeWeight(0);
    ellipse(verticesX[newIndex], verticesY[newIndex], 10, 10);
    edgeSelected = true;
    selectedIndex = newIndex;
    return;
  }
  else {

    if (newIndex == selectedIndex) {
      // This is the same vertex
      return;
    }

    if (iMatrix[newIndex][selectedIndex]) {

      //edge has either been selected or deselected
      foundEdge[newIndex][selectedIndex] = !foundEdge[newIndex][selectedIndex];
      foundEdge[selectedIndex][newIndex] = !foundEdge[selectedIndex][newIndex];

      fill(0, 0, 0);
      stroke(0, 0, 0);
      strokeWeight(0);
      ellipse(verticesX[newIndex], verticesY[newIndex], 10, 10);
      ellipse(verticesX[selectedIndex], verticesY[selectedIndex], 10, 10);

      if (foundEdge[newIndex][selectedIndex]) {
        // It is now selected, color it red
        fill(255, 0, 0);
        stroke(255, 0, 0);
      }
      else {
        // It is now deselected, color it black
        fill(0, 0, 0);
        stroke(0, 0, 0);
      }

      strokeWeight(3);
      line(verticesX[newIndex], verticesY[newIndex], verticesX[selectedIndex], verticesY[selectedIndex]);

      updateTree(); // Make sure all vertices that are incident to an included edge are colored red

      int midPointX = round(float(verticesX[newIndex] + verticesX[selectedIndex])/2.0);
      int midPointY = round(float(verticesY[newIndex] + verticesY[selectedIndex])/2.0);

if(!noWeights){
      ////
      // Creates a small rectangle to cover part of the edge
      noStroke();
      fill(255, 255, 255);
      rect(midPointX-15, midPointY-15, 50, 50);

      fill(0, 0, 0);

      font = loadFont("AlBayan-Bold-13.vlw"); 
      textFont(font,weightFontSize);
      textAlign(CENTER, CENTER);
      
      text(str(weights[min(newIndex, selectedIndex)][max(newIndex, selectedIndex)]), midPointX-15, midPointY-15, 50, 50);
      }

      printMessage("Total weight: " + str(sumWeights()));
      edgeSelected = false;
    }
  }
  return;
}






//////////////////////////////////////////////
//////////////////////////////////////////////
int sumWeights() {
  int sum = 0;

  int ct= 0;
  int ct2 = 0;

  while (ct < verticesX.length) {
    ct2 = ct + 1;
    while (ct2 < verticesX.length) {
      if (foundEdge[ct][ct2]) {
        sum = sum + weights[ct][ct2];
      }
      ct2++;
    }
    ct++;
  }

  return sum;
}





//////////////////////////////////////////////
//////////////////////////////////////////////
void updateTree() {

  int ct= 0;
  int ct2 = 0;

  while (ct < verticesX.length) {
    ct2 = 0;
    while (ct2 < verticesX.length) {

      if (foundEdge[ct][ct2]) {
        fill(255, 0, 0);
        stroke(255, 0, 0);
        strokeWeight(0);
        ellipse(verticesX[ct], verticesY[ct], 10, 10);
        ellipse(verticesX[ct2], verticesY[ct2], 10, 10);
      }
      else {
      }
      ct2++;
    }
    ct++;
  }
  return;
}






//////////////////////////////////////////////
//////////////////////////////////////////////

void setWeights() {

  int ct = 0;
  int ct2 = 0;

  weights = new int[100][100];

  while (ct < verticesX.length) {
    ct2 = 0;
    while (ct2 < verticesX.length) {
      weights[ct][ct2] = round(random(.5, 59));
      ct2++;
    }
    ct++;
  }

  return;
}

//////////////////////////////////////////////
//////////////////////////////////////////////
void placeWeights() {

  if(noWeights){
    return;
  }
  
  font = loadFont("AlBayan-Bold-13.vlw"); 
  textFont(font,weightFontSize); 
  textAlign(CENTER, CENTER);

  int ct = 0;
  int ct2 = 0;

  while (ct < verticesX.length) {
    ct2 = ct+1;
    while (ct2 < verticesX.length) {

      if (iMatrix[ct][ct2]) {

        int midPointX = round((verticesX[ct] + verticesX[ct2])/2.0);
        int midPointY = round((verticesY[ct] + verticesY[ct2])/2.0);

        noStroke();
        fill(255, 255, 255);
        rect(midPointX-15, midPointY-15, 30, 30);

        fill(0, 0, 0);
        //font = loadFont("Geneva-48.vlw");
        //textFont(font,weightFontSize);
        text(str(weights[ct][ct2]), min(verticesX[ct], verticesX[ct2])-25, min(verticesY[ct], verticesY[ct2])-25, abs(verticesX[ct]-verticesX[ct2])+50, abs(verticesY[ct]-verticesY[ct2])+50);
        stroke(0, 0, 0);
      }

      ct2++;
    }
    ct++;
  }
}










////////////////////////////////
////////////////////////////////

int[] addNeighbors(int vtx, int[] attached) {

  for (int j = 0; j < treeCheck[0].length; j++) {
    if (tempTreeCheck[vtx][j]) {// && !arrayContains(j, attached)) {
      //if(arrayContains(j,attached)){
      // attached = append(attached,vtx); // we arrived at something two ways, so the vertex is attached to itself
      //}
      attached = append(attached, j);
      tempTreeCheck[vtx][j] = false;
      tempTreeCheck[j][vtx] = false;
    }
  }
  return attached;
}

boolean circuitCreated() {

  for (int i = 0; i < 10; i++) {

    tempTreeCheck = new boolean[100][100];

    for (int m = 0; m < treeCheck[0].length; m++) {
      for (int n = 0; n < treeCheck[0].length; n++) {
        tempTreeCheck[m][n] = treeCheck[m][n];
        tempTreeCheck[n][m] = treeCheck[n][m];
      }
    }

    int[] attached = new int[0];
    attached = addNeighbors(i, attached);

    for (int j = 0; j < attached.length; j++) {
      attached = addNeighbors(attached[j], attached);
    }

    println();
    println(i + " has neighbors as below");
    println(attached);


    // if (arrayContains(i, attached)) {
    if (occursTwice(attached)) { 
      return true;
    }
  }

  return false;
}



boolean occursTwice(int[] arrayToCheck) {

  for (int i = 0; i < arrayToCheck.length; i++) {
    ///// check if arrayToCheck[i] occurs again in the array
    for (int j = i + 1; j < arrayToCheck.length; j++) {
      if (arrayToCheck[i] == arrayToCheck[j]) {
        return true;
      }
    }
  } 

  return false;
}


boolean arrayContains(int element, int[] arrayToCheck) {

  for (int i = 0; i < arrayToCheck.length; i++) {
    if (arrayToCheck[i] == element) {
      return true;
    }
  } 
  return false;
}


boolean minSpanTreeCheck() {

  int edgesAdded = 0;

  boolean[][] weightUsed = new boolean[100][100];

  treeCheck = new boolean[100][100];
  int[] treeWeights = new int[0];

  for (int i = 0; i < weights.length; i++) {
    treeCheck[i][i] = false;
    for (int j = i+1; j < weights.length; j++) {
      if (weights[i][j] != 0) {
        treeWeights = append(treeWeights, weights[i][j]);
      }
      weightUsed[i][j] = false;
      weightUsed[j][i] = false;
      treeCheck[i][j] = false;
      treeCheck[j][i] = false;
    }
  }

  treeWeights = sort(treeWeights);//carefulSort(treeWeights);
  println(treeWeights);

  int currentIndex = 0;

  while (edgesAdded < verticesX.length -1 && currentIndex < treeWeights.length) {
    int nextI = -1;
    int nextJ = -1;

    for (int i = 0; i < weights.length; i++) {
      for (int j = i+1; j < weights.length; j++) {
        if (weights[i][j] ==  treeWeights[currentIndex] && !weightUsed[i][j]) {
          nextI = i;
          nextJ = j;
          weightUsed[i][j] = true;
          i = weights.length;
          j = weights.length;
        }
      }
    }

    currentIndex++;

    treeCheck[nextI][nextJ] = true;
    treeCheck[nextJ][nextI] = true;

    if (circuitCreated()) {
      // circuit was created
      treeCheck[nextI][nextJ] = false;
      treeCheck[nextJ][nextI] = false;
      println("Edge rejected, circuit formed");
    }
    else {
      // keep this edge in the tree
      println("Edge added");
      edgesAdded++;
    }
  }

  println("Minimum tree discovered");

  //////
  /// Create minimum spanning tree in treeCheck

  for (int i = 0; i < verticesX.length; i++) {
    for (int j = i+1; j < verticesX.length; j++) {
      if (treeCheck[i][j]) {
        stroke(0, 0, 255);
        line(verticesX[i], verticesY[i], verticesX[j], verticesY[j]);
      }
    }
  }
  //updateTree();

  /////
  /// compare to users selections

  println("Done");

  return true;
}


int[] carefulSort(int[] arrayToSort) {
  ////// performs a bubble sort on the array, keeping redundant entries 

  boolean swap = true;

  while (swap) {
    swap = false;
    for (int i = 0; i < arrayToSort.length - 1; i++) {

      if (arrayToSort[i] > arrayToSort[i+1]) {
        swap = true;

        int numHolder = arrayToSort[i];
        arrayToSort[i] = arrayToSort[i+1];
        arrayToSort[i+1] = numHolder;
      }
    }
  }
  return arrayToSort;
}

