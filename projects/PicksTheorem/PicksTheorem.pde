/* An application to demonstrate Pick's Theorem */

int gridSize = 10;
int bumperSize = 25;

Boolean shapeSet = false;
Point selectedVertex = new Point(0, 0);

Boolean[][] selected = new Boolean[gridSize][gridSize];

Point[] vertices = new Point[0];

void setup() {
  
  size(500, 550);
  initialize();
}

void draw() {
  background(200, 200, 200);
  
  drawGrid(gridSize);
  drawPolygon();
}

void initialize(){
  
  selected = new Boolean[gridSize][gridSize];
  vertices = new Point[0];
  
   for (int i = 0; i < gridSize; i++) {
    for (int j = 0; j < gridSize; j++) {
      selected[i][j] = false;
    }
  }
}

float areaOfPolygon(int i, int b) {
  /* A = i + b/2 - 1 (i = interior, b = boundary) */
  return i + b/2.0 - 1.0;
}



