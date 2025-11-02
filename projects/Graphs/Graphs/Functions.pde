

void changeMode(int newMode) {

  // These variables are reset whenever the mode is changed
  edgeSelected = false;
  selectedIndex = -1;
  eulerize = false;

  prevMode = mode;

  printMessage("");

  if (mode == 8) {
    drawMenu();
  }


  switch(newMode) {
  case 0:
    // Place Vertices
    mode = 0;
    drawGraph();
    changeLabel("Place Vertices");
    break;

  case 1:
    // Place Edges
    mode = 1;
    drawGraph();
    changeLabel("Place Edges");
    break;

  case 2:
    // Drag Vertices
    mode = 2;
    drawGraph();
    changeLabel("Drag Vertices");

    if (prevMode == 5) {
      placeWeights();
    }
    break;

  case 3:
    // Delete Vertices
    mode = 3;
    drawGraph();
    changeLabel("Delete Vertices");
    break;

  case 4:
    // Find Euler circuit
    mode = 4;
    initEulerCircuit();
    if(prevMode != 6){
    drawGraph();
    }
    changeLabel("Find Euler Circuit");
    break;

  case 5:
    // select Trees
    mode = 5;
    drawGraph();
    initTrees();
    changeLabel("Select Edges");
    break;

  case 6:
    //Eulerize
    mode = 6;
    drawGraph();
    initEulerize();
    changeLabel("Eulerize graph");
    break;

  case 7:
    // Hamiltonian
    mode = 7;
    drawGraph();
    initHamiltonian();
    changeLabel("Find Hamiltonian");
    break;

  case 8:
    // Coloring
    mode = 8;
    drawGraph();
    initColoring();
    changeLabel("Color the vertices");
    break;
  }
  return;
}







//////////////////////////////////////////////
//////////////////////////////////////////////


void drawMenu() {
  noStroke();
  fill(255, 255, 255);
  rect(500, 0, 200, height);
  rect(0, 500, width, height-500);

  stroke(0, 0, 0);
  strokeWeight(3);

  fill(0, 0, 0);
  PFont font;
  font = loadFont("AlBayan-Bold-15.vlw"); 
  textFont(font); 
  textAlign(CENTER, CENTER);



  ////////
  // Vertical Menu right of screen

  line(500, 0, 500, 500);
  line(600, 0, 600, 500);
  text("Figure 1.2", 500, 0, 100, 50);
  line(500, 50, 700, 50);
  text("Figure 1.8", 500, 50, 100, 50);
  line(500, 100, 700, 100);
  text("Figure 1.13", 500, 100, 100, 50);
  line(500, 150, 700, 150);
  text("Figure 1.9", 500, 150, 100, 50);
  line(500, 200, 700, 200);
  text("Figure 1.11", 500, 200, 100, 50);
  line(500, 250, 700, 250);
  text("Figure 1.17", 500, 250, 100, 50);
  line(500, 300, 700, 300);
  text("Figure 1.18", 500, 300, 100, 50);
  line(500, 350, 700, 350);

  fill(0, 0, 0);
  text("Complete-" + str(completeNum), 500, 350, 100, 50);
  line(500, 400, 700, 400);
  text("+ Vertices", 500, 400, 100, 50);
  line(500, 450, 700, 450);
  text("- Vertices", 500, 450, 100, 50);
  line(500, 500, 700, 500);

  text("Example 1", 600, 0, 100, 50);
  text("Example 2", 600, 50, 100, 50);
  text("Example 3", 600, 100, 100, 50);
  text("Handout 1", 600, 150, 100, 50);
  text("Handout 2", 600, 200, 100, 50);
  text("Handout 3", 600, 250, 100, 50);
  text("Handout 4", 600, 300, 100, 50);
  text("Example 4", 600, 350, 100, 50);
  text("Example 5", 600, 400, 100, 50);
  if(savedGraph){
    text("Recall Graph", 600, 450, 100, 50);
  }
  else{
    text("Store Graph", 600, 450, 100, 50);
  }



  ////////
  // Horizontal Menu at bottom of screen
  
  font = loadFont("AlBayan-Bold-13.vlw"); 
  textFont(font);
  line(0, 500, 500, 500);
  text("Clear Graph", 0, 500, 100, 50);
  line(100, 500, 100, 650);
  font = loadFont("AlBayan-Bold-13.vlw"); 
  textFont(font);
  text("Snap Graph", 100, 500, 100, 50);
  line(200, 500, 200, 650);
  font = loadFont("AlBayan-Bold-13.vlw"); 
  textFont(font);
  text("Place Vertices", 200, 500, 100, 50);
  line(300, 500, 300, 650);
//  font = loadFont("AlBayan-Bold-15.vlw"); 
  textFont(font);
  text("Place Edges", 300, 500, 100, 50);
  line(400, 500, 400, 650);
  font = loadFont("AlBayan-Bold-13.vlw"); 
  textFont(font);
  text("Drag Vertices", 400, 500, 100, 50);
  line(500, 500, 500, 650);



  line(0, 550, 500, 550);
  text("Euler Circuits", 0, 550, 100, 50);
  font = loadFont("AlBayan-Bold-13.vlw"); 
  textFont(font);
  text("Weighted Graphs", 100, 550, 100, 50);
  font = loadFont("AlBayan-Bold-13.vlw"); 
  textFont(font);
  text("Eulerize", 200, 550, 100, 50);
//  font = loadFont("AlBayan-Bold-15.vlw"); 
  textFont(font);
  text("Hamiltonian", 300, 550, 100, 50);
  font = loadFont("AlBayan-Bold-13.vlw"); 
  textFont(font);
  text("Delete Vertices", 400, 550, 100, 50);



  line(0, 600, 500, 600);
  text("Color Vertices", 0, 600, 100, 50);
  font = loadFont("AlBayan-Bold-13.vlw"); 
  textFont(font);
  text("Random Weights", 100, 600, 100, 50);
  font = loadFont("AlBayan-Bold-13.vlw"); 
  textFont(font);
  text("Weights 1", 200, 600, 100, 50);
//  font = loadFont("AlBayan-Bold-15.vlw"); 
  textFont(font);
  text("Weights 2", 300, 600, 100, 50);
  font = loadFont("AlBayan-Bold-13.vlw"); 
  textFont(font);
  text("Weights 3", 400, 600, 100, 50);
}







//////////////////////////////////////////////
//////////////////////////////////////////////


void menuTouched(int option, int option2) {

  if (option2 == 0) {
    ////// 1st row of menu touched

    switch(option) {

      case(0):
      reset();
      break;

      case(1):
      snapGraph();
      break;

      case(2):
      // place vertices
      changeMode(0);
      break;

      case(3):
      // place edges
      changeMode(1);
      break;

      case(4):
      // Drag Vertices
      changeMode(2);
      break;
    }
  }


  if (option2 == 1) {
    ////// 2nd row of menu touched

    switch(option) {

      case(0):
      changeMode(4);
      break;

      case(1):
      changeMode(5);
      break;

      case(2):
      changeMode(6);
      break;

      case(3):
      changeMode(7);
      break;

      case(4):
      // Delete Vertices
      changeMode(3);
      break;
    }
  }

  if (option2 == 2) {

    switch(option) {

      case(0):
      // Color Vertices
      changeMode(8);
      break;

      case(1):
      // change weights
      if(mode == 5){
      setWeights();
      placeWeights();
      }
      break;
      
      case(2):
      //Stored Weights 1
      setStoredWeights(1);
      break;
      
      case(3):
      //Stored Weights 2
      setStoredWeights(2);
      break;
      
      case(4):
      //Stored Weights 3
      setStoredWeights(3);
      break;
    }
  }

  return;
}








//////////////////////////////////////////////
//////////////////////////////////////////////

void changeLabel(String str) {
  noStroke();
  fill(255, 255, 255);
  rect(0, 5, 500, 50);
  fill(0, 0, 0);
  PFont font;
  font = loadFont("AlBayan-Bold-20.vlw"); 
  textFont(font); 
  textAlign(CENTER, TOP);
  text(str, 0, 5, 500, 50);
  return;
}









//////////////////////////////////////////////
//////////////////////////////////////////////

void graphClicked() {

  int ct = 0;

  int newIndex;

  switch(mode) {

  case 0:
    /// placing vertices
    fill(0, 0, 0);
    strokeWeight(0);

    ct = 0;

    //////
    // Check to see if too close to another vertex

    while (ct < verticesX.length) {
      if (dist(mouseX, mouseY, verticesX[ct], verticesY[ct]) <= 20) {
        return;
      }
      ct++;
    }

    ellipse(mouseX, mouseY, 10, 10); 
    verticesX = append(verticesX, mouseX);
    verticesY = append(verticesY, mouseY);
    break;

  case 1:
    /// placing edges
    ct = 0;

    newIndex = vertexClicked(mouseX, mouseY);

    ////
    // newIndex will equal -1 if no vertex is selected
    if (newIndex == -1) {
      return;
    }

    if (!edgeSelected) {
      // color selected vertex red
      stroke(255, 0, 0);
      fill(255, 0, 0);
      strokeWeight(0);
      ellipse(verticesX[newIndex], verticesY[newIndex], 10, 10);
      edgeSelected = true;
      selectedIndex = newIndex;
      return;
    }
    else {
      // If newIndex is the same as the previous index we don't want to create a new edge 
      if (newIndex == selectedIndex) {
        return;
      }

      fill(0, 0, 0);
      stroke(0, 0, 0);
      strokeWeight(0);
      ellipse(verticesX[selectedIndex], verticesY[selectedIndex], 10, 10);
      strokeWeight(3);
      edgeCt++;
      line(verticesX[newIndex], verticesY[newIndex], verticesX[selectedIndex], verticesY[selectedIndex]);

      //Edge has been selected to be incident, adjust iMatrix;
      iMatrix[newIndex][selectedIndex] = true;
      iMatrix[selectedIndex][newIndex] = true;
      edgeSelected = false;
    }
    break;

  case 3:
    // delete a vertex
    deleteVertex(vertexClicked(mouseX, mouseY));

  case 4:
    // find Euler circuit
    eulerCircuitClicked();
    break;

  case 5:
    // Selecting edges
    treesClicked();
    break;

  case 6:
    // Eulerizing graph
    eulerizeClicked();
    break;

  case 7:
    // Hamiltonian circuit
    hamiltonianClicked();
    break;

  case 8:
    //Coloring
    coloringClicked();
    break;
  }
}











//////////////////////////////////////////////
//////////////////////////////////////////////

void initialize() {
  verticesX = new int[0];
  verticesY = new int[0];

  iMatrix = new boolean[100][100];

  int ct = 0;
  int ct2 = 0;

  while (ct < 100) {
    ct2 = 0;
    while (ct2 < 100) {
      iMatrix[ct][ct2] = false;
      ct2++;
    }
    ct++;
  }

  edgeSelected = false;
  vertexSelected = false;

  selectedIndex = -1;
  clickedVertex = -1;

  prevMode = -1;

  ///////////
  /// Euler circuit global variables
  foundEdge = new boolean[100][100];
  /////////////

  //////////
  /// Trees initialization
  setWeights();
  //////
}






//////////////////////////////////////////////
//////////////////////////////////////////////

int vertexClicked(int Xcoord, int Ycoord) {

  int ct = 0;

  while (ct < verticesX.length) {
    if (dist(Xcoord, Ycoord, verticesX[ct], verticesY[ct]) <= 15) {
      // vertex found
      return ct;
    }
    ct++;
  }

  return -1;
}






//////////////////////////////////////////////
//////////////////////////////////////////////

void printMessage(String str) {

  noStroke();
  fill(255, 255, 255);
  rect(500, 500, 200, height-500);

  fill(0, 0, 0);
  font = loadFont("AlBayan-Bold-15.vlw"); 
  textFont(font); 
  textAlign(CENTER, CENTER);
  text(str, 500, 500, 200, height-500);
  return;
}





/////////////////////////////////////////////
/////////////////////////////////////////////

void completeGraph() {

  int vertNum = completeNum; //round(random(1.5, 6.5));

  println("vertNum is " + str(vertNum));

  verticesX = new int[vertNum];
  verticesY = new int[vertNum];

  int ct = 0;
  int ct2 = 0;

  while (ct < vertNum) {

    verticesX[ct] = 250 + round(150.0*(cos(2.0*3.14/float(vertNum)*ct)));
    verticesY[ct] = 250 + round(150.0*(sin(2.0*3.14/float(vertNum)*ct)));

    ct++;
  }

  ct = 0;

  while (ct < verticesX.length) {
    ct2 = ct + 1;

    while (ct2 < verticesX.length) {

      iMatrix[ct][ct2] = true;
      iMatrix[ct2][ct] = true;

      ct2++;
    }

    iMatrix[ct][ct] = false;

    ct++;
  }
  return;
}




///////////////////////////////////
///////////////////////////////////

void storeGraph(){
  
  storedGraph = new boolean[100][100];
  
   for(int i = 0; i < 100; i++) {
    arrayCopy(iMatrix[i], storedGraph[i]);
  }
  
  storedX = new int[verticesX.length];
  storedY = new int[verticesX.length];
  
  arrayCopy(verticesX,storedX);
  arrayCopy(verticesY,storedY);
  
  printMessage("Graph stored");
  savedGraph = true;
 
  return;
}


///////////////////////
///////////////////////

void labelVertices(){
  
 for(int i = 0; i < verticesX.length; i++){ 
  
   String label = "";
   
   switch(i){
     case 0:
     label = "A";
     break;
     case 1:
     label = "B";
     break;
     case 2:
     label = "C";
     break;
     case 3:
     label = "D";
     break;
     case 4:
     label = "E";
     break;
   }
  
  fill(255,255,255);
  noStroke();
  rect(verticesX[i]-25,verticesY[i]+25,25,25);
  fill(0,0,0);
  font = loadFont("AlBayan-Bold-13.vlw"); 
  textFont(font,weightFontSize); 
  text(label,verticesX[i]-25,verticesY[i]+25,50,50);
   
 }
}
