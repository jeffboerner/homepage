//////
// function draws disks and pegs in their current positions

void drawDisks() {
  
  int offsetX = 250;
  int offsetY = 250;

  //stroke(255, 255, 255);
  //fill(255, 255, 255);
  //rect(-400, -400, 800, 800);
  stroke(0, 0, 0);
  fill(0, 0, 0);

  strokeWeight(3);

  ////////////
  // draw pegs
  int ct = 0;

  pegDistance = round(500/(peg_num+1));  

  while (ct < peg_num) {
    line(-250+pegDistance*(ct+1) + offsetX, offsetY, -250+pegDistance*(ct+1)  + offsetX, -100  + offsetY);     
    ct++;
  }

  ct = 0;


  if (animateSolution) {
    while (ct < disk_num) {
      d_pos[ct] = vertices[pathArray[drawCt]][ct];
      ct++;
    }
  }

  int disk_height = 10;

  strokeWeight(disk_height);

  ////////////
  // draw Disks

  ct = 0;

  while (ct < disk_num) {
    if (!d_live[ct]) {
      line(-40+pegDistance*d_pos[ct]+6*ct - 250 + pegDistance  + offsetX, -(disk_height+1)*ct + offsetY, 40+pegDistance*d_pos[ct]-6*ct - 250 + pegDistance + offsetX, -(disk_height+1)*ct + offsetY);
    }
    else {
      line(-40+6*ct+mouseX-250 + offsetX, mouseY-250 + offsetY, 40-6*ct+mouseX-250 + offsetX, mouseY-250 + offsetY);
    }
    ct++;
  }

  ct = 0;


  ///////
  /// Prints info to canvas

  fill(0, 0, 0);

  String outputString = "";

  ct = 0;

  while (ct < disk_num) {
    outputString = outputString + str(d_pos[ct]);
    ct++;
  }

  text(outputString, -100, -250);
}










void drawGraph() {

  int offsetX = 750;
  int offsetY = 250;
  
  if (!showGraph) {
    return;
  }

  //println("Drawing graph...\n");

  strokeWeight(2);

  //stroke(255, 255, 255);
  //fill(255, 255, 255);
  //rect(-400, -400, 800, 800);

  stroke(0, 0, 0);
  fill(0, 0, 0);

  //line(-400, -400, -400, 400);

  edge_count = 0;

  int vertexA = 0;
  int vertexB = 0;

  while (vertexA < vertexNum) {

    if (!cyclic) {
      vertexB = vertexA + 1;
    }
    else {
      vertexB = 0;
    }

    while (vertexB < vertexNum) {

      if (incidentCheck(vertexA, vertexB)) {

        // Drawing takes place here

        if (cyclic) {
          // Cylic hanoi, so graph is directed, this draw the arrows
          int midpointX = (coordinates(vertices[vertexA])[0]+adjustmentArray[vertexA][0]+coordinates(vertices[vertexB])[0]+adjustmentArray[vertexB][0])/2;
          int midpointY = (coordinates(vertices[vertexA])[1]+adjustmentArray[vertexA][1]+coordinates(vertices[vertexB])[1]+adjustmentArray[vertexB][1])/2;

          float angle = atan2(coordinates(vertices[vertexA])[1]+adjustmentArray[vertexA][1]-coordinates(vertices[vertexB])[1]+adjustmentArray[vertexB][1], coordinates(vertices[vertexA])[0]+adjustmentArray[vertexA][0]-coordinates(vertices[vertexB])[0]+adjustmentArray[vertexB][0]);

          line(midpointX + offsetX, midpointY + offsetY, midpointX + 10*cos(angle+PI/4.0) + offsetX, midpointY+10*sin(angle+PI/4.0) + offsetY);
          line(midpointX + offsetX, midpointY + offsetY, midpointX + 10*cos(angle-PI/4.0) + offsetX, midpointY+10*sin(angle-PI/4.0) + offsetY);
        }

        line(coordinates(vertices[vertexA])[0]+adjustmentArray[vertexA][0]  + offsetX, coordinates(vertices[vertexA])[1]+adjustmentArray[vertexA][1] + offsetY, coordinates(vertices[vertexB])[0]+adjustmentArray[vertexB][0] + offsetX, coordinates(vertices[vertexB])[1]+adjustmentArray[vertexB][1] + offsetY);

        if (adjustmentLive[vertexA]) {
          ellipse(coordinates(vertices[vertexA])[0]+adjustmentArray[vertexA][0], coordinates(vertices[vertexA])[1]+adjustmentArray[vertexA][1], 5, 5);
        }
        if (adjustmentLive[vertexB]) {
          ellipse(coordinates(vertices[vertexB])[0]+adjustmentArray[vertexB][0], coordinates(vertices[vertexB])[1]+adjustmentArray[vertexB][1], 5, 5);
        }

        if (showVertices) {
          printVertexLabel(vertexA);
          printVertexLabel(vertexB);
        }

        if (showDistances) {
          printVertexDist(vertexA);
          printVertexDist(vertexB);
        }
        edge_count++;
      }
      vertexB++;
    }
    vertexA++;
  }

  String outputString = "Disks: " + str(disk_num) + " Pegs: " + str(peg_num) + "\n";
  outputString = outputString + "Edges: " + str(edge_count) + "\n";
  outputString = outputString + "Solution Length: " + str(vertDistances[vertexNum-1]) + " steps";
  text(outputString, 25-translateAmount, 25-translateAmount);

  //text("Solution takes "+ str(vertDistances[vertexNum-1]) + " steps", translateAmount-250, -translateAmount+50);

  //println("Done drawing graph.\n");

  //// Print a red circle where solution is
  if (pathArray.length != 0) {
    //print("placing red circle\n");

    // d_pos = new int[disk_num];

    int ct = 0;

    drawCt = min(vertDistances[vertexNum-1], drawCt);

    while (ct < disk_num) {
      // d_pos[ct] = vertices[pathArray[drawCt]][ct];
      ct++;
    }

    fill(255, 0, 0);

    // Plot current state on graph
    ellipse(coordinates(d_pos)[0] + offsetX, coordinates(d_pos)[1] + offsetY, 15, 15);

    fill(0, 0, 0);
  }
  return;
}


