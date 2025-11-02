
void keyPressed() {

  int xCoord = mouseX - 100;
  int yCoord = mouseY - 100;

  xCoord = floor(xCoord/colWidth);
  yCoord = floor(yCoord/colWidth);

  //println("(" + xCoord + "," + yCoord + ")");

  if (xCoord >= 0 && xCoord < gridSize && yCoord >= 0 && yCoord < gridSize) {

    if (key == 'x') {
      //println("x pushed");
      printX(xCoord, yCoord);

      for (int i = 0; i < gridSize; i++) {
        if (xoArray[xCoord][i] == 0) {
          xoArray[xCoord][i] = -1;
        }
        if (xoArray[i][yCoord] == 0) {
          xoArray[i][yCoord] = -1;
        }
      }

      xoArray[xCoord][yCoord] = 0;
    }
    if (key == 'o') {
      printO(xCoord, yCoord); 
      
      for (int i = 0; i < gridSize; i++) {
       if (xoArray[xCoord][i] == 1) {
          xoArray[xCoord][i] = -1;
        }
        if (xoArray[i][yCoord] == 1) {
          xoArray[i][yCoord] = -1;
        }
      }
      
      xoArray[xCoord][yCoord] = 1;
    }
    if (key == ' ') {
      printO(xCoord, yCoord); 
      xoArray[xCoord][yCoord] = -1;
    }
  }

  if (key == 'k') {
    //println("drawKnot");
    showKnot = !showKnot;
    drawKnot();
  }

  /*
  //// Shows knot in grid position
   if (key == 'd') {
   println("draw");
   unlock = true;
   arcpres = false;
   animate = false;
   drawPages = false;
   rotX = 0;
   rotY = 0;
   rotZ = 0;
   }
   */

  /*
  //// Shows knot in arc presentation
   if (key == 'a') {
   arcpres = true;
   unlock = true;
   }
   */

  //// Shows pages for arc presentation
  if (key == 'p') {
    drawPages = !drawPages;
  }

  /*
  //// Starts animation from grid position to arc presentation
   if (key == 'g') {
   p = 0;
   q = 0;
   t = 0;
   s = 0;
   r = 0;
   unlock = true;
   animate = true;
   }
   */

  ////////
  /// Rotations of knot in 3D
  /*
  if (keyCode == UP) {
   rotX = rotX + .1;
   }
   if (keyCode == DOWN) {
   rotX = rotX - .1;
   }
   if (keyCode == LEFT) {
   rotY = rotY - .1;
   }
   if (keyCode == RIGHT) {
   rotY = rotY + .1;
   }
   if (str(key).equals("z")) {
   rotZ = rotZ + .1;
   } 
   */

  if (keyCode == UP) {
    r += .1;
    r = min(r, 1);
    drawKnot();
  }
  if (keyCode == DOWN) {
    r -= .1;
    r = max(r, 0);
    drawKnot();
  }

  if ( keyCode == LEFT) {
    a += .1;
    a = min(a, 1);
    drawKnot();
  }
  if ( keyCode == RIGHT) {
    a -= .1;
    a = max(a, 0);
    drawKnot();
  }

  if (key == 'g') {
    showGrid = !showGrid;
    drawKnot();
  }

  if (key == '2') {
    angle += .1;
    angle = min(1, angle);
  }
  if (key == '1') {
    angle -= .1;
    angle = max(0, angle);
  }

  if (key == '+') {
    gridSize++;
    initializeXOArray();
    drawGrid();
      if (diagonal) {
    //////
    // Automate a diagonal diagram

    for (int i1 = 0; i1 < gridSize; i1++) {
      for (int i2 = 0; i2 < gridSize; i2++) {
        if (i1 == i2) {
          xoArray[i1][i2] = 0;
          printX(i1, i2);
        }
        if (gridSize-i2 + i1 == underdiagonal) {
          xoArray[i1][i2] = 1;
          printO(i1, i2);
        }
        if (gridSize-i1+i2 == gridSize - underdiagonal) {
          xoArray[i1][i2] = 1;
          printO(i1, i2);
        }
      }
    }
  }
  }
  if (key == '-') {
    gridSize--;
    gridSize = max(0, gridSize);
    initializeXOArray();
    drawGrid();
      if (diagonal) {
    //////
    // Automate a diagonal diagram

    for (int i1 = 0; i1 < gridSize; i1++) {
      for (int i2 = 0; i2 < gridSize; i2++) {
        if (i1 == i2) {
          xoArray[i1][i2] = 0;
          printX(i1, i2);
        }
        if (gridSize-i2 + i1 == underdiagonal) {
          xoArray[i1][i2] = 1;
          printO(i1, i2);
        }
        if (gridSize-i1+i2 == gridSize - underdiagonal) {
          xoArray[i1][i2] = 1;
          printO(i1, i2);
        }
      }
    }
  }
  }

  return;
}


///////
// For rotation
int prevX;
int prevY;

void mousePressed() {
  prevX = mouseX;
  prevY = mouseY;
}

void mouseDragged() {

  StateChange change = new StateChange();

  change.deltaRotY += 0.05*(mouseX - prevX);
  change.deltaRotX -= 0.05*(mouseY - prevY);

  prevX = mouseX;
  prevY = mouseY;

  changeArray = (StateChange[]) append(changeArray, change);
}

