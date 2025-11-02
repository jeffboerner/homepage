void mouseClicked() {

  float stepSize = (width-2*bumperSize)/(gridSize-1);

  int i = round((mouseX-bumperSize)/stepSize);
  int j = round((mouseY-bumperSize)/stepSize);

  /* // FOR DEBUGGING PURPOSES 
  if (shapeSet) {

    selectedVertex = new Point(i, j);

    println(i + "," + j);
    println(coordinatesForPoint(selectedVertex).xCoord + "," + coordinatesForPoint(selectedVertex).yCoord);

    for (int k = 0; k < vertices.length-1; k++) {
      Segment seg = new Segment(vertices[k], vertices[k+1]);
      println(signedNumberOfPointAndSegment(selectedVertex, seg));
    }
    
    Segment seg = new Segment(vertices[vertices.length-1],vertices[0]);
    println(signedNumberOfPointAndSegment(selectedVertex, seg));

    return;
  }
  */

  Point newVertex = new Point(i, j);
  vertices = (Point[]) append(vertices, newVertex);
}

void keyPressed() {
  if (key == ' ') {
    shapeSet = true;
    println("Shape set");
  }
  if(key == 'r'){
    initialize();
  }
}
