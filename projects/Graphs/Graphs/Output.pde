void printVertices() {

  println("Graph info:");
  println();
  println();
  println("verticesX = new int[" + str(verticesX.length) + "];");
  println("verticesY = new int[" + str(verticesY.length) + "];");
  println();
  println();

  int ct = 0;
  while (ct < verticesX.length) {
    println("verticesX[" + str(ct) +  "] = " + str(verticesX[ct]) +";");
    ct++;
  }
  println();
  println();
  ct = 0;
  while (ct < verticesY.length) {
    println("verticesY[" + str(ct) +  "] = " + str(verticesY[ct]) +";");
    ct++;
  }
  println();
  println();
  printiMatrix();
}



//////////////////////////////////////////////
//////////////////////////////////////////////

void printiMatrix() {
  int ct = 0;
  int ct2 = 0;
  while (ct < verticesX.length) {
    ct2 = 0;
    while (ct2 < verticesX.length) {
      println("iMatrix[" + str(ct) +  "][" + str(ct2) +  "] = "  + str(iMatrix[ct][ct2]) +";");
      ct2++;
    }
    ct++;
  }
}





//////////////////////////////////////////////
//////////////////////////////////////////////

//////////////////////////////////////////////
//////////////////////////////////////////////

void saveGraph() {
  size(500, 500);
  background(255, 255, 255);
  drawGraph();
  saveFrame("graph.png");
  size(700, 650);
  background(255, 255, 255);
  drawMenu();
  drawGraph();
  changeMode(mode);
}






