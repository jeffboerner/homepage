
void loadGraph(int graph, int column) {

  if(column != 1 || graph != 9){
  iMatrix = new boolean[100][100];
  }

  // This is unnecessary here, right?
  foundEdge = new boolean[100][100];

  if (column == 0) {

    switch(graph) {

    case 0:

      ////////
      // Figure 1.2 Graph

      verticesX = new int[5];
      verticesY = new int[5];

      verticesX[0] = 94;
      verticesX[1] = 149;
      verticesX[2] = 342;
      verticesX[3] = 479;
      verticesX[4] = 340;

      verticesY[0] = 136;
      verticesY[1] = 323;
      verticesY[2] = 326;
      verticesY[3] = 190;
      verticesY[4] = 126;

      iMatrix[0][0] = false;

      iMatrix[0][1] = true;

      iMatrix[0][2] = false;

      iMatrix[0][3] = false;

      iMatrix[0][4] = true;

      iMatrix[1][0] = true;

      iMatrix[1][1] = false;

      iMatrix[1][2] = true;

      iMatrix[1][3] = true;

      iMatrix[1][4] = true;

      iMatrix[2][0] = false;

      iMatrix[2][1] = true;

      iMatrix[2][2] = false;

      iMatrix[2][3] = true;

      iMatrix[2][4] = true;

      iMatrix[3][0] = false;

      iMatrix[3][1] = true;

      iMatrix[3][2] = true;

      iMatrix[3][3] = false;

      iMatrix[3][4] = true;

      iMatrix[4][0] = true;

      iMatrix[4][1] = true;

      iMatrix[4][2] = true;

      iMatrix[4][3] = true;

      iMatrix[4][4] = false;


      break;

      //Figure 1.8

    case 1: 

      verticesX = new int[10];
      verticesY = new int[10];

      int adjust = 60;

      verticesX[0] = 31 + adjust;
      verticesX[1] = 31 + adjust;
      verticesX[2] = 115 + adjust;
      verticesX[3] = 115 + adjust;
      verticesX[4] = 220 + adjust;
      verticesX[5] = 220 + adjust;
      verticesX[6] = 315 + adjust;
      verticesX[7] = 315 + adjust;
      verticesX[8] = 170 + adjust;
      verticesX[9] = 170 + adjust;


      verticesY[0] = 179;
      verticesY[1] = 300;
      verticesY[2] = 179;
      verticesY[3] = 300;
      verticesY[4] = 179;
      verticesY[5] = 300;
      verticesY[6] = 179;
      verticesY[7] = 300;
      verticesY[8] = 400;
      verticesY[9] = 76;

      iMatrix[0][0] = false;

      iMatrix[0][1] = true;

      iMatrix[0][2] = true;

      iMatrix[0][3] = false;

      iMatrix[0][4] = false;

      iMatrix[0][5] = false;

      iMatrix[0][6] = false;

      iMatrix[0][7] = false;

      iMatrix[0][8] = false;

      iMatrix[0][9] = false;

      iMatrix[1][0] = true;

      iMatrix[1][1] = false;

      iMatrix[1][2] = false;

      iMatrix[1][3] = true;

      iMatrix[1][4] = false;

      iMatrix[1][5] = false;

      iMatrix[1][6] = false;

      iMatrix[1][7] = false;

      iMatrix[1][8] = false;

      iMatrix[1][9] = false;

      iMatrix[2][0] = true;

      iMatrix[2][1] = false;

      iMatrix[2][2] = false;

      iMatrix[2][3] = true;

      iMatrix[2][4] = true;

      iMatrix[2][5] = false;
      foundEdge[2][5] = false;
      iMatrix[2][6] = false;
      foundEdge[2][6] = false;
      iMatrix[2][7] = false;
      foundEdge[2][7] = false;
      iMatrix[2][8] = false;
      foundEdge[2][8] = false;
      iMatrix[2][9] = true;
      foundEdge[2][9] = true;
      iMatrix[3][0] = false;
      foundEdge[3][0] = false;
      iMatrix[3][1] = true;
      foundEdge[3][1] = true;
      iMatrix[3][2] = true;
      foundEdge[3][2] = true;
      iMatrix[3][3] = false;
      foundEdge[3][3] = false;
      iMatrix[3][4] = false;
      foundEdge[3][4] = false;
      iMatrix[3][5] = true;
      foundEdge[3][5] = true;
      iMatrix[3][6] = false;
      foundEdge[3][6] = false;
      iMatrix[3][7] = false;
      foundEdge[3][7] = false;
      iMatrix[3][8] = true;
      foundEdge[3][8] = true;
      iMatrix[3][9] = false;
      foundEdge[3][9] = false;
      iMatrix[4][0] = false;
      foundEdge[4][0] = false;
      iMatrix[4][1] = false;
      foundEdge[4][1] = false;
      iMatrix[4][2] = true;
      foundEdge[4][2] = true;
      iMatrix[4][3] = false;
      foundEdge[4][3] = false;
      iMatrix[4][4] = false;
      foundEdge[4][4] = false;
      iMatrix[4][5] = true;
      foundEdge[4][5] = true;
      iMatrix[4][6] = true;
      foundEdge[4][6] = true;
      iMatrix[4][7] = false;
      foundEdge[4][7] = false;
      iMatrix[4][8] = false;
      foundEdge[4][8] = false;
      iMatrix[4][9] = true;
      foundEdge[4][9] = true;
      iMatrix[5][0] = false;
      foundEdge[5][0] = false;
      iMatrix[5][1] = false;
      foundEdge[5][1] = false;
      iMatrix[5][2] = false;
      foundEdge[5][2] = false;
      iMatrix[5][3] = true;
      foundEdge[5][3] = true;
      iMatrix[5][4] = true;
      foundEdge[5][4] = true;
      iMatrix[5][5] = false;
      foundEdge[5][5] = false;
      iMatrix[5][6] = false;
      foundEdge[5][6] = false;
      iMatrix[5][7] = true;
      foundEdge[5][7] = true;
      iMatrix[5][8] = true;
      foundEdge[5][8] = true;
      iMatrix[5][9] = false;
      foundEdge[5][9] = false;
      iMatrix[6][0] = false;
      foundEdge[6][0] = false;
      iMatrix[6][1] = false;
      foundEdge[6][1] = false;
      iMatrix[6][2] = false;
      foundEdge[6][2] = false;
      iMatrix[6][3] = false;
      foundEdge[6][3] = false;
      iMatrix[6][4] = true;
      foundEdge[6][4] = true;
      iMatrix[6][5] = false;
      foundEdge[6][5] = false;
      iMatrix[6][6] = false;
      foundEdge[6][6] = false;
      iMatrix[6][7] = true;
      foundEdge[6][7] = true;
      iMatrix[6][8] = false;
      foundEdge[6][8] = false;
      iMatrix[6][9] = false;
      foundEdge[6][9] = false;
      iMatrix[7][0] = false;
      foundEdge[7][0] = false;
      iMatrix[7][1] = false;
      foundEdge[7][1] = false;
      iMatrix[7][2] = false;
      foundEdge[7][2] = false;
      iMatrix[7][3] = false;
      foundEdge[7][3] = false;
      iMatrix[7][4] = false;
      foundEdge[7][4] = false;
      iMatrix[7][5] = true;
      foundEdge[7][5] = true;
      iMatrix[7][6] = true;
      foundEdge[7][6] = true;
      iMatrix[7][7] = false;
      foundEdge[7][7] = false;
      iMatrix[7][8] = false;
      foundEdge[7][8] = false;
      iMatrix[7][9] = false;
      foundEdge[7][9] = false;
      iMatrix[8][0] = false;
      foundEdge[8][0] = false;
      iMatrix[8][1] = false;
      foundEdge[8][1] = false;
      iMatrix[8][2] = false;
      foundEdge[8][2] = false;
      iMatrix[8][3] = true;
      foundEdge[8][3] = true;
      iMatrix[8][4] = false;
      foundEdge[8][4] = false;
      iMatrix[8][5] = true;
      foundEdge[8][5] = true;
      iMatrix[8][6] = false;
      foundEdge[8][6] = false;
      iMatrix[8][7] = false;
      foundEdge[8][7] = false;
      iMatrix[8][8] = false;
      foundEdge[8][8] = false;
      iMatrix[8][9] = false;
      foundEdge[8][9] = false;
      iMatrix[9][0] = false;
      foundEdge[9][0] = false;
      iMatrix[9][1] = false;
      foundEdge[9][1] = false;
      iMatrix[9][2] = true;
      foundEdge[9][2] = true;
      iMatrix[9][3] = false;
      foundEdge[9][3] = false;
      iMatrix[9][4] = true;
      foundEdge[9][4] = true;
      iMatrix[9][5] = false;
      foundEdge[9][5] = false;
      iMatrix[9][6] = false;
      foundEdge[9][6] = false;
      iMatrix[9][7] = false;
      foundEdge[9][7] = false;
      iMatrix[9][8] = false;
      foundEdge[9][8] = false;
      iMatrix[9][9] = false;
      foundEdge[9][9] = false;

      break;

      // Figure 1.13

    case 2:

      verticesX = new int[10];
      verticesY = new int[10];


      verticesX[0] = 64;
      verticesX[1] = 64;
      verticesX[2] = 175;
      verticesX[3] = 175;
      verticesX[4] = 290;
      verticesX[5] = 290;
      verticesX[6] = 421;
      verticesX[7] = 421;
      verticesX[8] = 217;
      verticesX[9] = 132;


      verticesY[0] = 190;
      verticesY[1] = 300;
      verticesY[2] = 300;
      verticesY[3] = 190;
      verticesY[4] = 190;
      verticesY[5] = 300;
      verticesY[6] = 300;
      verticesY[7] = 190;
      verticesY[8] = 245;
      verticesY[9] = 245;

      iMatrix[0][0] = false;
      foundEdge[0][0] = false;
      iMatrix[0][1] = true;
      foundEdge[0][1] = true;
      iMatrix[0][2] = false;
      foundEdge[0][2] = false;
      iMatrix[0][3] = true;
      foundEdge[0][3] = true;
      iMatrix[0][4] = false;
      foundEdge[0][4] = false;
      iMatrix[0][5] = false;
      foundEdge[0][5] = false;
      iMatrix[0][6] = false;
      foundEdge[0][6] = false;
      iMatrix[0][7] = false;
      foundEdge[0][7] = false;
      iMatrix[0][8] = false;
      foundEdge[0][8] = false;
      iMatrix[0][9] = false;
      foundEdge[0][9] = false;
      iMatrix[1][0] = true;
      foundEdge[1][0] = true;
      iMatrix[1][1] = false;
      foundEdge[1][1] = false;
      iMatrix[1][2] = true;
      foundEdge[1][2] = true;
      iMatrix[1][3] = false;
      foundEdge[1][3] = false;
      iMatrix[1][4] = false;
      foundEdge[1][4] = false;
      iMatrix[1][5] = false;
      foundEdge[1][5] = false;
      iMatrix[1][6] = false;
      foundEdge[1][6] = false;
      iMatrix[1][7] = false;
      foundEdge[1][7] = false;
      iMatrix[1][8] = false;
      foundEdge[1][8] = false;
      iMatrix[1][9] = false;
      foundEdge[1][9] = false;
      iMatrix[2][0] = false;
      foundEdge[2][0] = false;
      iMatrix[2][1] = true;
      foundEdge[2][1] = true;
      iMatrix[2][2] = false;
      foundEdge[2][2] = false;
      iMatrix[2][3] = false;
      foundEdge[2][3] = false;
      iMatrix[2][4] = false;
      foundEdge[2][4] = false;
      iMatrix[2][5] = true;
      foundEdge[2][5] = true;
      iMatrix[2][6] = false;
      foundEdge[2][6] = false;
      iMatrix[2][7] = false;
      foundEdge[2][7] = false;
      iMatrix[2][8] = true;
      foundEdge[2][8] = true;
      iMatrix[2][9] = true;
      foundEdge[2][9] = true;
      iMatrix[3][0] = true;
      foundEdge[3][0] = true;
      iMatrix[3][1] = false;
      foundEdge[3][1] = false;
      iMatrix[3][2] = false;
      foundEdge[3][2] = false;
      iMatrix[3][3] = false;
      foundEdge[3][3] = false;
      iMatrix[3][4] = true;
      foundEdge[3][4] = true;
      iMatrix[3][5] = false;
      foundEdge[3][5] = false;
      iMatrix[3][6] = false;
      foundEdge[3][6] = false;
      iMatrix[3][7] = false;
      foundEdge[3][7] = false;
      iMatrix[3][8] = true;
      foundEdge[3][8] = true;
      iMatrix[3][9] = true;
      foundEdge[3][9] = true;
      iMatrix[4][0] = false;
      foundEdge[4][0] = false;
      iMatrix[4][1] = false;
      foundEdge[4][1] = false;
      iMatrix[4][2] = false;
      foundEdge[4][2] = false;
      iMatrix[4][3] = true;
      foundEdge[4][3] = true;
      iMatrix[4][4] = false;
      foundEdge[4][4] = false;
      iMatrix[4][5] = true;
      foundEdge[4][5] = true;
      iMatrix[4][6] = false;
      foundEdge[4][6] = false;
      iMatrix[4][7] = true;
      foundEdge[4][7] = true;
      iMatrix[4][8] = false;
      foundEdge[4][8] = false;
      iMatrix[4][9] = false;
      foundEdge[4][9] = false;
      iMatrix[5][0] = false;
      foundEdge[5][0] = false;
      iMatrix[5][1] = false;
      foundEdge[5][1] = false;
      iMatrix[5][2] = true;
      foundEdge[5][2] = true;
      iMatrix[5][3] = false;
      foundEdge[5][3] = false;
      iMatrix[5][4] = true;
      foundEdge[5][4] = true;
      iMatrix[5][5] = false;
      foundEdge[5][5] = false;
      iMatrix[5][6] = true;
      foundEdge[5][6] = true;
      iMatrix[5][7] = false;
      foundEdge[5][7] = false;
      iMatrix[5][8] = false;
      foundEdge[5][8] = false;
      iMatrix[5][9] = false;
      foundEdge[5][9] = false;
      iMatrix[6][0] = false;
      foundEdge[6][0] = false;
      iMatrix[6][1] = false;
      foundEdge[6][1] = false;
      iMatrix[6][2] = false;
      foundEdge[6][2] = false;
      iMatrix[6][3] = false;
      foundEdge[6][3] = false;
      iMatrix[6][4] = false;
      foundEdge[6][4] = false;
      iMatrix[6][5] = true;
      foundEdge[6][5] = true;
      iMatrix[6][6] = false;
      foundEdge[6][6] = false;
      iMatrix[6][7] = true;
      foundEdge[6][7] = true;
      iMatrix[6][8] = false;
      foundEdge[6][8] = false;
      iMatrix[6][9] = false;
      foundEdge[6][9] = false;
      iMatrix[7][0] = false;
      foundEdge[7][0] = false;
      iMatrix[7][1] = false;
      foundEdge[7][1] = false;
      iMatrix[7][2] = false;
      foundEdge[7][2] = false;
      iMatrix[7][3] = false;
      foundEdge[7][3] = false;
      iMatrix[7][4] = true;
      foundEdge[7][4] = true;
      iMatrix[7][5] = false;
      foundEdge[7][5] = false;
      iMatrix[7][6] = true;
      foundEdge[7][6] = true;
      iMatrix[7][7] = false;
      foundEdge[7][7] = false;
      iMatrix[7][8] = false;
      foundEdge[7][8] = false;
      iMatrix[7][9] = false;
      foundEdge[7][9] = false;
      iMatrix[8][0] = false;
      foundEdge[8][0] = false;
      iMatrix[8][1] = false;
      foundEdge[8][1] = false;
      iMatrix[8][2] = true;
      foundEdge[8][2] = true;
      iMatrix[8][3] = true;
      foundEdge[8][3] = true;
      iMatrix[8][4] = false;
      foundEdge[8][4] = false;
      iMatrix[8][5] = false;
      foundEdge[8][5] = false;
      iMatrix[8][6] = false;
      foundEdge[8][6] = false;
      iMatrix[8][7] = false;
      foundEdge[8][7] = false;
      iMatrix[8][8] = false;
      foundEdge[8][8] = false;
      iMatrix[8][9] = false;
      foundEdge[8][9] = false;
      iMatrix[9][0] = false;
      foundEdge[9][0] = false;
      iMatrix[9][1] = false;
      foundEdge[9][1] = false;
      iMatrix[9][2] = true;
      foundEdge[9][2] = true;
      iMatrix[9][3] = true;
      foundEdge[9][3] = true;
      iMatrix[9][4] = false;
      foundEdge[9][4] = false;
      iMatrix[9][5] = false;
      foundEdge[9][5] = false;
      iMatrix[9][6] = false;
      foundEdge[9][6] = false;
      iMatrix[9][7] = false;
      foundEdge[9][7] = false;
      iMatrix[9][8] = false;
      foundEdge[9][8] = false;
      iMatrix[9][9] = false;
      foundEdge[9][9] = false;

      break;

    case 3:

      //Figure 1.9

      verticesX = new int[18];
      verticesY = new int[18];


      verticesX[0] = 86;
      verticesX[1] = 86;
      verticesX[2] = 156;
      verticesX[3] = 156;
      verticesX[4] = 156;
      verticesX[5] = 256;
      verticesX[6] = 256;
      verticesX[7] = 256;
      verticesX[8] = 256;
      verticesX[9] = 156;
      verticesX[10] = 374;
      verticesX[11] = 374;
      verticesX[12] = 447;
      verticesX[13] = 447;
      verticesX[14] = 447;
      verticesX[15] = 374;
      verticesX[16] = 481;
      verticesX[17] = 481;


      verticesY[0] = 188;
      verticesY[1] = 262;
      verticesY[2] = 262;
      verticesY[3] = 188;
      verticesY[4] = 116;
      verticesY[5] = 116;
      verticesY[6] = 188;
      verticesY[7] = 262;
      verticesY[8] = 344;
      verticesY[9] = 344;
      verticesY[10] = 188;
      verticesY[11] = 116;
      verticesY[12] = 116;
      verticesY[13] = 188;
      verticesY[14] = 262;
      verticesY[15] = 262;
      verticesY[16] = 344;
      verticesY[17] = 262;


      iMatrix[0][0] = false;
      iMatrix[0][1] = true;
      iMatrix[0][2] = false;
      iMatrix[0][3] = true;
      iMatrix[0][4] = false;
      iMatrix[0][5] = false;
      iMatrix[0][6] = false;
      iMatrix[0][7] = false;
      iMatrix[0][8] = false;
      iMatrix[0][9] = false;
      iMatrix[0][10] = false;
      iMatrix[0][11] = false;
      iMatrix[0][12] = false;
      iMatrix[0][13] = false;
      iMatrix[0][14] = false;
      iMatrix[0][15] = false;
      iMatrix[0][16] = false;
      iMatrix[0][17] = false;
      iMatrix[1][0] = true;
      iMatrix[1][1] = false;
      iMatrix[1][2] = true;
      iMatrix[1][3] = false;
      iMatrix[1][4] = false;
      iMatrix[1][5] = false;
      iMatrix[1][6] = false;
      iMatrix[1][7] = false;
      iMatrix[1][8] = false;
      iMatrix[1][9] = false;
      iMatrix[1][10] = false;
      iMatrix[1][11] = false;
      iMatrix[1][12] = false;
      iMatrix[1][13] = false;
      iMatrix[1][14] = false;
      iMatrix[1][15] = false;
      iMatrix[1][16] = false;
      iMatrix[1][17] = false;
      iMatrix[2][0] = false;
      iMatrix[2][1] = true;
      iMatrix[2][2] = false;
      iMatrix[2][3] = true;
      iMatrix[2][4] = false;
      iMatrix[2][5] = false;
      iMatrix[2][6] = false;
      iMatrix[2][7] = true;
      iMatrix[2][8] = false;
      iMatrix[2][9] = true;
      iMatrix[2][10] = false;
      iMatrix[2][11] = false;
      iMatrix[2][12] = false;
      iMatrix[2][13] = false;
      iMatrix[2][14] = false;
      iMatrix[2][15] = false;
      iMatrix[2][16] = false;
      iMatrix[2][17] = false;
      iMatrix[3][0] = true;
      iMatrix[3][1] = false;
      iMatrix[3][2] = true;
      iMatrix[3][3] = false;
      iMatrix[3][4] = true;
      iMatrix[3][5] = false;
      iMatrix[3][6] = true;
      iMatrix[3][7] = false;
      iMatrix[3][8] = false;
      iMatrix[3][9] = false;
      iMatrix[3][10] = false;
      iMatrix[3][11] = false;
      iMatrix[3][12] = false;
      iMatrix[3][13] = false;
      iMatrix[3][14] = false;
      iMatrix[3][15] = false;
      iMatrix[3][16] = false;
      iMatrix[3][17] = false;
      iMatrix[4][0] = false;
      iMatrix[4][1] = false;
      iMatrix[4][2] = false;
      iMatrix[4][3] = true;
      iMatrix[4][4] = false;
      iMatrix[4][5] = true;
      iMatrix[4][6] = false;
      iMatrix[4][7] = false;
      iMatrix[4][8] = false;
      iMatrix[4][9] = false;
      iMatrix[4][10] = false;
      iMatrix[4][11] = false;
      iMatrix[4][12] = false;
      iMatrix[4][13] = false;
      iMatrix[4][14] = false;
      iMatrix[4][15] = false;
      iMatrix[4][16] = false;
      iMatrix[4][17] = false;
      iMatrix[5][0] = false;
      iMatrix[5][1] = false;
      iMatrix[5][2] = false;
      iMatrix[5][3] = false;
      iMatrix[5][4] = true;
      iMatrix[5][5] = false;
      iMatrix[5][6] = true;
      iMatrix[5][7] = false;
      iMatrix[5][8] = false;
      iMatrix[5][9] = false;
      iMatrix[5][10] = false;
      iMatrix[5][11] = false;
      iMatrix[5][12] = false;
      iMatrix[5][13] = false;
      iMatrix[5][14] = false;
      iMatrix[5][15] = false;
      iMatrix[5][16] = false;
      iMatrix[5][17] = false;
      iMatrix[6][0] = false;
      iMatrix[6][1] = false;
      iMatrix[6][2] = false;
      iMatrix[6][3] = true;
      iMatrix[6][4] = false;
      iMatrix[6][5] = true;
      iMatrix[6][6] = false;
      iMatrix[6][7] = true;
      iMatrix[6][8] = false;
      iMatrix[6][9] = false;
      iMatrix[6][10] = true;
      iMatrix[6][11] = false;
      iMatrix[6][12] = false;
      iMatrix[6][13] = false;
      iMatrix[6][14] = false;
      iMatrix[6][15] = false;
      iMatrix[6][16] = false;
      iMatrix[6][17] = false;
      iMatrix[7][0] = false;
      iMatrix[7][1] = false;
      iMatrix[7][2] = true;
      iMatrix[7][3] = false;
      iMatrix[7][4] = false;
      iMatrix[7][5] = false;
      iMatrix[7][6] = true;
      iMatrix[7][7] = false;
      iMatrix[7][8] = true;
      iMatrix[7][9] = false;
      iMatrix[7][10] = false;
      iMatrix[7][11] = false;
      iMatrix[7][12] = false;
      iMatrix[7][13] = false;
      iMatrix[7][14] = false;
      iMatrix[7][15] = true;
      iMatrix[7][16] = false;
      iMatrix[7][17] = false;
      iMatrix[8][0] = false;
      iMatrix[8][1] = false;
      iMatrix[8][2] = false;
      iMatrix[8][3] = false;
      iMatrix[8][4] = false;
      iMatrix[8][5] = false;
      iMatrix[8][6] = false;
      iMatrix[8][7] = true;
      iMatrix[8][8] = false;
      iMatrix[8][9] = true;
      iMatrix[8][10] = false;
      iMatrix[8][11] = false;
      iMatrix[8][12] = false;
      iMatrix[8][13] = false;
      iMatrix[8][14] = false;
      iMatrix[8][15] = false;
      iMatrix[8][16] = false;
      iMatrix[8][17] = false;
      iMatrix[9][0] = false;
      iMatrix[9][1] = false;
      iMatrix[9][2] = true;
      iMatrix[9][3] = false;
      iMatrix[9][4] = false;
      iMatrix[9][5] = false;
      iMatrix[9][6] = false;
      iMatrix[9][7] = false;
      iMatrix[9][8] = true;
      iMatrix[9][9] = false;
      iMatrix[9][10] = false;
      iMatrix[9][11] = false;
      iMatrix[9][12] = false;
      iMatrix[9][13] = false;
      iMatrix[9][14] = false;
      iMatrix[9][15] = false;
      iMatrix[9][16] = false;
      iMatrix[9][17] = false;
      iMatrix[10][0] = false;
      iMatrix[10][1] = false;
      iMatrix[10][2] = false;
      iMatrix[10][3] = false;
      iMatrix[10][4] = false;
      iMatrix[10][5] = false;
      iMatrix[10][6] = true;
      iMatrix[10][7] = false;
      iMatrix[10][8] = false;
      iMatrix[10][9] = false;
      iMatrix[10][10] = false;
      iMatrix[10][11] = true;
      iMatrix[10][12] = false;
      iMatrix[10][13] = true;
      iMatrix[10][14] = false;
      iMatrix[10][15] = true;
      iMatrix[10][16] = false;
      iMatrix[10][17] = false;
      iMatrix[11][0] = false;
      iMatrix[11][1] = false;
      iMatrix[11][2] = false;
      iMatrix[11][3] = false;
      iMatrix[11][4] = false;
      iMatrix[11][5] = false;
      iMatrix[11][6] = false;
      iMatrix[11][7] = false;
      iMatrix[11][8] = false;
      iMatrix[11][9] = false;
      iMatrix[11][10] = true;
      iMatrix[11][11] = false;
      iMatrix[11][12] = true;
      iMatrix[11][13] = false;
      iMatrix[11][14] = false;
      iMatrix[11][15] = false;
      iMatrix[11][16] = false;
      iMatrix[11][17] = false;
      iMatrix[12][0] = false;
      iMatrix[12][1] = false;
      iMatrix[12][2] = false;
      iMatrix[12][3] = false;
      iMatrix[12][4] = false;
      iMatrix[12][5] = false;
      iMatrix[12][6] = false;
      iMatrix[12][7] = false;
      iMatrix[12][8] = false;
      iMatrix[12][9] = false;
      iMatrix[12][10] = false;
      iMatrix[12][11] = true;
      iMatrix[12][12] = false;
      iMatrix[12][13] = true;
      iMatrix[12][14] = false;
      iMatrix[12][15] = false;
      iMatrix[12][16] = false;
      iMatrix[12][17] = false;
      iMatrix[13][0] = false;
      iMatrix[13][1] = false;
      iMatrix[13][2] = false;
      iMatrix[13][3] = false;
      iMatrix[13][4] = false;
      iMatrix[13][5] = false;
      iMatrix[13][6] = false;
      iMatrix[13][7] = false;
      iMatrix[13][8] = false;
      iMatrix[13][9] = false;
      iMatrix[13][10] = true;
      iMatrix[13][11] = false;
      iMatrix[13][12] = true;
      iMatrix[13][13] = false;
      iMatrix[13][14] = true;
      iMatrix[13][15] = true;
      iMatrix[13][16] = false;
      iMatrix[13][17] = false;
      iMatrix[14][0] = false;
      iMatrix[14][1] = false;
      iMatrix[14][2] = false;
      iMatrix[14][3] = false;
      iMatrix[14][4] = false;
      iMatrix[14][5] = false;
      iMatrix[14][6] = false;
      iMatrix[14][7] = false;
      iMatrix[14][8] = false;
      iMatrix[14][9] = false;
      iMatrix[14][10] = false;
      iMatrix[14][11] = false;
      iMatrix[14][12] = false;
      iMatrix[14][13] = true;
      iMatrix[14][14] = false;
      iMatrix[14][15] = true;
      iMatrix[14][16] = true;
      iMatrix[14][17] = true;
      iMatrix[15][0] = false;
      iMatrix[15][1] = false;
      iMatrix[15][2] = false;
      iMatrix[15][3] = false;
      iMatrix[15][4] = false;
      iMatrix[15][5] = false;
      iMatrix[15][6] = false;
      iMatrix[15][7] = true;
      iMatrix[15][8] = false;
      iMatrix[15][9] = false;
      iMatrix[15][10] = true;
      iMatrix[15][11] = false;
      iMatrix[15][12] = false;
      iMatrix[15][13] = true;
      iMatrix[15][14] = true;
      iMatrix[15][15] = false;
      iMatrix[15][16] = false;
      iMatrix[15][17] = false;
      iMatrix[16][0] = false;
      iMatrix[16][1] = false;
      iMatrix[16][2] = false;
      iMatrix[16][3] = false;
      iMatrix[16][4] = false;
      iMatrix[16][5] = false;
      iMatrix[16][6] = false;
      iMatrix[16][7] = false;
      iMatrix[16][8] = false;
      iMatrix[16][9] = false;
      iMatrix[16][10] = false;
      iMatrix[16][11] = false;
      iMatrix[16][12] = false;
      iMatrix[16][13] = false;
      iMatrix[16][14] = true;
      iMatrix[16][15] = false;
      iMatrix[16][16] = false;
      iMatrix[16][17] = true;
      iMatrix[17][0] = false;
      iMatrix[17][1] = false;
      iMatrix[17][2] = false;
      iMatrix[17][3] = false;
      iMatrix[17][4] = false;
      iMatrix[17][5] = false;
      iMatrix[17][6] = false;
      iMatrix[17][7] = false;
      iMatrix[17][8] = false;
      iMatrix[17][9] = false;
      iMatrix[17][10] = false;
      iMatrix[17][11] = false;
      iMatrix[17][12] = false;
      iMatrix[17][13] = false;
      iMatrix[17][14] = true;
      iMatrix[17][15] = false;
      iMatrix[17][16] = true;
      iMatrix[17][17] = false;

      break;

    case 4:
      // Figure 1.11


      verticesX = new int[8];
      verticesY = new int[8];


      verticesX[0] = 57;
      verticesX[1] = 159;
      verticesX[2] = 159;
      verticesX[3] = 57;
      verticesX[4] = 249;
      verticesX[5] = 300;
      verticesX[6] = 417;
      verticesX[7] = 282;


      verticesY[0] = 172;
      verticesY[1] = 172;
      verticesY[2] = 297;
      verticesY[3] = 297;
      verticesY[4] = 70;
      verticesY[5] = 131;
      verticesY[6] = 218;
      verticesY[7] = 393;


      iMatrix[0][0] = false;
      iMatrix[0][1] = true;
      iMatrix[0][2] = false;
      iMatrix[0][3] = true;
      iMatrix[0][4] = false;
      iMatrix[0][5] = false;
      iMatrix[0][6] = false;
      iMatrix[0][7] = false;
      iMatrix[1][0] = true;
      iMatrix[1][1] = false;
      iMatrix[1][2] = true;
      iMatrix[1][3] = false;
      iMatrix[1][4] = true;
      iMatrix[1][5] = true;
      iMatrix[1][6] = false;
      iMatrix[1][7] = false;
      iMatrix[2][0] = false;
      iMatrix[2][1] = true;
      iMatrix[2][2] = false;
      iMatrix[2][3] = true;
      iMatrix[2][4] = false;
      iMatrix[2][5] = true;
      iMatrix[2][6] = false;
      iMatrix[2][7] = true;
      iMatrix[3][0] = true;
      iMatrix[3][1] = false;
      iMatrix[3][2] = true;
      iMatrix[3][3] = false;
      iMatrix[3][4] = false;
      iMatrix[3][5] = false;
      iMatrix[3][6] = false;
      iMatrix[3][7] = false;
      iMatrix[4][0] = false;
      iMatrix[4][1] = true;
      iMatrix[4][2] = false;
      iMatrix[4][3] = false;
      iMatrix[4][4] = false;
      iMatrix[4][5] = true;
      iMatrix[4][6] = false;
      iMatrix[4][7] = false;
      iMatrix[5][0] = false;
      iMatrix[5][1] = true;
      iMatrix[5][2] = true;
      iMatrix[5][3] = false;
      iMatrix[5][4] = true;
      iMatrix[5][5] = false;
      iMatrix[5][6] = true;
      iMatrix[5][7] = false;
      iMatrix[6][0] = false;
      iMatrix[6][1] = false;
      iMatrix[6][2] = false;
      iMatrix[6][3] = false;
      iMatrix[6][4] = false;
      iMatrix[6][5] = true;
      iMatrix[6][6] = false;
      iMatrix[6][7] = true;
      iMatrix[7][0] = false;
      iMatrix[7][1] = false;
      iMatrix[7][2] = true;
      iMatrix[7][3] = false;
      iMatrix[7][4] = false;
      iMatrix[7][5] = false;
      iMatrix[7][6] = true;
      iMatrix[7][7] = false;

      break;

    case 5:

      // Figure 1.17

      verticesX = new int[16];
      verticesY = new int[16];


      verticesX[0] = 92;
      verticesX[1] = 92;
      verticesX[2] = 92;
      verticesX[3] = 167;
      verticesX[4] = 167;
      verticesX[5] = 167;
      verticesX[6] = 244;
      verticesX[7] = 244;
      verticesX[8] = 244;
      verticesX[9] = 320;
      verticesX[10] = 320;
      verticesX[11] = 320;
      verticesX[12] = 92;
      verticesX[13] = 167;
      verticesX[14] = 244;
      verticesX[15] = 320;


      verticesY[0] = 181;
      verticesY[1] = 248;
      verticesY[2] = 324;
      verticesY[3] = 324;
      verticesY[4] = 248;
      verticesY[5] = 181;
      verticesY[6] = 181;
      verticesY[7] = 248;
      verticesY[8] = 324;
      verticesY[9] = 324;
      verticesY[10] = 248;
      verticesY[11] = 181;
      verticesY[12] = 386;
      verticesY[13] = 386;
      verticesY[14] = 386;
      verticesY[15] = 386;


      iMatrix[0][0] = false;
      iMatrix[0][1] = true;
      iMatrix[0][2] = false;
      iMatrix[0][3] = false;
      iMatrix[0][4] = false;
      iMatrix[0][5] = true;
      iMatrix[0][6] = false;
      iMatrix[0][7] = false;
      iMatrix[0][8] = false;
      iMatrix[0][9] = false;
      iMatrix[0][10] = false;
      iMatrix[0][11] = false;
      iMatrix[0][12] = false;
      iMatrix[0][13] = false;
      iMatrix[0][14] = false;
      iMatrix[0][15] = false;
      iMatrix[1][0] = true;
      iMatrix[1][1] = false;
      iMatrix[1][2] = true;
      iMatrix[1][3] = false;
      iMatrix[1][4] = true;
      iMatrix[1][5] = false;
      iMatrix[1][6] = false;
      iMatrix[1][7] = false;
      iMatrix[1][8] = false;
      iMatrix[1][9] = false;
      iMatrix[1][10] = false;
      iMatrix[1][11] = false;
      iMatrix[1][12] = false;
      iMatrix[1][13] = false;
      iMatrix[1][14] = false;
      iMatrix[1][15] = false;
      iMatrix[2][0] = false;
      iMatrix[2][1] = true;
      iMatrix[2][2] = false;
      iMatrix[2][3] = true;
      iMatrix[2][4] = false;
      iMatrix[2][5] = false;
      iMatrix[2][6] = false;
      iMatrix[2][7] = false;
      iMatrix[2][8] = false;
      iMatrix[2][9] = false;
      iMatrix[2][10] = false;
      iMatrix[2][11] = false;
      iMatrix[2][12] = true;
      iMatrix[2][13] = false;
      iMatrix[2][14] = false;
      iMatrix[2][15] = false;
      iMatrix[3][0] = false;
      iMatrix[3][1] = false;
      iMatrix[3][2] = true;
      iMatrix[3][3] = false;
      iMatrix[3][4] = true;
      iMatrix[3][5] = false;
      iMatrix[3][6] = false;
      iMatrix[3][7] = false;
      iMatrix[3][8] = true;
      iMatrix[3][9] = false;
      iMatrix[3][10] = false;
      iMatrix[3][11] = false;
      iMatrix[3][12] = false;
      iMatrix[3][13] = true;
      iMatrix[3][14] = false;
      iMatrix[3][15] = false;
      iMatrix[4][0] = false;
      iMatrix[4][1] = true;
      iMatrix[4][2] = false;
      iMatrix[4][3] = true;
      iMatrix[4][4] = false;
      iMatrix[4][5] = true;
      iMatrix[4][6] = false;
      iMatrix[4][7] = true;
      iMatrix[4][8] = false;
      iMatrix[4][9] = false;
      iMatrix[4][10] = false;
      iMatrix[4][11] = false;
      iMatrix[4][12] = false;
      iMatrix[4][13] = false;
      iMatrix[4][14] = false;
      iMatrix[4][15] = false;
      iMatrix[5][0] = true;
      iMatrix[5][1] = false;
      iMatrix[5][2] = false;
      iMatrix[5][3] = false;
      iMatrix[5][4] = true;
      iMatrix[5][5] = false;
      iMatrix[5][6] = true;
      iMatrix[5][7] = false;
      iMatrix[5][8] = false;
      iMatrix[5][9] = false;
      iMatrix[5][10] = false;
      iMatrix[5][11] = false;
      iMatrix[5][12] = false;
      iMatrix[5][13] = false;
      iMatrix[5][14] = false;
      iMatrix[5][15] = false;
      iMatrix[6][0] = false;
      iMatrix[6][1] = false;
      iMatrix[6][2] = false;
      iMatrix[6][3] = false;
      iMatrix[6][4] = false;
      iMatrix[6][5] = true;
      iMatrix[6][6] = false;
      iMatrix[6][7] = true;
      iMatrix[6][8] = false;
      iMatrix[6][9] = false;
      iMatrix[6][10] = false;
      iMatrix[6][11] = true;
      iMatrix[6][12] = false;
      iMatrix[6][13] = false;
      iMatrix[6][14] = false;
      iMatrix[6][15] = false;
      iMatrix[7][0] = false;
      iMatrix[7][1] = false;
      iMatrix[7][2] = false;
      iMatrix[7][3] = false;
      iMatrix[7][4] = true;
      iMatrix[7][5] = false;
      iMatrix[7][6] = true;
      iMatrix[7][7] = false;
      iMatrix[7][8] = true;
      iMatrix[7][9] = false;
      iMatrix[7][10] = true;
      iMatrix[7][11] = false;
      iMatrix[7][12] = false;
      iMatrix[7][13] = false;
      iMatrix[7][14] = false;
      iMatrix[7][15] = false;
      iMatrix[8][0] = false;
      iMatrix[8][1] = false;
      iMatrix[8][2] = false;
      iMatrix[8][3] = true;
      iMatrix[8][4] = false;
      iMatrix[8][5] = false;
      iMatrix[8][6] = false;
      iMatrix[8][7] = true;
      iMatrix[8][8] = false;
      iMatrix[8][9] = true;
      iMatrix[8][10] = false;
      iMatrix[8][11] = false;
      iMatrix[8][12] = false;
      iMatrix[8][13] = false;
      iMatrix[8][14] = true;
      iMatrix[8][15] = false;
      iMatrix[9][0] = false;
      iMatrix[9][1] = false;
      iMatrix[9][2] = false;
      iMatrix[9][3] = false;
      iMatrix[9][4] = false;
      iMatrix[9][5] = false;
      iMatrix[9][6] = false;
      iMatrix[9][7] = false;
      iMatrix[9][8] = true;
      iMatrix[9][9] = false;
      iMatrix[9][10] = true;
      iMatrix[9][11] = false;
      iMatrix[9][12] = false;
      iMatrix[9][13] = false;
      iMatrix[9][14] = false;
      iMatrix[9][15] = true;
      iMatrix[10][0] = false;
      iMatrix[10][1] = false;
      iMatrix[10][2] = false;
      iMatrix[10][3] = false;
      iMatrix[10][4] = false;
      iMatrix[10][5] = false;
      iMatrix[10][6] = false;
      iMatrix[10][7] = true;
      iMatrix[10][8] = false;
      iMatrix[10][9] = true;
      iMatrix[10][10] = false;
      iMatrix[10][11] = true;
      iMatrix[10][12] = false;
      iMatrix[10][13] = false;
      iMatrix[10][14] = false;
      iMatrix[10][15] = false;
      iMatrix[11][0] = false;
      iMatrix[11][1] = false;
      iMatrix[11][2] = false;
      iMatrix[11][3] = false;
      iMatrix[11][4] = false;
      iMatrix[11][5] = false;
      iMatrix[11][6] = true;
      iMatrix[11][7] = false;
      iMatrix[11][8] = false;
      iMatrix[11][9] = false;
      iMatrix[11][10] = true;
      iMatrix[11][11] = false;
      iMatrix[11][12] = false;
      iMatrix[11][13] = false;
      iMatrix[11][14] = false;
      iMatrix[11][15] = false;
      iMatrix[12][0] = false;
      iMatrix[12][1] = false;
      iMatrix[12][2] = true;
      iMatrix[12][3] = false;
      iMatrix[12][4] = false;
      iMatrix[12][5] = false;
      iMatrix[12][6] = false;
      iMatrix[12][7] = false;
      iMatrix[12][8] = false;
      iMatrix[12][9] = false;
      iMatrix[12][10] = false;
      iMatrix[12][11] = false;
      iMatrix[12][12] = false;
      iMatrix[12][13] = true;
      iMatrix[12][14] = false;
      iMatrix[12][15] = false;
      iMatrix[13][0] = false;
      iMatrix[13][1] = false;
      iMatrix[13][2] = false;
      iMatrix[13][3] = true;
      iMatrix[13][4] = false;
      iMatrix[13][5] = false;
      iMatrix[13][6] = false;
      iMatrix[13][7] = false;
      iMatrix[13][8] = false;
      iMatrix[13][9] = false;
      iMatrix[13][10] = false;
      iMatrix[13][11] = false;
      iMatrix[13][12] = true;
      iMatrix[13][13] = false;
      iMatrix[13][14] = true;
      iMatrix[13][15] = false;
      iMatrix[14][0] = false;
      iMatrix[14][1] = false;
      iMatrix[14][2] = false;
      iMatrix[14][3] = false;
      iMatrix[14][4] = false;
      iMatrix[14][5] = false;
      iMatrix[14][6] = false;
      iMatrix[14][7] = false;
      iMatrix[14][8] = true;
      iMatrix[14][9] = false;
      iMatrix[14][10] = false;
      iMatrix[14][11] = false;
      iMatrix[14][12] = false;
      iMatrix[14][13] = true;
      iMatrix[14][14] = false;
      iMatrix[14][15] = true;
      iMatrix[15][0] = false;
      iMatrix[15][1] = false;
      iMatrix[15][2] = false;
      iMatrix[15][3] = false;
      iMatrix[15][4] = false;
      iMatrix[15][5] = false;
      iMatrix[15][6] = false;
      iMatrix[15][7] = false;
      iMatrix[15][8] = false;
      iMatrix[15][9] = true;
      iMatrix[15][10] = false;
      iMatrix[15][11] = false;
      iMatrix[15][12] = false;
      iMatrix[15][13] = false;
      iMatrix[15][14] = true;
      iMatrix[15][15] = false;

      break;

    case 6:
      // Figure 1.18

      verticesX = new int[31];
      verticesY = new int[31];


      verticesX[0] = 51;
      verticesX[1] = 107;
      verticesX[2] = 167;
      verticesX[3] = 167;
      verticesX[4] = 226;
      verticesX[5] = 287;
      verticesX[6] = 287;
      verticesX[7] = 355;
      verticesX[8] = 355;
      verticesX[9] = 287;
      verticesX[10] = 226;
      verticesX[11] = 167;
      verticesX[12] = 107;
      verticesX[13] = 51;
      verticesX[14] = 226;
      verticesX[15] = 107;
      verticesX[16] = 167;
      verticesX[17] = 226;
      verticesX[18] = 287;
      verticesX[19] = 355;
      verticesX[20] = 355;
      verticesX[21] = 287;
      verticesX[22] = 226;
      verticesX[23] = 167;
      verticesX[24] = 51;
      verticesX[25] = 51;
      verticesX[26] = 107;
      verticesX[27] = 107;
      verticesX[28] = 167;
      verticesX[29] = 226;
      verticesX[30] = 287;


      verticesY[0] = 161;
      verticesY[1] = 161;
      verticesY[2] = 161;
      verticesY[3] = 103;
      verticesY[4] = 103;
      verticesY[5] = 103;
      verticesY[6] = 161;
      verticesY[7] = 161;
      verticesY[8] = 208;
      verticesY[9] = 208;
      verticesY[10] = 208;
      verticesY[11] = 208;
      verticesY[12] = 208;
      verticesY[13] = 208;
      verticesY[14] = 161;
      verticesY[15] = 253;
      verticesY[16] = 253;
      verticesY[17] = 253;
      verticesY[18] = 253;
      verticesY[19] = 253;
      verticesY[20] = 306;
      verticesY[21] = 306;
      verticesY[22] = 306;
      verticesY[23] = 306;
      verticesY[24] = 253;
      verticesY[25] = 306;
      verticesY[26] = 306;
      verticesY[27] = 352;
      verticesY[28] = 352;
      verticesY[29] = 352;
      verticesY[30] = 352;


      iMatrix[0][0] = false;
      iMatrix[0][1] = true;
      iMatrix[0][2] = false;
      iMatrix[0][3] = false;
      iMatrix[0][4] = false;
      iMatrix[0][5] = false;
      iMatrix[0][6] = false;
      iMatrix[0][7] = false;
      iMatrix[0][8] = false;
      iMatrix[0][9] = false;
      iMatrix[0][10] = false;
      iMatrix[0][11] = false;
      iMatrix[0][12] = false;
      iMatrix[0][13] = true;
      iMatrix[0][14] = false;
      iMatrix[0][15] = false;
      iMatrix[0][16] = false;
      iMatrix[0][17] = false;
      iMatrix[0][18] = false;
      iMatrix[0][19] = false;
      iMatrix[0][20] = false;
      iMatrix[0][21] = false;
      iMatrix[0][22] = false;
      iMatrix[0][23] = false;
      iMatrix[0][24] = false;
      iMatrix[0][25] = false;
      iMatrix[0][26] = false;
      iMatrix[0][27] = false;
      iMatrix[0][28] = false;
      iMatrix[0][29] = false;
      iMatrix[0][30] = false;
      iMatrix[1][0] = true;
      iMatrix[1][1] = false;
      iMatrix[1][2] = true;
      iMatrix[1][3] = false;
      iMatrix[1][4] = false;
      iMatrix[1][5] = false;
      iMatrix[1][6] = false;
      iMatrix[1][7] = false;
      iMatrix[1][8] = false;
      iMatrix[1][9] = false;
      iMatrix[1][10] = false;
      iMatrix[1][11] = false;
      iMatrix[1][12] = true;
      iMatrix[1][13] = false;
      iMatrix[1][14] = false;
      iMatrix[1][15] = false;
      iMatrix[1][16] = false;
      iMatrix[1][17] = false;
      iMatrix[1][18] = false;
      iMatrix[1][19] = false;
      iMatrix[1][20] = false;
      iMatrix[1][21] = false;
      iMatrix[1][22] = false;
      iMatrix[1][23] = false;
      iMatrix[1][24] = false;
      iMatrix[1][25] = false;
      iMatrix[1][26] = false;
      iMatrix[1][27] = false;
      iMatrix[1][28] = false;
      iMatrix[1][29] = false;
      iMatrix[1][30] = false;
      iMatrix[2][0] = false;
      iMatrix[2][1] = true;
      iMatrix[2][2] = false;
      iMatrix[2][3] = true;
      iMatrix[2][4] = false;
      iMatrix[2][5] = false;
      iMatrix[2][6] = false;
      iMatrix[2][7] = false;
      iMatrix[2][8] = false;
      iMatrix[2][9] = false;
      iMatrix[2][10] = false;
      iMatrix[2][11] = true;
      iMatrix[2][12] = false;
      iMatrix[2][13] = false;
      iMatrix[2][14] = true;
      iMatrix[2][15] = false;
      iMatrix[2][16] = false;
      iMatrix[2][17] = false;
      iMatrix[2][18] = false;
      iMatrix[2][19] = false;
      iMatrix[2][20] = false;
      iMatrix[2][21] = false;
      iMatrix[2][22] = false;
      iMatrix[2][23] = false;
      iMatrix[2][24] = false;
      iMatrix[2][25] = false;
      iMatrix[2][26] = false;
      iMatrix[2][27] = false;
      iMatrix[2][28] = false;
      iMatrix[2][29] = false;
      iMatrix[2][30] = false;
      iMatrix[3][0] = false;
      iMatrix[3][1] = false;
      iMatrix[3][2] = true;
      iMatrix[3][3] = false;
      iMatrix[3][4] = true;
      iMatrix[3][5] = false;
      iMatrix[3][6] = false;
      iMatrix[3][7] = false;
      iMatrix[3][8] = false;
      iMatrix[3][9] = false;
      iMatrix[3][10] = false;
      iMatrix[3][11] = false;
      iMatrix[3][12] = false;
      iMatrix[3][13] = false;
      iMatrix[3][14] = false;
      iMatrix[3][15] = false;
      iMatrix[3][16] = false;
      iMatrix[3][17] = false;
      iMatrix[3][18] = false;
      iMatrix[3][19] = false;
      iMatrix[3][20] = false;
      iMatrix[3][21] = false;
      iMatrix[3][22] = false;
      iMatrix[3][23] = false;
      iMatrix[3][24] = false;
      iMatrix[3][25] = false;
      iMatrix[3][26] = false;
      iMatrix[3][27] = false;
      iMatrix[3][28] = false;
      iMatrix[3][29] = false;
      iMatrix[3][30] = false;
      iMatrix[4][0] = false;
      iMatrix[4][1] = false;
      iMatrix[4][2] = false;
      iMatrix[4][3] = true;
      iMatrix[4][4] = false;
      iMatrix[4][5] = true;
      iMatrix[4][6] = false;
      iMatrix[4][7] = false;
      iMatrix[4][8] = false;
      iMatrix[4][9] = false;
      iMatrix[4][10] = false;
      iMatrix[4][11] = false;
      iMatrix[4][12] = false;
      iMatrix[4][13] = false;
      iMatrix[4][14] = true;
      iMatrix[4][15] = false;
      iMatrix[4][16] = false;
      iMatrix[4][17] = false;
      iMatrix[4][18] = false;
      iMatrix[4][19] = false;
      iMatrix[4][20] = false;
      iMatrix[4][21] = false;
      iMatrix[4][22] = false;
      iMatrix[4][23] = false;
      iMatrix[4][24] = false;
      iMatrix[4][25] = false;
      iMatrix[4][26] = false;
      iMatrix[4][27] = false;
      iMatrix[4][28] = false;
      iMatrix[4][29] = false;
      iMatrix[4][30] = false;
      iMatrix[5][0] = false;
      iMatrix[5][1] = false;
      iMatrix[5][2] = false;
      iMatrix[5][3] = false;
      iMatrix[5][4] = true;
      iMatrix[5][5] = false;
      iMatrix[5][6] = true;
      iMatrix[5][7] = false;
      iMatrix[5][8] = false;
      iMatrix[5][9] = false;
      iMatrix[5][10] = false;
      iMatrix[5][11] = false;
      iMatrix[5][12] = false;
      iMatrix[5][13] = false;
      iMatrix[5][14] = false;
      iMatrix[5][15] = false;
      iMatrix[5][16] = false;
      iMatrix[5][17] = false;
      iMatrix[5][18] = false;
      iMatrix[5][19] = false;
      iMatrix[5][20] = false;
      iMatrix[5][21] = false;
      iMatrix[5][22] = false;
      iMatrix[5][23] = false;
      iMatrix[5][24] = false;
      iMatrix[5][25] = false;
      iMatrix[5][26] = false;
      iMatrix[5][27] = false;
      iMatrix[5][28] = false;
      iMatrix[5][29] = false;
      iMatrix[5][30] = false;
      iMatrix[6][0] = false;
      iMatrix[6][1] = false;
      iMatrix[6][2] = false;
      iMatrix[6][3] = false;
      iMatrix[6][4] = false;
      iMatrix[6][5] = true;
      iMatrix[6][6] = false;
      iMatrix[6][7] = true;
      iMatrix[6][8] = false;
      iMatrix[6][9] = true;
      iMatrix[6][10] = false;
      iMatrix[6][11] = false;
      iMatrix[6][12] = false;
      iMatrix[6][13] = false;
      iMatrix[6][14] = true;
      iMatrix[6][15] = false;
      iMatrix[6][16] = false;
      iMatrix[6][17] = false;
      iMatrix[6][18] = false;
      iMatrix[6][19] = false;
      iMatrix[6][20] = false;
      iMatrix[6][21] = false;
      iMatrix[6][22] = false;
      iMatrix[6][23] = false;
      iMatrix[6][24] = false;
      iMatrix[6][25] = false;
      iMatrix[6][26] = false;
      iMatrix[6][27] = false;
      iMatrix[6][28] = false;
      iMatrix[6][29] = false;
      iMatrix[6][30] = false;
      iMatrix[7][0] = false;
      iMatrix[7][1] = false;
      iMatrix[7][2] = false;
      iMatrix[7][3] = false;
      iMatrix[7][4] = false;
      iMatrix[7][5] = false;
      iMatrix[7][6] = true;
      iMatrix[7][7] = false;
      iMatrix[7][8] = true;
      iMatrix[7][9] = false;
      iMatrix[7][10] = false;
      iMatrix[7][11] = false;
      iMatrix[7][12] = false;
      iMatrix[7][13] = false;
      iMatrix[7][14] = false;
      iMatrix[7][15] = false;
      iMatrix[7][16] = false;
      iMatrix[7][17] = false;
      iMatrix[7][18] = false;
      iMatrix[7][19] = false;
      iMatrix[7][20] = false;
      iMatrix[7][21] = false;
      iMatrix[7][22] = false;
      iMatrix[7][23] = false;
      iMatrix[7][24] = false;
      iMatrix[7][25] = false;
      iMatrix[7][26] = false;
      iMatrix[7][27] = false;
      iMatrix[7][28] = false;
      iMatrix[7][29] = false;
      iMatrix[7][30] = false;
      iMatrix[8][0] = false;
      iMatrix[8][1] = false;
      iMatrix[8][2] = false;
      iMatrix[8][3] = false;
      iMatrix[8][4] = false;
      iMatrix[8][5] = false;
      iMatrix[8][6] = false;
      iMatrix[8][7] = true;
      iMatrix[8][8] = false;
      iMatrix[8][9] = true;
      iMatrix[8][10] = false;
      iMatrix[8][11] = false;
      iMatrix[8][12] = false;
      iMatrix[8][13] = false;
      iMatrix[8][14] = false;
      iMatrix[8][15] = false;
      iMatrix[8][16] = false;
      iMatrix[8][17] = false;
      iMatrix[8][18] = false;
      iMatrix[8][19] = false;
      iMatrix[8][20] = false;
      iMatrix[8][21] = false;
      iMatrix[8][22] = false;
      iMatrix[8][23] = false;
      iMatrix[8][24] = false;
      iMatrix[8][25] = false;
      iMatrix[8][26] = false;
      iMatrix[8][27] = false;
      iMatrix[8][28] = false;
      iMatrix[8][29] = false;
      iMatrix[8][30] = false;
      iMatrix[9][0] = false;
      iMatrix[9][1] = false;
      iMatrix[9][2] = false;
      iMatrix[9][3] = false;
      iMatrix[9][4] = false;
      iMatrix[9][5] = false;
      iMatrix[9][6] = true;
      iMatrix[9][7] = false;
      iMatrix[9][8] = true;
      iMatrix[9][9] = false;
      iMatrix[9][10] = true;
      iMatrix[9][11] = false;
      iMatrix[9][12] = false;
      iMatrix[9][13] = false;
      iMatrix[9][14] = false;
      iMatrix[9][15] = false;
      iMatrix[9][16] = false;
      iMatrix[9][17] = false;
      iMatrix[9][18] = true;
      iMatrix[9][19] = false;
      iMatrix[9][20] = false;
      iMatrix[9][21] = false;
      iMatrix[9][22] = false;
      iMatrix[9][23] = false;
      iMatrix[9][24] = false;
      iMatrix[9][25] = false;
      iMatrix[9][26] = false;
      iMatrix[9][27] = false;
      iMatrix[9][28] = false;
      iMatrix[9][29] = false;
      iMatrix[9][30] = false;
      iMatrix[10][0] = false;
      iMatrix[10][1] = false;
      iMatrix[10][2] = false;
      iMatrix[10][3] = false;
      iMatrix[10][4] = false;
      iMatrix[10][5] = false;
      iMatrix[10][6] = false;
      iMatrix[10][7] = false;
      iMatrix[10][8] = false;
      iMatrix[10][9] = true;
      iMatrix[10][10] = false;
      iMatrix[10][11] = true;
      iMatrix[10][12] = false;
      iMatrix[10][13] = false;
      iMatrix[10][14] = true;
      iMatrix[10][15] = false;
      iMatrix[10][16] = false;
      iMatrix[10][17] = false;
      iMatrix[10][18] = false;
      iMatrix[10][19] = false;
      iMatrix[10][20] = false;
      iMatrix[10][21] = false;
      iMatrix[10][22] = false;
      iMatrix[10][23] = false;
      iMatrix[10][24] = false;
      iMatrix[10][25] = false;
      iMatrix[10][26] = false;
      iMatrix[10][27] = false;
      iMatrix[10][28] = false;
      iMatrix[10][29] = false;
      iMatrix[10][30] = false;
      iMatrix[11][0] = false;
      iMatrix[11][1] = false;
      iMatrix[11][2] = true;
      iMatrix[11][3] = false;
      iMatrix[11][4] = false;
      iMatrix[11][5] = false;
      iMatrix[11][6] = false;
      iMatrix[11][7] = false;
      iMatrix[11][8] = false;
      iMatrix[11][9] = false;
      iMatrix[11][10] = true;
      iMatrix[11][11] = false;
      iMatrix[11][12] = true;
      iMatrix[11][13] = false;
      iMatrix[11][14] = false;
      iMatrix[11][15] = false;
      iMatrix[11][16] = true;
      iMatrix[11][17] = false;
      iMatrix[11][18] = false;
      iMatrix[11][19] = false;
      iMatrix[11][20] = false;
      iMatrix[11][21] = false;
      iMatrix[11][22] = false;
      iMatrix[11][23] = false;
      iMatrix[11][24] = false;
      iMatrix[11][25] = false;
      iMatrix[11][26] = false;
      iMatrix[11][27] = false;
      iMatrix[11][28] = false;
      iMatrix[11][29] = false;
      iMatrix[11][30] = false;
      iMatrix[12][0] = false;
      iMatrix[12][1] = true;
      iMatrix[12][2] = false;
      iMatrix[12][3] = false;
      iMatrix[12][4] = false;
      iMatrix[12][5] = false;
      iMatrix[12][6] = false;
      iMatrix[12][7] = false;
      iMatrix[12][8] = false;
      iMatrix[12][9] = false;
      iMatrix[12][10] = false;
      iMatrix[12][11] = true;
      iMatrix[12][12] = false;
      iMatrix[12][13] = true;
      iMatrix[12][14] = false;
      iMatrix[12][15] = true;
      iMatrix[12][16] = false;
      iMatrix[12][17] = false;
      iMatrix[12][18] = false;
      iMatrix[12][19] = false;
      iMatrix[12][20] = false;
      iMatrix[12][21] = false;
      iMatrix[12][22] = false;
      iMatrix[12][23] = false;
      iMatrix[12][24] = false;
      iMatrix[12][25] = false;
      iMatrix[12][26] = false;
      iMatrix[12][27] = false;
      iMatrix[12][28] = false;
      iMatrix[12][29] = false;
      iMatrix[12][30] = false;
      iMatrix[13][0] = true;
      iMatrix[13][1] = false;
      iMatrix[13][2] = false;
      iMatrix[13][3] = false;
      iMatrix[13][4] = false;
      iMatrix[13][5] = false;
      iMatrix[13][6] = false;
      iMatrix[13][7] = false;
      iMatrix[13][8] = false;
      iMatrix[13][9] = false;
      iMatrix[13][10] = false;
      iMatrix[13][11] = false;
      iMatrix[13][12] = true;
      iMatrix[13][13] = false;
      iMatrix[13][14] = false;
      iMatrix[13][15] = false;
      iMatrix[13][16] = false;
      iMatrix[13][17] = false;
      iMatrix[13][18] = false;
      iMatrix[13][19] = false;
      iMatrix[13][20] = false;
      iMatrix[13][21] = false;
      iMatrix[13][22] = false;
      iMatrix[13][23] = false;
      iMatrix[13][24] = false;
      iMatrix[13][25] = false;
      iMatrix[13][26] = false;
      iMatrix[13][27] = false;
      iMatrix[13][28] = false;
      iMatrix[13][29] = false;
      iMatrix[13][30] = false;
      iMatrix[14][0] = false;
      iMatrix[14][1] = false;
      iMatrix[14][2] = true;
      iMatrix[14][3] = false;
      iMatrix[14][4] = true;
      iMatrix[14][5] = false;
      iMatrix[14][6] = true;
      iMatrix[14][7] = false;
      iMatrix[14][8] = false;
      iMatrix[14][9] = false;
      iMatrix[14][10] = true;
      iMatrix[14][11] = false;
      iMatrix[14][12] = false;
      iMatrix[14][13] = false;
      iMatrix[14][14] = false;
      iMatrix[14][15] = false;
      iMatrix[14][16] = false;
      iMatrix[14][17] = false;
      iMatrix[14][18] = false;
      iMatrix[14][19] = false;
      iMatrix[14][20] = false;
      iMatrix[14][21] = false;
      iMatrix[14][22] = false;
      iMatrix[14][23] = false;
      iMatrix[14][24] = false;
      iMatrix[14][25] = false;
      iMatrix[14][26] = false;
      iMatrix[14][27] = false;
      iMatrix[14][28] = false;
      iMatrix[14][29] = false;
      iMatrix[14][30] = false;
      iMatrix[15][0] = false;
      iMatrix[15][1] = false;
      iMatrix[15][2] = false;
      iMatrix[15][3] = false;
      iMatrix[15][4] = false;
      iMatrix[15][5] = false;
      iMatrix[15][6] = false;
      iMatrix[15][7] = false;
      iMatrix[15][8] = false;
      iMatrix[15][9] = false;
      iMatrix[15][10] = false;
      iMatrix[15][11] = false;
      iMatrix[15][12] = true;
      iMatrix[15][13] = false;
      iMatrix[15][14] = false;
      iMatrix[15][15] = false;
      iMatrix[15][16] = true;
      iMatrix[15][17] = false;
      iMatrix[15][18] = false;
      iMatrix[15][19] = false;
      iMatrix[15][20] = false;
      iMatrix[15][21] = false;
      iMatrix[15][22] = false;
      iMatrix[15][23] = false;
      iMatrix[15][24] = true;
      iMatrix[15][25] = false;
      iMatrix[15][26] = true;
      iMatrix[15][27] = false;
      iMatrix[15][28] = false;
      iMatrix[15][29] = false;
      iMatrix[15][30] = false;
      iMatrix[16][0] = false;
      iMatrix[16][1] = false;
      iMatrix[16][2] = false;
      iMatrix[16][3] = false;
      iMatrix[16][4] = false;
      iMatrix[16][5] = false;
      iMatrix[16][6] = false;
      iMatrix[16][7] = false;
      iMatrix[16][8] = false;
      iMatrix[16][9] = false;
      iMatrix[16][10] = false;
      iMatrix[16][11] = true;
      iMatrix[16][12] = false;
      iMatrix[16][13] = false;
      iMatrix[16][14] = false;
      iMatrix[16][15] = true;
      iMatrix[16][16] = false;
      iMatrix[16][17] = true;
      iMatrix[16][18] = false;
      iMatrix[16][19] = false;
      iMatrix[16][20] = false;
      iMatrix[16][21] = false;
      iMatrix[16][22] = false;
      iMatrix[16][23] = true;
      iMatrix[16][24] = false;
      iMatrix[16][25] = false;
      iMatrix[16][26] = false;
      iMatrix[16][27] = false;
      iMatrix[16][28] = false;
      iMatrix[16][29] = false;
      iMatrix[16][30] = false;
      iMatrix[17][0] = false;
      iMatrix[17][1] = false;
      iMatrix[17][2] = false;
      iMatrix[17][3] = false;
      iMatrix[17][4] = false;
      iMatrix[17][5] = false;
      iMatrix[17][6] = false;
      iMatrix[17][7] = false;
      iMatrix[17][8] = false;
      iMatrix[17][9] = false;
      iMatrix[17][10] = false;
      iMatrix[17][11] = false;
      iMatrix[17][12] = false;
      iMatrix[17][13] = false;
      iMatrix[17][14] = false;
      iMatrix[17][15] = false;
      iMatrix[17][16] = true;
      iMatrix[17][17] = false;
      iMatrix[17][18] = true;
      iMatrix[17][19] = false;
      iMatrix[17][20] = false;
      iMatrix[17][21] = false;
      iMatrix[17][22] = false;
      iMatrix[17][23] = false;
      iMatrix[17][24] = false;
      iMatrix[17][25] = false;
      iMatrix[17][26] = false;
      iMatrix[17][27] = false;
      iMatrix[17][28] = false;
      iMatrix[17][29] = false;
      iMatrix[17][30] = false;
      iMatrix[18][0] = false;
      iMatrix[18][1] = false;
      iMatrix[18][2] = false;
      iMatrix[18][3] = false;
      iMatrix[18][4] = false;
      iMatrix[18][5] = false;
      iMatrix[18][6] = false;
      iMatrix[18][7] = false;
      iMatrix[18][8] = false;
      iMatrix[18][9] = true;
      iMatrix[18][10] = false;
      iMatrix[18][11] = false;
      iMatrix[18][12] = false;
      iMatrix[18][13] = false;
      iMatrix[18][14] = false;
      iMatrix[18][15] = false;
      iMatrix[18][16] = false;
      iMatrix[18][17] = true;
      iMatrix[18][18] = false;
      iMatrix[18][19] = true;
      iMatrix[18][20] = false;
      iMatrix[18][21] = true;
      iMatrix[18][22] = false;
      iMatrix[18][23] = false;
      iMatrix[18][24] = false;
      iMatrix[18][25] = false;
      iMatrix[18][26] = false;
      iMatrix[18][27] = false;
      iMatrix[18][28] = false;
      iMatrix[18][29] = false;
      iMatrix[18][30] = false;
      iMatrix[19][0] = false;
      iMatrix[19][1] = false;
      iMatrix[19][2] = false;
      iMatrix[19][3] = false;
      iMatrix[19][4] = false;
      iMatrix[19][5] = false;
      iMatrix[19][6] = false;
      iMatrix[19][7] = false;
      iMatrix[19][8] = false;
      iMatrix[19][9] = false;
      iMatrix[19][10] = false;
      iMatrix[19][11] = false;
      iMatrix[19][12] = false;
      iMatrix[19][13] = false;
      iMatrix[19][14] = false;
      iMatrix[19][15] = false;
      iMatrix[19][16] = false;
      iMatrix[19][17] = false;
      iMatrix[19][18] = true;
      iMatrix[19][19] = false;
      iMatrix[19][20] = true;
      iMatrix[19][21] = false;
      iMatrix[19][22] = false;
      iMatrix[19][23] = false;
      iMatrix[19][24] = false;
      iMatrix[19][25] = false;
      iMatrix[19][26] = false;
      iMatrix[19][27] = false;
      iMatrix[19][28] = false;
      iMatrix[19][29] = false;
      iMatrix[19][30] = false;
      iMatrix[20][0] = false;
      iMatrix[20][1] = false;
      iMatrix[20][2] = false;
      iMatrix[20][3] = false;
      iMatrix[20][4] = false;
      iMatrix[20][5] = false;
      iMatrix[20][6] = false;
      iMatrix[20][7] = false;
      iMatrix[20][8] = false;
      iMatrix[20][9] = false;
      iMatrix[20][10] = false;
      iMatrix[20][11] = false;
      iMatrix[20][12] = false;
      iMatrix[20][13] = false;
      iMatrix[20][14] = false;
      iMatrix[20][15] = false;
      iMatrix[20][16] = false;
      iMatrix[20][17] = false;
      iMatrix[20][18] = false;
      iMatrix[20][19] = true;
      iMatrix[20][20] = false;
      iMatrix[20][21] = true;
      iMatrix[20][22] = false;
      iMatrix[20][23] = false;
      iMatrix[20][24] = false;
      iMatrix[20][25] = false;
      iMatrix[20][26] = false;
      iMatrix[20][27] = false;
      iMatrix[20][28] = false;
      iMatrix[20][29] = false;
      iMatrix[20][30] = false;
      iMatrix[21][0] = false;
      iMatrix[21][1] = false;
      iMatrix[21][2] = false;
      iMatrix[21][3] = false;
      iMatrix[21][4] = false;
      iMatrix[21][5] = false;
      iMatrix[21][6] = false;
      iMatrix[21][7] = false;
      iMatrix[21][8] = false;
      iMatrix[21][9] = false;
      iMatrix[21][10] = false;
      iMatrix[21][11] = false;
      iMatrix[21][12] = false;
      iMatrix[21][13] = false;
      iMatrix[21][14] = false;
      iMatrix[21][15] = false;
      iMatrix[21][16] = false;
      iMatrix[21][17] = false;
      iMatrix[21][18] = true;
      iMatrix[21][19] = false;
      iMatrix[21][20] = true;
      iMatrix[21][21] = false;
      iMatrix[21][22] = true;
      iMatrix[21][23] = false;
      iMatrix[21][24] = false;
      iMatrix[21][25] = false;
      iMatrix[21][26] = false;
      iMatrix[21][27] = false;
      iMatrix[21][28] = false;
      iMatrix[21][29] = false;
      iMatrix[21][30] = true;
      iMatrix[22][0] = false;
      iMatrix[22][1] = false;
      iMatrix[22][2] = false;
      iMatrix[22][3] = false;
      iMatrix[22][4] = false;
      iMatrix[22][5] = false;
      iMatrix[22][6] = false;
      iMatrix[22][7] = false;
      iMatrix[22][8] = false;
      iMatrix[22][9] = false;
      iMatrix[22][10] = false;
      iMatrix[22][11] = false;
      iMatrix[22][12] = false;
      iMatrix[22][13] = false;
      iMatrix[22][14] = false;
      iMatrix[22][15] = false;
      iMatrix[22][16] = false;
      iMatrix[22][17] = false;
      iMatrix[22][18] = false;
      iMatrix[22][19] = false;
      iMatrix[22][20] = false;
      iMatrix[22][21] = true;
      iMatrix[22][22] = false;
      iMatrix[22][23] = true;
      iMatrix[22][24] = false;
      iMatrix[22][25] = false;
      iMatrix[22][26] = false;
      iMatrix[22][27] = false;
      iMatrix[22][28] = false;
      iMatrix[22][29] = true;
      iMatrix[22][30] = false;
      iMatrix[23][0] = false;
      iMatrix[23][1] = false;
      iMatrix[23][2] = false;
      iMatrix[23][3] = false;
      iMatrix[23][4] = false;
      iMatrix[23][5] = false;
      iMatrix[23][6] = false;
      iMatrix[23][7] = false;
      iMatrix[23][8] = false;
      iMatrix[23][9] = false;
      iMatrix[23][10] = false;
      iMatrix[23][11] = false;
      iMatrix[23][12] = false;
      iMatrix[23][13] = false;
      iMatrix[23][14] = false;
      iMatrix[23][15] = false;
      iMatrix[23][16] = true;
      iMatrix[23][17] = false;
      iMatrix[23][18] = false;
      iMatrix[23][19] = false;
      iMatrix[23][20] = false;
      iMatrix[23][21] = false;
      iMatrix[23][22] = true;
      iMatrix[23][23] = false;
      iMatrix[23][24] = false;
      iMatrix[23][25] = false;
      iMatrix[23][26] = true;
      iMatrix[23][27] = false;
      iMatrix[23][28] = true;
      iMatrix[23][29] = false;
      iMatrix[23][30] = false;
      iMatrix[24][0] = false;
      iMatrix[24][1] = false;
      iMatrix[24][2] = false;
      iMatrix[24][3] = false;
      iMatrix[24][4] = false;
      iMatrix[24][5] = false;
      iMatrix[24][6] = false;
      iMatrix[24][7] = false;
      iMatrix[24][8] = false;
      iMatrix[24][9] = false;
      iMatrix[24][10] = false;
      iMatrix[24][11] = false;
      iMatrix[24][12] = false;
      iMatrix[24][13] = false;
      iMatrix[24][14] = false;
      iMatrix[24][15] = true;
      iMatrix[24][16] = false;
      iMatrix[24][17] = false;
      iMatrix[24][18] = false;
      iMatrix[24][19] = false;
      iMatrix[24][20] = false;
      iMatrix[24][21] = false;
      iMatrix[24][22] = false;
      iMatrix[24][23] = false;
      iMatrix[24][24] = false;
      iMatrix[24][25] = true;
      iMatrix[24][26] = false;
      iMatrix[24][27] = false;
      iMatrix[24][28] = false;
      iMatrix[24][29] = false;
      iMatrix[24][30] = false;
      iMatrix[25][0] = false;
      iMatrix[25][1] = false;
      iMatrix[25][2] = false;
      iMatrix[25][3] = false;
      iMatrix[25][4] = false;
      iMatrix[25][5] = false;
      iMatrix[25][6] = false;
      iMatrix[25][7] = false;
      iMatrix[25][8] = false;
      iMatrix[25][9] = false;
      iMatrix[25][10] = false;
      iMatrix[25][11] = false;
      iMatrix[25][12] = false;
      iMatrix[25][13] = false;
      iMatrix[25][14] = false;
      iMatrix[25][15] = false;
      iMatrix[25][16] = false;
      iMatrix[25][17] = false;
      iMatrix[25][18] = false;
      iMatrix[25][19] = false;
      iMatrix[25][20] = false;
      iMatrix[25][21] = false;
      iMatrix[25][22] = false;
      iMatrix[25][23] = false;
      iMatrix[25][24] = true;
      iMatrix[25][25] = false;
      iMatrix[25][26] = true;
      iMatrix[25][27] = false;
      iMatrix[25][28] = false;
      iMatrix[25][29] = false;
      iMatrix[25][30] = false;
      iMatrix[26][0] = false;
      iMatrix[26][1] = false;
      iMatrix[26][2] = false;
      iMatrix[26][3] = false;
      iMatrix[26][4] = false;
      iMatrix[26][5] = false;
      iMatrix[26][6] = false;
      iMatrix[26][7] = false;
      iMatrix[26][8] = false;
      iMatrix[26][9] = false;
      iMatrix[26][10] = false;
      iMatrix[26][11] = false;
      iMatrix[26][12] = false;
      iMatrix[26][13] = false;
      iMatrix[26][14] = false;
      iMatrix[26][15] = true;
      iMatrix[26][16] = false;
      iMatrix[26][17] = false;
      iMatrix[26][18] = false;
      iMatrix[26][19] = false;
      iMatrix[26][20] = false;
      iMatrix[26][21] = false;
      iMatrix[26][22] = false;
      iMatrix[26][23] = true;
      iMatrix[26][24] = false;
      iMatrix[26][25] = true;
      iMatrix[26][26] = false;
      iMatrix[26][27] = true;
      iMatrix[26][28] = false;
      iMatrix[26][29] = false;
      iMatrix[26][30] = false;
      iMatrix[27][0] = false;
      iMatrix[27][1] = false;
      iMatrix[27][2] = false;
      iMatrix[27][3] = false;
      iMatrix[27][4] = false;
      iMatrix[27][5] = false;
      iMatrix[27][6] = false;
      iMatrix[27][7] = false;
      iMatrix[27][8] = false;
      iMatrix[27][9] = false;
      iMatrix[27][10] = false;
      iMatrix[27][11] = false;
      iMatrix[27][12] = false;
      iMatrix[27][13] = false;
      iMatrix[27][14] = false;
      iMatrix[27][15] = false;
      iMatrix[27][16] = false;
      iMatrix[27][17] = false;
      iMatrix[27][18] = false;
      iMatrix[27][19] = false;
      iMatrix[27][20] = false;
      iMatrix[27][21] = false;
      iMatrix[27][22] = false;
      iMatrix[27][23] = false;
      iMatrix[27][24] = false;
      iMatrix[27][25] = false;
      iMatrix[27][26] = true;
      iMatrix[27][27] = false;
      iMatrix[27][28] = true;
      iMatrix[27][29] = false;
      iMatrix[27][30] = false;
      iMatrix[28][0] = false;
      iMatrix[28][1] = false;
      iMatrix[28][2] = false;
      iMatrix[28][3] = false;
      iMatrix[28][4] = false;
      iMatrix[28][5] = false;
      iMatrix[28][6] = false;
      iMatrix[28][7] = false;
      iMatrix[28][8] = false;
      iMatrix[28][9] = false;
      iMatrix[28][10] = false;
      iMatrix[28][11] = false;
      iMatrix[28][12] = false;
      iMatrix[28][13] = false;
      iMatrix[28][14] = false;
      iMatrix[28][15] = false;
      iMatrix[28][16] = false;
      iMatrix[28][17] = false;
      iMatrix[28][18] = false;
      iMatrix[28][19] = false;
      iMatrix[28][20] = false;
      iMatrix[28][21] = false;
      iMatrix[28][22] = false;
      iMatrix[28][23] = true;
      iMatrix[28][24] = false;
      iMatrix[28][25] = false;
      iMatrix[28][26] = false;
      iMatrix[28][27] = true;
      iMatrix[28][28] = false;
      iMatrix[28][29] = false;
      iMatrix[28][30] = false;
      iMatrix[29][0] = false;
      iMatrix[29][1] = false;
      iMatrix[29][2] = false;
      iMatrix[29][3] = false;
      iMatrix[29][4] = false;
      iMatrix[29][5] = false;
      iMatrix[29][6] = false;
      iMatrix[29][7] = false;
      iMatrix[29][8] = false;
      iMatrix[29][9] = false;
      iMatrix[29][10] = false;
      iMatrix[29][11] = false;
      iMatrix[29][12] = false;
      iMatrix[29][13] = false;
      iMatrix[29][14] = false;
      iMatrix[29][15] = false;
      iMatrix[29][16] = false;
      iMatrix[29][17] = false;
      iMatrix[29][18] = false;
      iMatrix[29][19] = false;
      iMatrix[29][20] = false;
      iMatrix[29][21] = false;
      iMatrix[29][22] = true;
      iMatrix[29][23] = false;
      iMatrix[29][24] = false;
      iMatrix[29][25] = false;
      iMatrix[29][26] = false;
      iMatrix[29][27] = false;
      iMatrix[29][28] = false;
      iMatrix[29][29] = false;
      iMatrix[29][30] = true;
      iMatrix[30][0] = false;
      iMatrix[30][1] = false;
      iMatrix[30][2] = false;
      iMatrix[30][3] = false;
      iMatrix[30][4] = false;
      iMatrix[30][5] = false;
      iMatrix[30][6] = false;
      iMatrix[30][7] = false;
      iMatrix[30][8] = false;
      iMatrix[30][9] = false;
      iMatrix[30][10] = false;
      iMatrix[30][11] = false;
      iMatrix[30][12] = false;
      iMatrix[30][13] = false;
      iMatrix[30][14] = false;
      iMatrix[30][15] = false;
      iMatrix[30][16] = false;
      iMatrix[30][17] = false;
      iMatrix[30][18] = false;
      iMatrix[30][19] = false;
      iMatrix[30][20] = false;
      iMatrix[30][21] = true;
      iMatrix[30][22] = false;
      iMatrix[30][23] = false;
      iMatrix[30][24] = false;
      iMatrix[30][25] = false;
      iMatrix[30][26] = false;
      iMatrix[30][27] = false;
      iMatrix[30][28] = false;
      iMatrix[30][29] = true;
      iMatrix[30][30] = false;

      break;

    case 7:

      completeGraph();

      break;

    case 8:
      completeNum++;
      completeGraph();
      break;

    case 9:
      completeNum--;
      completeGraph();
      break;
    }
  }


















  if (column == 1) {
    //////
    /// Examples from class  


    switch(graph) {

    case 0:

      // Example 1 Graph

      verticesX = new int[5];
      verticesY = new int[5];


      verticesX[0] = 59;
      verticesX[1] = 170;
      verticesX[2] = 287;
      verticesX[3] = 243;
      verticesX[4] = 385;


      verticesY[0] = 247;
      verticesY[1] = 98;
      verticesY[2] = 360;
      verticesY[3] = 256;
      verticesY[4] = 225;


      iMatrix[0][0] = false;
      iMatrix[0][1] = true;
      iMatrix[0][2] = false;
      iMatrix[0][3] = true;
      iMatrix[0][4] = false;
      iMatrix[1][0] = true;
      iMatrix[1][1] = false;
      iMatrix[1][2] = false;
      iMatrix[1][3] = true;
      iMatrix[1][4] = false;
      iMatrix[2][0] = false;
      iMatrix[2][1] = false;
      iMatrix[2][2] = false;
      iMatrix[2][3] = true;
      iMatrix[2][4] = true;
      iMatrix[3][0] = true;
      iMatrix[3][1] = true;
      iMatrix[3][2] = true;
      iMatrix[3][3] = false;
      iMatrix[3][4] = true;
      iMatrix[4][0] = false;
      iMatrix[4][1] = false;
      iMatrix[4][2] = true;
      iMatrix[4][3] = true;
      iMatrix[4][4] = false;

      break;

    case 1:

      // example 2

      verticesX = new int[7];
      verticesY = new int[7];


      verticesX[0] = 99;
      verticesX[1] = 99;
      verticesX[2] = 99;
      verticesX[3] = 202;
      verticesX[4] = 302;
      verticesX[5] = 302;
      verticesX[6] = 302;


      verticesY[0] = 158;
      verticesY[1] = 232;
      verticesY[2] = 318;
      verticesY[3] = 232;
      verticesY[4] = 158;
      verticesY[5] = 232;
      verticesY[6] = 318;


      iMatrix[0][0] = false;
      iMatrix[0][1] = false;
      iMatrix[0][2] = false;
      iMatrix[0][3] = true;
      iMatrix[0][4] = true;
      iMatrix[0][5] = false;
      iMatrix[0][6] = false;
      iMatrix[1][0] = false;
      iMatrix[1][1] = false;
      iMatrix[1][2] = true;
      iMatrix[1][3] = true;
      iMatrix[1][4] = false;
      iMatrix[1][5] = false;
      iMatrix[1][6] = false;
      iMatrix[2][0] = false;
      iMatrix[2][1] = true;
      iMatrix[2][2] = false;
      iMatrix[2][3] = true;
      iMatrix[2][4] = false;
      iMatrix[2][5] = false;
      iMatrix[2][6] = false;
      iMatrix[3][0] = true;
      iMatrix[3][1] = true;
      iMatrix[3][2] = true;
      iMatrix[3][3] = false;
      iMatrix[3][4] = true;
      iMatrix[3][5] = true;
      iMatrix[3][6] = true;
      iMatrix[4][0] = true;
      iMatrix[4][1] = false;
      iMatrix[4][2] = false;
      iMatrix[4][3] = true;
      iMatrix[4][4] = false;
      iMatrix[4][5] = false;
      iMatrix[4][6] = false;
      iMatrix[5][0] = false;
      iMatrix[5][1] = false;
      iMatrix[5][2] = false;
      iMatrix[5][3] = true;
      iMatrix[5][4] = false;
      iMatrix[5][5] = false;
      iMatrix[5][6] = true;
      iMatrix[6][0] = false;
      iMatrix[6][1] = false;
      iMatrix[6][2] = false;
      iMatrix[6][3] = true;
      iMatrix[6][4] = false;
      iMatrix[6][5] = true;
      iMatrix[6][6] = false;

      break;

    case 2:
      // Example 3

      verticesX = new int[5];
      verticesY = new int[5];


      verticesX[0] = 163;
      verticesX[1] = 313;
      verticesX[2] = 240;
      verticesX[3] = 313;
      verticesX[4] = 163;


      verticesY[0] = 181;
      verticesY[1] = 181;
      verticesY[2] = 257;
      verticesY[3] = 330;
      verticesY[4] = 330;


      iMatrix[0][0] = false;
      iMatrix[0][1] = true;
      iMatrix[0][2] = true;
      iMatrix[0][3] = false;
      iMatrix[0][4] = true;
      iMatrix[1][0] = true;
      iMatrix[1][1] = false;
      iMatrix[1][2] = true;
      iMatrix[1][3] = true;
      iMatrix[1][4] = false;
      iMatrix[2][0] = true;
      iMatrix[2][1] = true;
      iMatrix[2][2] = false;
      iMatrix[2][3] = true;
      iMatrix[2][4] = true;
      iMatrix[3][0] = false;
      iMatrix[3][1] = true;
      iMatrix[3][2] = true;
      iMatrix[3][3] = false;
      iMatrix[3][4] = true;
      iMatrix[4][0] = true;
      iMatrix[4][1] = false;
      iMatrix[4][2] = true;
      iMatrix[4][3] = true;
      iMatrix[4][4] = false;

      break;

    case 3:

      // Handout 1 graph

      verticesX = new int[6];
      verticesY = new int[6];


      verticesX[0] = 157;
      verticesX[1] = 296;
      verticesX[2] = 223;
      verticesX[3] = 223;
      verticesX[4] = 223;
      verticesX[5] = 223;


      verticesY[0] = 290;
      verticesY[1] = 290;
      verticesY[2] = 172;
      verticesY[3] = 252;
      verticesY[4] = 330;
      verticesY[5] = 406;


      iMatrix[0][0] = false;
      iMatrix[0][1] = false;
      iMatrix[0][2] = true;
      iMatrix[0][3] = true;
      iMatrix[0][4] = true;
      iMatrix[0][5] = true;
      iMatrix[1][0] = false;
      iMatrix[1][1] = false;
      iMatrix[1][2] = false;
      iMatrix[1][3] = true;
      iMatrix[1][4] = true;
      iMatrix[1][5] = false;
      iMatrix[2][0] = true;
      iMatrix[2][1] = false;
      iMatrix[2][2] = false;
      iMatrix[2][3] = true;
      iMatrix[2][4] = false;
      iMatrix[2][5] = false;
      iMatrix[3][0] = true;
      iMatrix[3][1] = true;
      iMatrix[3][2] = true;
      iMatrix[3][3] = false;
      iMatrix[3][4] = true;
      iMatrix[3][5] = false;
      iMatrix[4][0] = true;
      iMatrix[4][1] = true;
      iMatrix[4][2] = false;
      iMatrix[4][3] = true;
      iMatrix[4][4] = false;
      iMatrix[4][5] = true;
      iMatrix[5][0] = true;
      iMatrix[5][1] = false;
      iMatrix[5][2] = false;
      iMatrix[5][3] = false;
      iMatrix[5][4] = true;
      iMatrix[5][5] = false;

      break;

    case 4:

      // Handout 2 graph

      verticesX = new int[5];
      verticesY = new int[5];


      verticesX[0] = 166;
      verticesX[1] = 344;
      verticesX[2] = 344;
      verticesX[3] = 166;
      verticesX[4] = 257;


      verticesY[0] = 173;
      verticesY[1] = 173;
      verticesY[2] = 357;
      verticesY[3] = 357;
      verticesY[4] = 266;


      iMatrix[0][0] = false;
      iMatrix[0][1] = true;
      iMatrix[0][2] = false;
      iMatrix[0][3] = true;
      iMatrix[0][4] = false;
      iMatrix[1][0] = true;
      iMatrix[1][1] = false;
      iMatrix[1][2] = true;
      iMatrix[1][3] = false;
      iMatrix[1][4] = true;
      iMatrix[2][0] = false;
      iMatrix[2][1] = true;
      iMatrix[2][2] = false;
      iMatrix[2][3] = true;
      iMatrix[2][4] = false;
      iMatrix[3][0] = true;
      iMatrix[3][1] = false;
      iMatrix[3][2] = true;
      iMatrix[3][3] = false;
      iMatrix[3][4] = true;
      iMatrix[4][0] = false;
      iMatrix[4][1] = true;
      iMatrix[4][2] = false;
      iMatrix[4][3] = true;
      iMatrix[4][4] = false;

      break;

    case 5:

      // Handout 3 graph

      verticesX = new int[12];
      verticesY = new int[12];


      verticesX[0] = 92;
      verticesX[1] = 92;
      verticesX[2] = 92;
      verticesX[3] = 167;
      verticesX[4] = 167;
      verticesX[5] = 167;
      verticesX[6] = 244;
      verticesX[7] = 244;
      verticesX[8] = 244;
      verticesX[9] = 320;
      verticesX[10] = 320;
      verticesX[11] = 320;


      verticesY[0] = 181;
      verticesY[1] = 248;
      verticesY[2] = 324;
      verticesY[3] = 324;
      verticesY[4] = 248;
      verticesY[5] = 181;
      verticesY[6] = 181;
      verticesY[7] = 248;
      verticesY[8] = 324;
      verticesY[9] = 324;
      verticesY[10] = 248;
      verticesY[11] = 181;


      iMatrix[0][0] = false;
      iMatrix[0][1] = true;
      iMatrix[0][2] = false;
      iMatrix[0][3] = false;
      iMatrix[0][4] = false;
      iMatrix[0][5] = true;
      iMatrix[0][6] = false;
      iMatrix[0][7] = false;
      iMatrix[0][8] = false;
      iMatrix[0][9] = false;
      iMatrix[0][10] = false;
      iMatrix[0][11] = false;
      iMatrix[1][0] = true;
      iMatrix[1][1] = false;
      iMatrix[1][2] = true;
      iMatrix[1][3] = false;
      iMatrix[1][4] = true;
      iMatrix[1][5] = false;
      iMatrix[1][6] = false;
      iMatrix[1][7] = false;
      iMatrix[1][8] = false;
      iMatrix[1][9] = false;
      iMatrix[1][10] = false;
      iMatrix[1][11] = false;
      iMatrix[2][0] = false;
      iMatrix[2][1] = true;
      iMatrix[2][2] = false;
      iMatrix[2][3] = true;
      iMatrix[2][4] = false;
      iMatrix[2][5] = false;
      iMatrix[2][6] = false;
      iMatrix[2][7] = false;
      iMatrix[2][8] = false;
      iMatrix[2][9] = false;
      iMatrix[2][10] = false;
      iMatrix[2][11] = false;
      iMatrix[3][0] = false;
      iMatrix[3][1] = false;
      iMatrix[3][2] = true;
      iMatrix[3][3] = false;
      iMatrix[3][4] = true;
      iMatrix[3][5] = false;
      iMatrix[3][6] = false;
      iMatrix[3][7] = false;
      iMatrix[3][8] = true;
      iMatrix[3][9] = false;
      iMatrix[3][10] = false;
      iMatrix[3][11] = false;
      iMatrix[4][0] = false;
      iMatrix[4][1] = true;
      iMatrix[4][2] = false;
      iMatrix[4][3] = true;
      iMatrix[4][4] = false;
      iMatrix[4][5] = true;
      iMatrix[4][6] = false;
      iMatrix[4][7] = true;
      iMatrix[4][8] = false;
      iMatrix[4][9] = false;
      iMatrix[4][10] = false;
      iMatrix[4][11] = false;
      iMatrix[5][0] = true;
      iMatrix[5][1] = false;
      iMatrix[5][2] = false;
      iMatrix[5][3] = false;
      iMatrix[5][4] = true;
      iMatrix[5][5] = false;
      iMatrix[5][6] = true;
      iMatrix[5][7] = false;
      iMatrix[5][8] = false;
      iMatrix[5][9] = false;
      iMatrix[5][10] = false;
      iMatrix[5][11] = false;
      iMatrix[6][0] = false;
      iMatrix[6][1] = false;
      iMatrix[6][2] = false;
      iMatrix[6][3] = false;
      iMatrix[6][4] = false;
      iMatrix[6][5] = true;
      iMatrix[6][6] = false;
      iMatrix[6][7] = true;
      iMatrix[6][8] = false;
      iMatrix[6][9] = false;
      iMatrix[6][10] = false;
      iMatrix[6][11] = true;
      iMatrix[7][0] = false;
      iMatrix[7][1] = false;
      iMatrix[7][2] = false;
      iMatrix[7][3] = false;
      iMatrix[7][4] = true;
      iMatrix[7][5] = false;
      iMatrix[7][6] = true;
      iMatrix[7][7] = false;
      iMatrix[7][8] = true;
      iMatrix[7][9] = false;
      iMatrix[7][10] = true;
      iMatrix[7][11] = false;
      iMatrix[8][0] = false;
      iMatrix[8][1] = false;
      iMatrix[8][2] = false;
      iMatrix[8][3] = true;
      iMatrix[8][4] = false;
      iMatrix[8][5] = false;
      iMatrix[8][6] = false;
      iMatrix[8][7] = true;
      iMatrix[8][8] = false;
      iMatrix[8][9] = true;
      iMatrix[8][10] = false;
      iMatrix[8][11] = false;
      iMatrix[9][0] = false;
      iMatrix[9][1] = false;
      iMatrix[9][2] = false;
      iMatrix[9][3] = false;
      iMatrix[9][4] = false;
      iMatrix[9][5] = false;
      iMatrix[9][6] = false;
      iMatrix[9][7] = false;
      iMatrix[9][8] = true;
      iMatrix[9][9] = false;
      iMatrix[9][10] = true;
      iMatrix[9][11] = false;
      iMatrix[10][0] = false;
      iMatrix[10][1] = false;
      iMatrix[10][2] = false;
      iMatrix[10][3] = false;
      iMatrix[10][4] = false;
      iMatrix[10][5] = false;
      iMatrix[10][6] = false;
      iMatrix[10][7] = true;
      iMatrix[10][8] = false;
      iMatrix[10][9] = true;
      iMatrix[10][10] = false;
      iMatrix[10][11] = true;
      iMatrix[11][0] = false;
      iMatrix[11][1] = false;
      iMatrix[11][2] = false;
      iMatrix[11][3] = false;
      iMatrix[11][4] = false;
      iMatrix[11][5] = false;
      iMatrix[11][6] = true;
      iMatrix[11][7] = false;
      iMatrix[11][8] = false;
      iMatrix[11][9] = false;
      iMatrix[11][10] = true;
      iMatrix[11][11] = false;

      break;

    case 6:

      // handout 4 graph

      verticesX = new int[8];
      verticesY = new int[8];


      verticesX[0] = 110;
      verticesX[1] = 110;
      verticesX[2] = 165;
      verticesX[3] = 227;
      verticesX[4] = 227;
      verticesX[5] = 286;
      verticesX[6] = 352;
      verticesX[7] = 352;


      verticesY[0] = 321;
      verticesY[1] = 175;
      verticesY[2] = 262;
      verticesY[3] = 225;
      verticesY[4] = 321;
      verticesY[5] = 262;
      verticesY[6] = 175;
      verticesY[7] = 321;


      iMatrix[0][0] = false;
      iMatrix[0][1] = true;
      iMatrix[0][2] = true;
      iMatrix[0][3] = false;
      iMatrix[0][4] = false;
      iMatrix[0][5] = false;
      iMatrix[0][6] = false;
      iMatrix[0][7] = false;
      iMatrix[1][0] = true;
      iMatrix[1][1] = false;
      iMatrix[1][2] = true;
      iMatrix[1][3] = true;
      iMatrix[1][4] = false;
      iMatrix[1][5] = false;
      iMatrix[1][6] = true;
      iMatrix[1][7] = false;
      iMatrix[2][0] = true;
      iMatrix[2][1] = true;
      iMatrix[2][2] = false;
      iMatrix[2][3] = true;
      iMatrix[2][4] = true;
      iMatrix[2][5] = false;
      iMatrix[2][6] = false;
      iMatrix[2][7] = false;
      iMatrix[3][0] = false;
      iMatrix[3][1] = true;
      iMatrix[3][2] = true;
      iMatrix[3][3] = false;
      iMatrix[3][4] = false;
      iMatrix[3][5] = true;
      iMatrix[3][6] = true;
      iMatrix[3][7] = false;
      iMatrix[4][0] = false;
      iMatrix[4][1] = false;
      iMatrix[4][2] = true;
      iMatrix[4][3] = false;
      iMatrix[4][4] = false;
      iMatrix[4][5] = true;
      iMatrix[4][6] = false;
      iMatrix[4][7] = false;
      iMatrix[5][0] = false;
      iMatrix[5][1] = false;
      iMatrix[5][2] = false;
      iMatrix[5][3] = true;
      iMatrix[5][4] = true;
      iMatrix[5][5] = false;
      iMatrix[5][6] = true;
      iMatrix[5][7] = true;
      iMatrix[6][0] = false;
      iMatrix[6][1] = true;
      iMatrix[6][2] = false;
      iMatrix[6][3] = true;
      iMatrix[6][4] = false;
      iMatrix[6][5] = true;
      iMatrix[6][6] = false;
      iMatrix[6][7] = true;
      iMatrix[7][0] = false;
      iMatrix[7][1] = false;
      iMatrix[7][2] = false;
      iMatrix[7][3] = false;
      iMatrix[7][4] = false;
      iMatrix[7][5] = true;
      iMatrix[7][6] = true;
      iMatrix[7][7] = false;

      break;

    case 8:
      // Non-Hamiltonian Example

      verticesX = new int[6];

      verticesY = new int[6];





      verticesX[0] = 109;

      verticesX[1] = 109;

      verticesX[2] = 109;

      verticesX[3] = 109;

      verticesX[4] = 333;

      verticesX[5] = 333;





      verticesY[0] = 94;

      verticesY[1] = 181;

      verticesY[2] = 275;

      verticesY[3] = 359;

      verticesY[4] = 150;

      verticesY[5] = 317;





      iMatrix[0][0] = false;

      iMatrix[0][1] = false;

      iMatrix[0][2] = false;

      iMatrix[0][3] = false;

      iMatrix[0][4] = true;

      iMatrix[0][5] = true;

      iMatrix[1][0] = false;

      iMatrix[1][1] = false;

      iMatrix[1][2] = false;

      iMatrix[1][3] = false;

      iMatrix[1][4] = true;

      iMatrix[1][5] = true;

      iMatrix[2][0] = false;

      iMatrix[2][1] = false;

      iMatrix[2][2] = false;

      iMatrix[2][3] = false;

      iMatrix[2][4] = true;

      iMatrix[2][5] = true;

      iMatrix[3][0] = false;

      iMatrix[3][1] = false;

      iMatrix[3][2] = false;

      iMatrix[3][3] = false;

      iMatrix[3][4] = true;

      iMatrix[3][5] = true;

      iMatrix[4][0] = true;

      iMatrix[4][1] = true;

      iMatrix[4][2] = true;

      iMatrix[4][3] = true;

      iMatrix[4][4] = false;

      iMatrix[4][5] = false;

      iMatrix[5][0] = true;

      iMatrix[5][1] = true;

      iMatrix[5][2] = true;

      iMatrix[5][3] = true;

      iMatrix[5][4] = false;

      iMatrix[5][5] = false;


      break;

    case 7:
      // Example 4


      verticesX = new int[9];

      verticesY = new int[9];





      verticesX[0] = 102;

      verticesX[1] = 183;

      verticesX[2] = 259;

      verticesX[3] = 345;

      verticesX[4] = 102;

      verticesX[5] = 183;

      verticesX[6] = 345;

      verticesX[7] = 259;

      verticesX[8] = 345;





      verticesY[0] = 172;

      verticesY[1] = 172;

      verticesY[2] = 172;

      verticesY[3] = 172;

      verticesY[4] = 236;

      verticesY[5] = 321;

      verticesY[6] = 321;

      verticesY[7] = 236;

      verticesY[8] = 236;





      iMatrix[0][0] = false;

      iMatrix[0][1] = true;

      iMatrix[0][2] = false;

      iMatrix[0][3] = false;

      iMatrix[0][4] = true;

      iMatrix[0][5] = false;

      iMatrix[0][6] = false;

      iMatrix[0][7] = false;

      iMatrix[0][8] = false;

      iMatrix[1][0] = true;

      iMatrix[1][1] = false;

      iMatrix[1][2] = true;

      iMatrix[1][3] = false;

      iMatrix[1][4] = true;

      iMatrix[1][5] = false;

      iMatrix[1][6] = false;

      iMatrix[1][7] = false;

      iMatrix[1][8] = false;

      iMatrix[2][0] = false;

      iMatrix[2][1] = true;

      iMatrix[2][2] = false;

      iMatrix[2][3] = true;

      iMatrix[2][4] = false;

      iMatrix[2][5] = false;

      iMatrix[2][6] = false;

      iMatrix[2][7] = true;

      iMatrix[2][8] = false;

      iMatrix[3][0] = false;

      iMatrix[3][1] = false;

      iMatrix[3][2] = true;

      iMatrix[3][3] = false;

      iMatrix[3][4] = false;

      iMatrix[3][5] = false;

      iMatrix[3][6] = false;

      iMatrix[3][7] = false;

      iMatrix[3][8] = true;

      iMatrix[4][0] = true;

      iMatrix[4][1] = true;

      iMatrix[4][2] = false;

      iMatrix[4][3] = false;

      iMatrix[4][4] = false;

      iMatrix[4][5] = true;

      iMatrix[4][6] = false;

      iMatrix[4][7] = false;

      iMatrix[4][8] = false;

      iMatrix[5][0] = false;

      iMatrix[5][1] = false;

      iMatrix[5][2] = false;

      iMatrix[5][3] = false;

      iMatrix[5][4] = true;

      iMatrix[5][5] = false;

      iMatrix[5][6] = true;

      iMatrix[5][7] = false;

      iMatrix[5][8] = false;

      iMatrix[6][0] = false;

      iMatrix[6][1] = false;

      iMatrix[6][2] = false;

      iMatrix[6][3] = false;

      iMatrix[6][4] = false;

      iMatrix[6][5] = true;

      iMatrix[6][6] = false;

      iMatrix[6][7] = true;

      iMatrix[6][8] = true;

      iMatrix[7][0] = false;

      iMatrix[7][1] = false;

      iMatrix[7][2] = true;

      iMatrix[7][3] = false;

      iMatrix[7][4] = false;

      iMatrix[7][5] = false;

      iMatrix[7][6] = true;

      iMatrix[7][7] = false;

      iMatrix[7][8] = false;

      iMatrix[8][0] = false;

      iMatrix[8][1] = false;

      iMatrix[8][2] = false;

      iMatrix[8][3] = true;

      iMatrix[8][4] = false;

      iMatrix[8][5] = false;

      iMatrix[8][6] = true;

      iMatrix[8][7] = false;

      iMatrix[8][8] = false;




      break;

    case 9: // saving graph or loading stored graph

      println("Managing saved graph");

      if (savedGraph) {
        // There is a graph saved
        
        iMatrix = new boolean[100][100]; // reinitialize iMatrix
        
        println("Recalling saved graph");
        for (int i = 0; i < 100; i++) {
          arrayCopy(storedGraph[i], iMatrix[i]);
        } 

        verticesX = new int[storedX.length];
        verticesY = new int[storedY.length];

        arrayCopy(storedX, verticesX);
        arrayCopy(storedY, verticesY);
      }
      else {
        println("No graph, so storing current graph");
        storeGraph();
      }

      break;
    }
  }

  drawGraph();
  drawMenu();
  changeMode(4);
}

