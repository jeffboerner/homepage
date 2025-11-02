void keyPressed() {
  if (key == 'p') {
    // particulars of the graph are printed to the console
    printVertices();
  }

  if (key == 's') {
    // .jpg image of the graph is saved to the folder the application is in
    saveGraph();
  }

  if(key == 'l'){
    labelVertices();
  }


  if(key == 'k'){
   minSpanTreeCheck(); 
  }

  if (key == CODED) {
    if (keyCode == UP) {
      completeNum++;
    }
    if (keyCode == DOWN) {
      if (completeNum > 1) {
        completeNum--;
      }
    }
  }

  stroke(0, 0, 0);
  strokeWeight(3);

  fill(0, 0, 0);
  PFont font;
  font = loadFont("AlBayan-Bold-15.vlw"); 
  textFont(font); 
  textAlign(CENTER, CENTER);

  fill(255, 255, 255);
  rect(500, 350, 100, 50);

  fill(0, 0, 0);
  text("Complete-" + str(completeNum), 500, 350, 100, 50);
}


/////
// This determines which area was clicked and what function should be called next

void mouseClicked() {

  if (mouseX>=500 && mouseY < 500) {
    if (mode != 8) {
      // User chose to load existing graph
      loadGraph(floor(mouseY/50.0), floor((mouseX-500)/100.0));
    }

    if (mode == 8) { // Right menu is color choice menu, in this mode
      currentColor = floor(mouseY/50.0);
      drawColorPalette();
    }

    return;
  }

  if (mouseY>=500) {
    // User chose a menu button
    menuTouched(floor(mouseX/100.0), floor((mouseY-500)/50.0));
    return;
  }

  if (mouseY< 500 && mouseX < 500) {
    // User clicked the graph
    graphClicked();
  }
}



void mousePressed() {
  if (mode == 2) {
    clickedVertex = vertexClicked(mouseX, mouseY);
  }
}


void mouseDragged() {

  if (mouseX > 495 || mouseY > 495) {
    return;
  }

  if (clickedVertex != -1) {

    verticesX[clickedVertex] = mouseX;
    verticesY[clickedVertex] = mouseY;

    drawGraph();
    changeLabel("Drag Vertices");
  }
  
  if(prevMode == 5){
  placeWeights();
}
  
}

void mouseReleased() {
  clickedVertex = -1;
}

