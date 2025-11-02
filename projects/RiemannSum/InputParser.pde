/* Responsible for turning a string into a float value */

/****
 ISSUES
 - still is having problems with negatives
 - more error checking needed
 - operations on end
 
 *****/


int indexOfMatchingParen(String str, int startIndex) {

  int parenCt = 1;

  while (parenCt > 0 && startIndex+1 < str.length ()) {
    startIndex++;

    /* 
     increment if we find open paren
     decrement if we find closed paren
     */

    if (indexEqualsString(startIndex, str, "(")) parenCt++; 
    if (indexEqualsString(startIndex, str, ")")) parenCt--;
  } 
  return startIndex;
}

String parse(String inputStr) {

  if (inputStr.equals("")) return "";

  /*************
   Replace variables and parameters
   **************/

  /* replace all x with xVal */
  while (inputStr.indexOf ('x') != -1) {
    inputStr = inputStr.substring(0, inputStr.indexOf ('x')) + 
      xVal +
      inputStr.substring(inputStr.indexOf ('x')+1);
  }
  while (inputStr.indexOf ('y') != -1) {
    inputStr = inputStr.substring(0, inputStr.indexOf ('y')) + 
      yVal +
      inputStr.substring(inputStr.indexOf ('y')+1);
  }

  /*************
   Evaluate Functions
   **************/

  /* sin */
  while (inputStr.indexOf ("sin") != -1) {
    int matchIndex = indexOfMatchingParen(inputStr, inputStr.indexOf("sin")+4);
    inputStr = inputStr.substring(0, inputStr.indexOf ("sin")) + 
      sin(float(parse(inputStr.substring(inputStr.indexOf("sin")+4, matchIndex)))) +
      inputStr.substring(matchIndex+1);
  }
  /* cos */
  while (inputStr.indexOf ("cos") != -1) {
    int matchIndex = indexOfMatchingParen(inputStr, inputStr.indexOf("cos")+4);
    inputStr = inputStr.substring(0, inputStr.indexOf ("cos")) + 
      cos(float(parse(inputStr.substring(inputStr.indexOf("cos")+4, matchIndex)))) +
      inputStr.substring(matchIndex+1);
  }

  /*************
   Evaluate everything in parens
   **************/

  while (inputStr.indexOf ('(') != -1) {
    /* open paren present */

    int parenCt = 1;
    int index = inputStr.indexOf('(');

    while (parenCt > 0 && index+1 < inputStr.length ()) {
      index++;

      /********* 
       increment if we find open paren
       decrement if we find closed paren
       ********/
      if (indexEqualsString(index, inputStr, "(")) parenCt++; 
      if (indexEqualsString(index, inputStr, ")")) parenCt--;
    }

    if (parenCt != 0) {
      println("PARSE ERROR - mismatched parentheses");
    }
    else {
      inputStr = inputStr.substring(0, inputStr.indexOf('(')) + 
        parse(inputStr.substring(inputStr.indexOf('(')+1, index)) +
        inputStr.substring(index+1);
    }
  }

  /* All parens have been removed */

  /* replace "--" with "+" */
  while (inputStr.indexOf ("--") != -1) {
    inputStr = inputStr.substring(0, inputStr.indexOf ("--")) + 
      "+" +
      inputStr.substring(inputStr.indexOf ("--")+2);
  }

  /* adjust if leads with + */
  if (indexEqualsString(0, inputStr, "+")) {
    inputStr = inputStr.substring(1);
  }

  String[] expressionArray = new String[1];
  expressionArray[0] = inputStr;

  /* create expressionArray */
  for (int i = 0; i < inputStr.length(); i++) {
    if (indexEqualsString(i,inputStr, "*")) {
      inputStr = expressionArray[expressionArray.length-1];
      expressionArray[expressionArray.length-1] = inputStr.substring(0, i);
      expressionArray = append(expressionArray, "*");
      expressionArray = append(expressionArray, inputStr.substring(i+1));
      inputStr = expressionArray[expressionArray.length-1];
      i = 0;
    }
    else if (indexEqualsString(i,inputStr, "/")) {
      inputStr = expressionArray[expressionArray.length-1];
      expressionArray[expressionArray.length-1] = inputStr.substring(0, i);
      expressionArray = append(expressionArray, "/");
      expressionArray = append(expressionArray, inputStr.substring(i+1));
      inputStr = expressionArray[expressionArray.length-1];
      i = 0;
    }
    else if (indexEqualsString(i,inputStr, "^")) {
      inputStr = expressionArray[expressionArray.length-1];
      expressionArray[expressionArray.length-1] = inputStr.substring(0, i);
      expressionArray = append(expressionArray, "^");
      expressionArray = append(expressionArray, inputStr.substring(i+1));
      inputStr = expressionArray[expressionArray.length-1];
      i = 0;
    }
    else if (indexEqualsString(i,inputStr, "+")) {
      inputStr = expressionArray[expressionArray.length-1];
      expressionArray[expressionArray.length-1] = inputStr.substring(0, i);
      expressionArray = append(expressionArray, "+");
      expressionArray = append(expressionArray, inputStr.substring(i+1));
      inputStr = expressionArray[expressionArray.length-1];
      i = 0;
    }/*
    else if (inputStr.charAt(i) == '-') {
     inputStr = expressionArray[expressionArray.length-1];
     expressionArray[expressionArray.length-1] = inputStr.substring(0, i);
     expressionArray = append(expressionArray, "-");
     expressionArray = append(expressionArray, inputStr.substring(i+1));
     inputStr = expressionArray[expressionArray.length-1];
     i = 0;
     }*/
  }

  if (expressionArray.length == 1) return expressionArray[0];

  //println(expressionArray);

  /* apply operations to array */

  for (int i = 1; i < expressionArray.length; i+=2) {
    if (expressionArray[i].equals("^")) {
      expressionArray[i-1] = "" + pow(float(parse(expressionArray[i-1])), float(parse(expressionArray[i+1])));

      /* update expressionArray */
      String[] tempArray = new String[expressionArray.length];
      arrayCopy(expressionArray, tempArray);
      expressionArray = new String[expressionArray.length-2];
      expressionArray[i-1] = tempArray[i-1];
      for (int j = 0; j < i-1; j++) {
        expressionArray[j] = tempArray[j];
      }
      for (int j = i+2; j < tempArray.length; j++) {
        expressionArray[j-2] = tempArray[j];
      }
      i-=2;
    }
  }

  for (int i = 1; i < expressionArray.length; i+=2) {
    if (expressionArray[i].equals("*")) {
      expressionArray[i-1] = "" + float(parse(expressionArray[i-1]))*float(parse(expressionArray[i+1]));

      /* update expressionArray */
      String[] tempArray = new String[expressionArray.length];
      arrayCopy(expressionArray, tempArray);
      expressionArray = new String[expressionArray.length-2];
      expressionArray[i-1] = tempArray[i-1];
      for (int j = 0; j < i-1; j++) {
        expressionArray[j] = tempArray[j];
      }
      for (int j = i+2; j < tempArray.length; j++) {
        expressionArray[j-2] = tempArray[j];
      }
      i-=2;
    }
    else if (expressionArray[i].equals("/")) {
      expressionArray[i-1] = "" + float(parse(expressionArray[i-1]))/float(parse(expressionArray[i+1]));

      /* update expressionArray */
      String[] tempArray = new String[expressionArray.length];
      arrayCopy(expressionArray, tempArray);
      expressionArray = new String[expressionArray.length-2];
      expressionArray[i-1] = tempArray[i-1];
      for (int j = 0; j < i-1; j++) {
        expressionArray[j] = tempArray[j];
      }
      for (int j = i+2; j < tempArray.length; j++) {
        expressionArray[j-2] = tempArray[j];
      }
      i-=2;
    }
  }

  //inputStr = expressionArray[0];

  //println("About to look for +-");
  //println(expressionArray);

  for (int i = 1; i < expressionArray.length; i+=2) {

    //println("2nd order operations present");

    if (expressionArray[i].equals("+")) {
      expressionArray[i-1] = "" + (float(expressionArray[i-1])+float(expressionArray[i+1]));

      /* update expressionArray */
      String[] tempArray = new String[expressionArray.length];
      arrayCopy(expressionArray, tempArray);
      expressionArray = new String[expressionArray.length-2];
      expressionArray[i-1] = tempArray[i-1];
      for (int j = 0; j < i-1; j++) {
        expressionArray[j] = tempArray[j];
      }
      for (int j = i+2; j < tempArray.length; j++) {
        expressionArray[j-2] = tempArray[j];
      }
      i-=2;
    }/*
    else if (expressionArray[1].equals("-")) {
     expressionArray[0] = "" + (float(expressionArray[0])-float(expressionArray[2]));
     
     // update expressionArray 
     String[] tempArray = new String[expressionArray.length];
     arrayCopy(expressionArray, tempArray);
     expressionArray = new String[expressionArray.length-2];
     expressionArray[i-1] = tempArray[i-1];
     for (int j = 0; j < i-1; j++) {
     expressionArray[j] = tempArray[j];
     }
     for (int j = i+2; j < tempArray.length; j++) {
     expressionArray[j-2] = tempArray[j];
     }
     }*/
  }

  inputStr = expressionArray[0];

  /*
  for(int i = 0; i < inputStr.length(); i++){
   if(inputStr.charAt(i) == '*'){
   inputStr = "" + float(parse(inputStr.substring(0,i)))*float(parse(inputStr.substring(i+1)));
   i = 0;
   } 
   if(inputStr.charAt(i) == '^'){
   inputStr = "" + pow(float(parse(inputStr.substring(0,i))),float(parse(inputStr.substring(i+1))));
   i = 0;
   } 
   }
   */

  return inputStr;
}

