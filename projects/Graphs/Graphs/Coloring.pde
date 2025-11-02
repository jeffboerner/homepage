void initColoring() {

  vertexColors = new int[verticesX.length];
  
  int ct = 0;
  
  while(ct < verticesX.length){
   vertexColors[ct] = -1;
    ct++; 
  }

  initializeColors();

  currentColor = 0;

  drawColorPalette();

  return;
}






//////////////////////////////////////////////
//////////////////////////////////////////////
void coloringClicked() {

  int newIndex = vertexClicked(mouseX, mouseY);

  noStroke();
  fill(colors[currentColor][0], colors[currentColor][1], colors[currentColor][2]);

  ellipse(verticesX[newIndex], verticesY[newIndex], 10, 10);

  vertexColors[newIndex] = currentColor;

  String outputString = str(countColors()) + " colors.";

  if (checkColors()) {
    outputString = "Colored with " + outputString;
  }
  else {
    outputString = "Not colored with " + outputString;
  }

  printMessage(outputString);

  return;
}




//////////////////////////////////////////////
//////////////////////////////////////////////

void initializeColors() {

  colors = new int[10][3];

  // red
  colors[0][0] = 240;
  colors[0][1] = 0;
  colors[0][2] = 0;


  // green
  colors[1][0] = 0;
  colors[1][1] = 139;
  colors[1][2] = 0;

  // blue
  colors[2][0] = 0;
  colors[2][1] = 0;
  colors[2][2] = 240;

  // yellow
  colors[3][0] = 240;
  colors[3][1] = 240;
  colors[3][2] = 0;

  // purple
  colors[4][0] = 155;
  colors[4][1] = 48;
  colors[4][2] = 255;

  // pink
  colors[5][0] = 255;
  colors[5][1] = 192;
  colors[5][2] = 203;

  // brown
  colors[6][0] = 165;
  colors[6][1] = 42;
  colors[6][2] = 42;

  // orange
  colors[7][0] = 255;
  colors[7][1] = 128;
  colors[7][2] = 0;

  // white
  colors[8][0] = 255;
  colors[8][1] = 255;
  colors[8][2] = 255;

  // grey
  colors[9][0] = 85;
  colors[9][1] = 85;
  colors[9][2] = 85;

  return;
}







//////////////////////////////////////////////
//////////////////////////////////////////////

void drawColorPalette() {

  strokeWeight(2);
  stroke(0, 0, 0);

  int ct = 0;

  while (ct < colors.length) {

    fill(colors[ct][0], colors[ct][1], colors[ct][2]);
    rect(500, 50*ct, 200, 50);

    ct++;
  }

  stroke(255, 255, 255);
  fill(colors[currentColor][0], colors[currentColor][1], colors[currentColor][2]);
  rect(500, 50*currentColor, 200, 50);
}






//////////////////////////////////////////////
//////////////////////////////////////////////


int countColors() {

  int[] arrayCount = new int[vertexColors.length];

  arrayCopy(vertexColors, arrayCount);

  arrayCount = sort(arrayCount);

  int colorCount = 1;
  int prevColor = arrayCount[0];

  int ct = 1;

  while (ct < arrayCount.length) {
    if (prevColor != arrayCount[ct]) {
      colorCount++;
      prevColor = arrayCount[ct];
    }

    ct++;
  }

  return colorCount;
}







//////////////////////////////////////////////
//////////////////////////////////////////////

boolean checkColors() {

  if (vertexColors.length == 0) {
    return true;
  }

  int ct = 0;
  int ct2 = 0;

  while (ct < verticesX.length) {
    ct2 = ct + 1;
    while (ct2 < verticesX.length) {
      if (iMatrix[ct][ct2]) {
        if (vertexColors[ct]==vertexColors[ct2]) {
          // Graph is NOT colored
          return false;
        }
      }   
      ct2++;
    }
    ct++;
  }

  return true;
}

