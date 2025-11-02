void drawGrid(int n) {

  //println("drawGrid() called");
  
  pushMatrix();
  translate(width/2.0, height/2.0);

  int stepSize = (width-bumperSize*2)/(n-1);
  noStroke();

  int interiorCt = 0;
  int boundaryCt = 0;

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {

      float[] colorArray = new float[3];

      if (!selected[i][j]) fill(0, 0, 0);
      else colorArray[0] = 200;

      Point currentPoint = new Point(i, j);

      if (currentPoint.isInteriorPoint()) {
        colorArray[0] = 0;
        colorArray[1] = 255;
        colorArray[2] = 0;
        interiorCt++;
      }
      
      //println("isInteriorPoint()? " + currentPoint.isInteriorPoint());

      if (currentPoint.isBoundaryPoint()) {
        colorArray[0] = 0;
        colorArray[1] = 255;
        colorArray[2] = 255;
        boundaryCt++;
      }
      
      //println("isBoundaryPoint()? " + currentPoint.isBoundaryPoint());

      fill(colorArray[0], colorArray[1], colorArray[2]);
      
      Point vertexPoint = new Point(0,0);
      
      //println("vertexPoint set once");
      
      vertexPoint = coordinatesForPointWithCoordinates(i, j);
      
      //println("vertexPoint set twice");
      
      ellipse(vertexPoint.xCoord, vertexPoint.yCoord, 5, 5);
      
      //println("vertex drawn");
    }
  }


  /********
  FOR TROUBLESHOOTING 
  *******/
  //selectedVertex.showIntersections();
  /********/

  popMatrix();

  textAlign(CENTER, CENTER);
  fill(0);
  text("Interior Points = " + interiorCt +  ";  Boundary Points = " + boundaryCt + ";  Area = " + areaOfPolygon(interiorCt,boundaryCt), 250, 525);
  interiorCt = 0;
}

void drawPolygon() {

  fill(0, 120, 0, 40);
  stroke(0);

  pushMatrix();
  translate(width/2.0, height/2.0);

  beginShape();
  for (int i = 0; i < vertices.length; i++) {
    vertex(coordinatesForPointWithCoordinates(vertices[i].xCoord, vertices[i].yCoord).xCoord, coordinatesForPointWithCoordinates(vertices[i].xCoord, vertices[i].yCoord).yCoord);
  }
  endShape(CLOSE);

  popMatrix();
}








/* converts indices to sketch coordinates */
Point coordinatesForPointWithCoordinates(float i, float j) {
  int stepSize = (width-2*bumperSize)/(gridSize-1);
  Point returnPoint = new Point(-width/2.0 + bumperSize + i*stepSize, -height/2.0 + bumperSize + j*stepSize);
  return returnPoint;
}

Point coordinatesForPoint(Point pt) {
  return coordinatesForPointWithCoordinates(pt.xCoord, pt.yCoord);
}

