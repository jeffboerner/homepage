boolean[][] cells = new boolean[100][100];
boolean[][] nextCells = new boolean[100][100];

boolean paused = true;

void setup() {
  size(500, 500);
  frameRate(10);

  initializeCells();
}

void initializeCells() {
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      cells[i][j] = false;
    }
  }

  // initial state
  //cells[20][20] = true;
  //cells[20][21] = true;
  //cells[20][22] = true;

  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      if (round(random(0, 1)) == 0) cells[i][j] = false;
      else cells[i][j] = true;
    }
  }

  syncNextCells();
  drawCells();
}

void draw() {

  if (paused) return;

  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      if (cells[i][j]) {
        // live cell
        if (adjacentLiveCells(i, j) < 2) nextCells[i][j] = false; 
        if (adjacentLiveCells(i, j) > 3) nextCells[i][j] = false;
        //println(adjacentLiveCells(i, j));
      }
      else {
        // dead cell
        if (adjacentLiveCells(i, j) == 3) nextCells[i][j] = true;
      }
    }
  }

  /*
  for (int i = 0; i < 100; i++) {
   for (int j = 0; j < 100; j++) {
   cells[i][j] = nextCells[i][j];
   }
   }
   */

  syncCells();

  drawCells();
}

int adjacentLiveCells(int x, int y) {
  int liveCells = 0;

  if (x-1 >= 0 && cells[x-1][y]) liveCells++;
  if (x-1 >= 0 && y+1 < 100 && cells[x-1][y+1]) liveCells++;
  if (x-1 >= 0 && y-1 >= 0 && cells[x-1][y-1]) liveCells++;

  if (x+1 < 100 && cells[x+1][y]) liveCells++;
  if (x+1 < 100 && y+1 < 100 && cells[x+1][y+1]) liveCells++;
  if (x+1 < 100 && y-1 >= 0 &&  cells[x+1][y-1]) liveCells++;

  if (y-1 >= 0 && cells[x][y-1]) liveCells++;
  if (y+1 < 100 && cells[x][y+1]) liveCells++;

  return liveCells;
}

void drawCells() {
  background(200, 200, 200);

  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      fill(0);
      if (cells[i][j]) rect(10*i-250, 10*j-250, 10, 10);
    }
  }

  stroke(0, 0, 0, 100);
  for (int i = 0; i < width; i+=10) {
    line(i, 0, i, height);
    line(0, i, width, i);
  }
}

void mouseClicked() {
  int i = floor((mouseX+250)/10); 
  int j = floor((mouseY+250)/10);
  cells[i][j] = !cells[i][j];

  syncNextCells();

  drawCells();
}

void keyPressed() {
  if (key == ' ') paused = !paused;

  if (key == 'r') initializeCells();

  if (key == 'c') clearCells();

  if (key == 'p') printCells();
  
  if (key == 'g') makeGun();
}

void syncCells() {
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      cells[i][j] = nextCells[i][j];
    }
  }
}

void syncNextCells() {
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      nextCells[i][j] = cells[i][j];
    }
  }
}

void clearCells() {
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      cells[i][j] = false;
    }
  }
  syncNextCells();
  drawCells();
}

void printCells() {
  println("\n");

  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      if (cells[i][j]) println("cells[" + i + "][" + j + "] = true;");
    }
  }
}

void makeGun() {
  cells[29][32] = true;
  cells[29][33] = true;
  cells[30][32] = true;
  cells[30][33] = true;
  cells[39][32] = true;
  cells[39][33] = true;
  cells[39][34] = true;
  cells[40][31] = true;
  cells[40][35] = true;
  cells[41][30] = true;
  cells[41][36] = true;
  cells[42][30] = true;
  cells[42][36] = true;
  cells[43][33] = true;
  cells[44][31] = true;
  cells[44][35] = true;
  cells[45][32] = true;
  cells[45][33] = true;
  cells[45][34] = true;
  cells[46][33] = true;
  cells[49][30] = true;
  cells[49][31] = true;
  cells[49][32] = true;
  cells[50][30] = true;
  cells[50][31] = true;
  cells[50][32] = true;
  cells[51][29] = true;
  cells[51][33] = true;
  cells[53][28] = true;
  cells[53][29] = true;
  cells[53][33] = true;
  cells[53][34] = true;
  cells[63][30] = true;
  cells[63][31] = true;
  cells[64][30] = true;
  cells[64][31] = true;
  
  syncNextCells();
  drawCells();
}

