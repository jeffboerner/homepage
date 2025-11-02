//////////////////////////////////////////////
//////////////////////////////////////////////

void setStoredWeights(int choice) {

  // This will set the weights of a complete graph on 4 vertices

  weights = new int[100][100];

  int ct = 0;

  while (ct < 4) {
    weights[ct][ct] = 0;
    ct++;
  }

  switch(choice) {

  case 1:  
    weights[0][1] = 50;
    weights[0][2] = 60;
    weights[0][3] = 100;

    weights[1][2] = 20;
    weights[1][3] = 10;

    weights[2][3] = 45;

    break;

  case 2:
    weights[0][1] = 25;
    weights[0][2] = 45;
    weights[0][3] = 60;

    weights[1][2] = 30;
    weights[1][3] = 35;

    weights[2][3] = 55;

    break;
    
      case 3:
    weights[0][1] = 22;
    weights[0][2] = 35;
    weights[0][3] = 30;
  //  weights[0][4] = 10;

    weights[1][2] = 50;
    weights[1][3] = 25;
    //weights[1][4] = 60;

    weights[2][3] = 50;
    //weights[2][4] = 10;
    
//    weights[3][4] = 15;
    break;
  }

  placeWeights();

  return;
}

