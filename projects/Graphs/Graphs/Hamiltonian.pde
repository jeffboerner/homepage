//////////////////////////////////////////////
//////////////////////////////////////////////
void hamiltonianClicked() {

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

      if (!foundVertex[newIndex] && iMatrix[newIndex][selectedIndex]) {
        // This is a subsequent vertex 
        // color selected vertex red
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

        foundVertex[newIndex] = true;

        selectedIndex = newIndex;

        if (hamiltonianCheck()) {
          printMessage("Hamiltonian circuit found!");
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
boolean hamiltonianCheck() {
  if (selectedIndex != initialVertex) {
    return false;
  }

  int ct = 0;

  while (ct < verticesX.length) {
      if (!foundVertex[ct]) {
        return false;
      }
    
    ct++;
  }
  return true;
}







//////////////////////////////////////////////
//////////////////////////////////////////////

void initHamiltonian() {

  edgeCt = 0;
  foundVertex = new boolean[verticesX.length];

  int ct = 0;

  while (ct < verticesX.length) {
    foundVertex[ct] = false;
    ct++;
  }
  return;
}
