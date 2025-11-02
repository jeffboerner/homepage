void drawPlanes() {

  if (!drawPages) return;

  fill(255, 255, 255, 150); 
  directionalLight(150, 100, 100, 1, 0, -1);
  directionalLight(150, 100, 100, -1, 0, -1);
  noStroke();

  for (int i = 0; i < gridSize; i++) {

    float xOffset = a*(width/2.0) + (1-a)*(100 + vertPairs[i][0]*colWidth + colWidth/2.0);

    beginShape();
    vertex(xOffset, 100 + vertPairs[i][1]*colWidth + colWidth/2.0, 0);
    vertex(100 + vertPairs[i][0]*colWidth + colWidth/2.0, 100 + vertPairs[i][1]*colWidth + colWidth/2.0, knotDepth*r);
    vertex(100 + vertPairs[i][0]*colWidth + colWidth/2.0, 100 + vertPairs[i][3]*colWidth + colWidth/2.0, knotDepth*r);
    vertex(xOffset, 100 + vertPairs[i][3]*colWidth + colWidth/2.0, 0);
    endShape(CLOSE);
  }
}

void drawGrid() {
  if (!showGrid) return;

  stroke(2);

  for (int i = 0; i <= gridSize; i++) {
    draw3DLine(100 + i*colWidth, 100, 100 + i*colWidth, 100+colWidth*gridSize);
    draw3DLine(100, 100 + i*colWidth, 100+colWidth*gridSize, 100 + i*colWidth);
  }

  for (int i = 0; i < gridSize; i++) {
    for (int j = 0; j < gridSize; j++) {
      if (xoArray[i][j] == 1) {
        printO(i, j);
      }
      if (xoArray[i][j] == 0) {
        printX(i, j);
      }
    }
  }
  return;
}

void draw3DLine(float x0, float y0, float x1, float y1) {
  stroke(0, 0, 0);
  fill(0, 0, 0);
  strokeWeight(3);

  float slope;

  if (x0 != x1 && y0 != y1) {
    slope = (y0-y1)/(x0-x1);
    slope = -1/slope;
  }
  else {

    if (x0 == x1) {
      beginShape();
      vertex(x0+2, y0, 0);
      vertex(x0+2, y1, 0);
      vertex(x1-2, y1, 0);
      vertex(x1-2, y0, 0);
      endShape(CLOSE);
    }
    else {
      beginShape();
      vertex(x0, y0+2, 0);
      vertex(x1, y1+2, 0);
      vertex(x1, y1-2, 0);
      vertex(x0, y0-2, 0);
      endShape(CLOSE);
    }
    return;
  }

  float factor = 4.0/sqrt(1 + pow(slope, 2));
  /*
  beginShape();
   vertex(x0, y0-2,0);
   vertex(x1, y1-2,0);
   vertex(x1+2, y1+2,0);
   vertex(x0+2, y0+2,0);
   endShape(CLOSE);
   */
  beginShape();
  vertex(x0+1*factor, y0+slope*factor, 0);
  vertex(x1+1*factor, y1+slope*factor, 0);
  vertex(x1-1*factor, y1-slope*factor, 0);
  vertex(x0-1*factor, y0-slope*factor, 0);
  endShape(CLOSE);
}

