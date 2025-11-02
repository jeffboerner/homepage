// grid should probably be booleans, indicating whether line can go there or not
// To get points, just use formula

Point currentPoint = new Point(1, 0);
Point originalPoint = currentPoint;

int lineNumber = 0;
Color[] colors = new Color[50];
boolean done = false;

int xDots = 10;
int yDots = 10;

int xSpan = xDots*2+1 + 1000;
int ySpan = yDots*2+1 + 1000;

int xDirection = 1;
int yDirection = 1;

Point[][] grid = new Point[xSpan][ySpan];

Boolean[][] grid2 = new Boolean[xSpan][ySpan];
Boolean[][] dots = new Boolean[xSpan][ySpan];

boolean paused = true;

int gridStep = 10;

int newRecWidth = 4;
int newRecHeight = 4;

void setup() {
  size(500, 500);
  frameRate(30);

  for (int i = 0; i < xSpan; i++) {
    for (int j = 0; j < ySpan; j++) {
      grid[i][j] = new Point(50 + i*gridStep, 50 + j*gridStep);
      grid2[i][j] = false;
      dots[i][j] = false;
    }
  }

  currentPoint.x = 1;
  currentPoint.y = 0;

  /*
  for (int i = 1; i < xSpan-10; i+=2) {
   for (int j = 7; j < ySpan-10; j+=2) {
   placeDot(i, j);
   }
   }
   */

  //placeRectOfDots(new Point(1, 7), 10, 10);
  //placeRectOfDots(new Point(21, 3), 2, 4);

  /*
  placeDot(21, 1);
   placeDot(23, 1);
   placeDot(25, 1);
   placeDot(21, 3);
   placeDot(23, 3);
   placeDot(25, 3);
   placeDot(21, 5);
   placeDot(23, 5);
   placeDot(25, 5);
   placeDot(21, 7);
   placeDot(23, 7);
   placeDot(25, 7);
   */



  colors[7] = new Color(0, 0, 0);
  colors[0] = new Color(200, 0, 0);
  colors[1] = new Color(255, 153, 51);
  colors[2] = new Color(255, 255, 0);
  colors[3] = new Color(0, 120, 0);
  colors[4] = new Color(0, 0, 120);
  colors[5] = new Color(75, 0, 130);
  colors[6] = new Color(120, 0, 120);
  colors[8] = new Color(0, 0, 0);
  colors[8] = new Color(0, 0, 0);
  colors[9] = new Color(0, 0, 0);
  colors[10] = new Color(0, 0, 0);
  colors[11] = new Color(0, 0, 0);
  colors[12] = new Color(0, 0, 0);





  //drawDots();
}

void draw() {

  if (done || paused) return;

  //Point nextPoint = new Point(currentPoint.x + gridStep, currentPoint.y + gridStep);
  //line(nextPoint.x,nextPoint.y,currentPoint.x,currentPoint.y);

  /*
  Point nextPoint = new Point(currentPoint.x + xDirection, currentPoint.y + yDirection);
   
   if (nextPoint.x >= xSpan || nextPoint.x < 0) {
   nextPoint.x -= 2*xDirection;
   xDirection = -xDirection;
   }
   if (nextPoint.y >= ySpan || nextPoint.y < 0) {
   nextPoint.y -= 2*yDirection;
   yDirection = -yDirection;
   }
   */

  // this will go into this loop first time through, which isn't ideal

  if (originalPoint.x == currentPoint.x && originalPoint.y == currentPoint.y) {
    done = true;
    stroke(colors[lineNumber].red, colors[lineNumber].green, colors[lineNumber].blue);
    lineNumber++;
    for (int i = 0; i < xSpan; i++) {
      for (int j = 0; j < ySpan; j++) {
        if (grid2[i][j]) {
          currentPoint = new Point(i, j);
          originalPoint = currentPoint;
          done = false;
        }
      }
    }
    if (done) {
      println(lineNumber-1 + " lines");
      return;
    }
  }

  if (currentPoint.y + yDirection >= ySpan || currentPoint.y + yDirection  < 0) yDirection = -yDirection;
  if (currentPoint.x + xDirection >= xSpan || currentPoint.x + xDirection  < 0) xDirection = -xDirection;

  if (!dots[currentPoint.x][currentPoint.y + yDirection] && !dots[currentPoint.x + xDirection][currentPoint.y]) {
    if (dots[currentPoint.x][currentPoint.y - yDirection]) yDirection = -yDirection;
    else xDirection = -xDirection;
  }

  Point nextPoint = new Point(currentPoint.x + xDirection, currentPoint.y + yDirection);



  /*
  if(nextPoint.x < 0 || nextPoint.x >= xSpan || nextPoint.y < 0 || nextPoint.y >= ySpan || !grid2[nextPoint.x][nextPoint.y]){
   // must bounce
   println("Bounce");
   if(nextPoint.y - 2*yDirection > 0 &&  nextPoint.y - 2*yDirection < ySpan && grid2[nextPoint.x][nextPoint.y - 2*yDirection]){ yDirection = -yDirection; nextPoint.y += 2*yDirection; println("Bounce y");}
   else if(nextPoint.x - 2*xDirection > 0 &&  nextPoint.x - 2*xDirection < xSpan && grid2[nextPoint.x-2*yDirection][nextPoint.y]){ xDirection = -xDirection; nextPoint.x += 2*xDirection;}
   }
   */

  line(grid[nextPoint.x][nextPoint.y].x, grid[nextPoint.x][nextPoint.y].y, grid[currentPoint.x][currentPoint.y].x, grid[currentPoint.x][currentPoint.y].y);

  grid2[currentPoint.x][currentPoint.y] = false;
  currentPoint = nextPoint;
}

void drawDots() {
  for (int i = 0; i < xSpan-1; i++) {
    for (int j = 0; j < ySpan; j++) {
      ellipse(50 + gridStep/2 + i*gridStep, 50 + j*gridStep, 5, 5);
    }
  }
}

void placeDot(int x, int y) {
  grid2[x-1][y] = true;
  grid2[x+1][y] = true;
  grid2[x][y-1] = true;
  grid2[x][y+1] = true;
  ellipse(50 + x*gridStep, 50 + y*gridStep, 5, 5);
  dots[x][y] = true;
}

void mouseClicked() {
  /*
  float distance = MAX_FLOAT;
   Point newPoint = new Point(1, 0);
   
   for (int i = 0; i < xSpan; i++) {
   for (int j = 0; j < ySpan; j++) {
   if (grid2[i][j] && dist(50 + i*gridStep, 50 + j*gridStep, mouseX, mouseY) < dist(50 + newPoint.x*gridStep, 50 + newPoint.y*gridStep, mouseX, mouseY)) {
   newPoint.x = i;
   newPoint.y = j;
   }
   }
   }
   
   stroke(255, 0, 0);
   */

  // click to place dots
  // identify origin
  placeRectOfDots(new Point(2*round(((mouseX-50)/gridStep)/2)+1, 2*round(((mouseY-50)/gridStep)/2)+1), newRecWidth, newRecHeight);

  //println(2*round(((mouseX-50)/gridStep)/2)+1);
  //println(2*round(((mouseY-50)/gridStep)/2)+1);

  //currentPoint.x = newPoint.x;
  //currentPoint.y = newPoint.y;
}

// origin should have odd coordinates
void placeRectOfDots(Point origin, int rectWidth, int rectHeight) {
  for (int i = origin.x; i < 2*rectWidth + origin.x; i += 2) {
    for (int j = origin.y; j < 2*rectHeight + origin.y; j += 2) {
      stroke(0);
      placeDot(i, j);
    }
  }
}

void keyPressed() {

  if (keyCode == LEFT && newRecWidth > 1) newRecWidth--;
  if (keyCode == RIGHT) newRecWidth++;
  if (keyCode == UP) newRecHeight++;
  if (keyCode == DOWN && newRecHeight > 1) newRecHeight--;

  println(newRecWidth + "x" + newRecHeight);

  if (key == ' ') paused = !paused; 
  if (key == 'r') reset();
  if (key == 'e') eraseLines();
  if (key == 'c') background(200, 200, 200);
}

void reset() {
  lineNumber = 0;
  for (int i = 0; i < grid2[0].length; i++) {
    for (int j = 0; j < grid2[i].length; j++) {
      grid2[i][j] = false;
      dots[i][j] = false;
    }
  }
  done = false;
  paused = true;
  background(200, 200, 200);
}

void eraseLines() {
  lineNumber = 0;
  background(200, 200, 200);
  done = false;
  paused = true;

  for (int i = 0; i < grid2[0].length; i++) {
    for (int j = 0; j < grid2[i].length; j++) {
      if (dots[i][j]) placeDot(i, j);
    }
  }
}

