//////////////////////////////////////////////
//////////////////////////////////////////////

void initEulerCircuit() {

  foundEdge = new boolean[100][100];

  int ct = 0;
  int ct2 = 0;

  while (ct < verticesX.length) {
    arrayCopy(iMatrix[ct], foundEdge[ct]);
    ct++;
  }

  edgeCt = 0;
  
  // Necessary to initialize eulerizedMatrix
  eulerized = new boolean[100][100];

  while (ct < 100) {
    ct2 = 0;
    while (ct2 < 100) {
      eulerized[ct][ct2] = false;
      ct2++;
    }
    ct++;
  }
  
  return;
}






//////////////////////////////////////////////
//////////////////////////////////////////////

void initEulerize() {

  int ct = 0;
  int ct2 = 0;

  eulerized = new boolean[100][100];

  while (ct < 100) {
    ct2 = 0;
    while (ct2 < 100) {
      eulerized[ct][ct2] = false;
      ct2++;
    }
    ct++;
  }
  eulerizedCheck();
  return;
}






//////////////////////////////////////////////
//////////////////////////////////////////////
void eulerCircuitClicked() {

  int newIndex = vertexClicked(mouseX, mouseY);

  if (newIndex != -1) {

    if (newIndex == selectedIndex) {
      return;
    }

    if (selectedIndex == -1) {
      // This is the first vertex in the Euler circuit
      // color selected vertex yellow
      stroke(255, 255, 0);
      fill(255, 255, 0);
      strokeWeight(0);
      ellipse(verticesX[newIndex], verticesY[newIndex], 12, 12);

      selectedIndex = newIndex;
      initialVertex = selectedIndex;
    }
    else {
      
      if (foundEdge[newIndex][selectedIndex] || eulerized[newIndex][selectedIndex]) {
        // This is a subsequent vertex 
        // color selected vertex red

        if (foundEdge[newIndex][selectedIndex]) {
          stroke(255, 0, 0);
          fill(255, 0, 0);
          strokeWeight(0);
          ellipse(verticesX[newIndex], verticesY[newIndex], 10, 10);

          stroke(255, 0, 0);
          strokeWeight(3);
          line(verticesX[newIndex], verticesY[newIndex], verticesX[selectedIndex], verticesY[selectedIndex]);

          edgeCt++;

          fill(0, 0, 0);

          int midPtX = round((verticesX[newIndex] + verticesX[selectedIndex])/2.0);
          int midPtY = round((verticesY[newIndex] + verticesY[selectedIndex])/2.0);

          noStroke();
          fill(255, 255, 255);
          rect(midPtX-15, midPtY-15, 30, 30);

          fill(0, 0, 0);
          font = loadFont("AlBayan-Bold-15.vlw"); 
          textFont(font); 
          textAlign(CENTER, CENTER);
          text(str(edgeCt), min(verticesX[newIndex], verticesX[selectedIndex])-25, min(verticesY[newIndex], verticesY[selectedIndex])-25, abs(verticesX[newIndex]-verticesX[selectedIndex])+50, abs(verticesY[newIndex]-verticesY[selectedIndex])+50);

          foundEdge[newIndex][selectedIndex] = false;
          foundEdge[selectedIndex][newIndex] = false;
        }
        else {
          edgeCt++;
          drawEulerizedCurve(newIndex,1);
          eulerized[newIndex][selectedIndex] = false;
          eulerized[selectedIndex][newIndex] = false;
        }

        selectedIndex = newIndex;

        if (eulerCheck()) {
          printMessage("Euler circuit found!");
        }
        else {
          printMessage("");
        }
      }
    }
  }
  return;
}





//////////////////////////////////////////////
//////////////////////////////////////////////

void eulerizeClicked() {

  int newIndex = vertexClicked(mouseX, mouseY);

  if (newIndex == -1) {
    // No vertex is selected
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

  if (newIndex == selectedIndex) {
    // Both vertices are the same
    return;
  }

  if (!iMatrix[newIndex][selectedIndex]) {
    // We should only duplicate edges
    return;
  }

  drawEulerizedCurve(newIndex,0);

  /*
  float newPX;
   float newPY;
   
   int midPX =  round((verticesX[newIndex] + verticesX[selectedIndex])/2.0);
   int midPY = round((verticesY[newIndex]+verticesY[selectedIndex])/2.0);
   
   if (verticesY[newIndex]-verticesY[selectedIndex] == 0) {
   //slope is 0
   newPX = midPX;
   newPY = midPY-20;
   }
   else {
   if ( verticesX[newIndex]-verticesX[selectedIndex] == 0) {
   //slope is undefined 
   newPX = midPX + 20;
   newPY = midPY;
   }
   else {
   // slope is valid
   newPX = midPX;
   newPY = midPY;
   float slope = float(verticesY[newIndex]-verticesY[selectedIndex])/float(verticesX[newIndex]-verticesX[selectedIndex]);
   
   slope = -1.0/slope;
   while (dist (midPX, midPY, newPX, newPY) < 20) {
   // we are curving the new edge away from the original edge
   newPX = newPX + .1;
   newPY = slope*(newPX-midPX)+midPY;
   }
   }
   }
   
   
   eulerized[newIndex][selectedIndex] = !eulerized[newIndex][selectedIndex];
   eulerized[selectedIndex][newIndex] = !eulerized[selectedIndex][newIndex];
   
   if (eulerized[newIndex][selectedIndex]) {
   stroke(0, 0, 255);
   }
   else {
   stroke(255, 255, 255);
   }
   
   noFill();
   strokeWeight(3);
   beginShape();
   curveVertex(verticesX[newIndex], verticesY[newIndex]);
   curveVertex(verticesX[newIndex], verticesY[newIndex]);
   curveVertex(newPX, newPY);
   curveVertex(verticesX[selectedIndex], verticesY[selectedIndex]);
   curveVertex(verticesX[selectedIndex], verticesY[selectedIndex]);
   endShape();
   
   fill(0, 0, 0);
   stroke(0, 0, 0);
   strokeWeight(0);
   ellipse(verticesX[selectedIndex], verticesY[selectedIndex], 10, 10);
   ellipse(verticesX[newIndex], verticesY[newIndex], 10, 10);
   edgeSelected = false;
   */
  eulerizedCheck();
  return;
}




//////////////////////////////////////////////
//////////////////////////////////////////////

boolean eulerizedCheck() {

  /// Check to see if graph has an euler circuit
  noStroke();
  fill(255, 255, 255);
  rect(0, 450, 500, 50);

  stroke(0, 0, 0);
  fill(0, 0, 0);

  int parity;
  int remainder;

  int ct = 0;
  int ct2 = 0;

  while (ct < verticesX.length) {
    parity = 0;
    ct2 = 0;
    while (ct2 < verticesX.length) {

      if (eulerized[ct][ct2]) {
        //   println("Eulerized edge");
        parity++;
      }
      if (iMatrix[ct][ct2]) {
        //   println("Standard edge");
        parity++;
      }

      ct2++;
    }

    //   println("parity is " + str(parity));

    remainder = parity-2*floor(parity/2.0);
    //   println("remainder is " + str(remainder));

    if (remainder == 1) {
      //text("This graph is not Eulerized", 0, 450, 500, 50);
      printMessage("This graph is not Eulerized");
      return false;
    }
    ct++;
  }

  //text("This graph is Eulerized", 0, 450, 500, 50);
  printMessage("This graph is Eulerized");
  return true;
}





//////////////////////////////////////////////
//////////////////////////////////////////////
boolean eulerCheck() {
  if (selectedIndex != initialVertex) {
    return false;
  }

  int ct = 0;
  int ct2 = 0;

  while (ct < verticesX.length) {
    ct2 = 0;
    while (ct2 < verticesX.length) {
      if (foundEdge[ct][ct2]) {
        return false;
      }
      ct2++;
    }
    ct++;
  }
  return true;
}


void drawEulerizedCurve(int newIndex, int type) {

  float newPX;
  float newPY;

  int midPX =  round((verticesX[newIndex] + verticesX[selectedIndex])/2.0);
  int midPY = round((verticesY[newIndex]+verticesY[selectedIndex])/2.0);

  if (verticesY[newIndex]-verticesY[selectedIndex] == 0) {
    //slope is 0
    newPX = midPX;
    newPY = midPY-20;
  }
  else {
    if ( verticesX[newIndex]-verticesX[selectedIndex] == 0) {
      //slope is undefined 
      newPX = midPX + 20;
      newPY = midPY;
    }
    else {
      // slope is valid
      newPX = midPX;
      newPY = midPY;
      float slope = float(verticesY[newIndex]-verticesY[selectedIndex])/float(verticesX[newIndex]-verticesX[selectedIndex]);

      slope = -1.0/slope;
      while (dist (midPX, midPY, newPX, newPY) < 20) {
        // we are curving the new edge away from the original edge
        newPX = newPX + .1;
        newPY = slope*(newPX-midPX)+midPY;
      }
    }
  }

if(type != 1){
  eulerized[newIndex][selectedIndex] = !eulerized[newIndex][selectedIndex];
  eulerized[selectedIndex][newIndex] = !eulerized[selectedIndex][newIndex];
}

  if (eulerized[newIndex][selectedIndex]) {
    stroke(0, 0, 255);
  }
  else {
    stroke(255, 255, 255);
  }
  
  if(type == 1){
    stroke(255,0,0);
  }

  noFill();
  strokeWeight(3);
  beginShape();
  curveVertex(verticesX[newIndex], verticesY[newIndex]);
  curveVertex(verticesX[newIndex], verticesY[newIndex]);
  curveVertex(newPX, newPY);
  curveVertex(verticesX[selectedIndex], verticesY[selectedIndex]);
  curveVertex(verticesX[selectedIndex], verticesY[selectedIndex]);
  endShape();

  fill(0, 0, 0);
  stroke(0, 0, 0);
  strokeWeight(0);
  ellipse(verticesX[selectedIndex], verticesY[selectedIndex], 10, 10);
  ellipse(verticesX[newIndex], verticesY[newIndex], 10, 10);
  edgeSelected = false;

  if(type == 1){
              noStroke();
          fill(255, 255, 255);
          rect(newPX-15, newPY-15, 30, 30);

          fill(0, 0, 0);
          font = loadFont("AlBayan-Bold-15.vlw"); 
          textFont(font); 
          textAlign(CENTER, CENTER);
          text(str(edgeCt), newPX-15, newPY-15, 30, 30);    
  }

  return;
}



