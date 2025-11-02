import processing.core.*; 
import processing.xml.*; 

import processing.opengl.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class SafeConfigSpace extends PApplet {



boolean xyPlane = false;
boolean yzPlane = false;
boolean zxPlane = false;

boolean axes = true;

StateChange[] changeArray;

float zoom = 1;

int time = 0;

Boolean grow = false;
int growDirection = 1;

Boolean planes = true;
Boolean colors = false;

int mesh = 6;

int side = 100;

float angle = 0.5f;

public void setup() {
  size(500, 500, OPENGL);

  changeArray = new StateChange[0];

  //frameRate(60);
  //smooth();
}

public void draw() {
  background(255, 255, 255);

  /* Lighting */
  //lights();
  ambientLight(180, 180, 180);
  directionalLight(80, 50, 50, 1, 1, -1);
  directionalLight(20, 10, 10, -1, 1, -1);
 
  translate(250, 250, 0);
  scale(zoom);

  /* Set translation */
  for (int i = changeArray.length - 1; i >= 0; i--) {
    StateChange change = changeArray[i];
    translate(change.deltaX, change.deltaY, change.deltaZ);
  }
  /* Set rotation */
  for (int i = changeArray.length - 1; i >= 0; i--) {
    StateChange change = changeArray[i];
    rotateX(change.deltaRotX);
    rotateY(change.deltaRotY);
    rotateZ(change.deltaRotZ);
  }
  
  if(axes) drawAxes();

  drawCube(time);

  if (planes) drawPlanes();

  if (grow) {
    time += -growDirection;
    time = max(time, 0);
  }

  /* Coordinate axes
   stroke(0, 0, 0);
   line(-250, 0, 0, 250, 0, 0);
   stroke(255, 0, 0);
   line(0, -250, 0, 0, 250, 0);
   stroke(0, 255, 0);
   line(0, 0, -250, 0, 0, 250);
   */
}

public void drawPlanes() {

  fill(200, 200, 200);

  //y=z plane
  if (yzPlane) {
    beginShape();
    vertex(side, -side, -side);
    vertex(side, side, side);
    vertex(-side, side, side);
    vertex(-side, -side, -side);
    endShape(CLOSE);
  }

  //x=z plane
  if (zxPlane) {
    beginShape();
    vertex(side, side, side);
    vertex(-side, side, -side);
    vertex(-side, -side, -side);
    vertex(side, -side, side);
    endShape(CLOSE);
  }

  //x=y plane
  if (xyPlane) {
    beginShape();
    vertex(side, side, side);
    vertex(-side, -side, side);
    vertex(-side, -side, -side);
    vertex(side, side, -side);
    endShape(CLOSE);
  }
}

public void drawCube(int t) {

  if (t < 0) {
    return;
  }

  for (int i = -50; i <= 50; i+=mesh) {
    for (int j = -50; j <= 50; j+=mesh) {
      for (int k = -50; k <= 50; k+=mesh) {

        stroke(0, 0, 0);
        fill(0, 0, 0);

        //(1,1,1)_PERP spanned by
        Vector basis1 = new Vector(1, -1, 0);
        Vector basis2 = new Vector(-1, -1, 1);
        Vector offset = new Vector(0, 0, 0);

        float theta = .64f*PI;

        if (i < j && j < k) {
          // RED
          stroke(255, 0, 0);
          fill(255, 0, 0);

          basis1 = basis1.scalarMultiple(cos(theta));
          basis2 = basis2.scalarMultiple(sin(theta));

          offset = offset.sum(basis1);
          offset = offset.sum(basis2);

          stroke(255, 0, 0);
        }

        theta += PI/3.0f;

        if (i < k && k < j) {
          // GREEN
          stroke(0, 180, 0);
          fill(0, 180, 0);

          basis1 = basis1.scalarMultiple(cos(theta));
          basis2 = basis2.scalarMultiple(sin(theta));

          offset = offset.sum(basis1);
          offset = offset.sum(basis2);
        }

        theta += PI/3.0f;

        if (k < i && i < j) {
          // Orange
          stroke(255, 165, 0);
          fill(255, 165, 0);

          basis1 = basis1.scalarMultiple(cos(theta));
          basis2 = basis2.scalarMultiple(sin(theta));

          offset = offset.sum(basis1);
          offset = offset.sum(basis2);
        }

        theta += PI/3.0f;

        if (k < j && j < i) {
          // YELLOW
          stroke(255, 255, 0);
          fill(255, 255, 0);

          basis1 = basis1.scalarMultiple(cos(theta));
          basis2 = basis2.scalarMultiple(sin(theta));

          offset = offset.sum(basis1);
          offset = offset.sum(basis2);
        }

        theta += PI/3.0f;

        if (j < k && k < i) {
          // PURPLE
          stroke(255, 0, 255);
          fill(255, 0, 255);

          basis1 = basis1.scalarMultiple(cos(theta));
          basis2 = basis2.scalarMultiple(sin(theta));

          offset = offset.sum(basis1);
          offset = offset.sum(basis2);
        }

        theta += PI/3.0f;

        if (j < i && i < k) {
          // BLUE
          stroke(0, 0, 255);
          fill(0, 0, 255);

          basis1 = basis1.scalarMultiple(cos(theta));
          basis2 = basis2.scalarMultiple(sin(theta));

          offset = offset.sum(basis1);
          offset = offset.sum(basis2);
        }

        if (!colors) { 
          fill(255, 255, 255);
          noStroke();
        }

        if (i != j && i != k && j != k) {
          placeBox(i + t*offset.x, j + t*offset.y, k + t*offset.z, mesh);
        }
        else {
          if (t == 0 && !colors) {
            fill(255, 255, 255);
            noStroke();
            placeBox(i, j, k, mesh);
          }
        }
      }
    }
  }
}

public void placeBox(float xCoord, float yCoord, float zCoord, int boxSize) {
  translate(xCoord, yCoord, zCoord);
  box(boxSize);
  translate(-xCoord, -yCoord, -zCoord);
}

public void drawAxes(){
  
 stroke(255,0,0);
 line(-500,0,0,500,0,0); 
 
 stroke(0,255,0);
 line(0,-500,0,0,500,0); 
 
  stroke(0,0,255);
 line(0,0,-500,0,0,500); 
  
  
}
public class StateChange extends Object {
  
  float deltaRotX;
  float deltaRotY;
  float deltaRotZ;
  
  float deltaX;
  float deltaY;
  float deltaZ;
  
}
public void keyPressed() {

  //Rotation, Zooming
  if (keyCode == UP) {
    StateChange change = new StateChange();
    change.deltaY = -5;
    changeArray = (StateChange[]) append(changeArray, change);
  }
  if (keyCode == DOWN) {
    StateChange change = new StateChange();
    change.deltaY = 5;
    changeArray = (StateChange[]) append(changeArray, change);
  }
  if (keyCode == RIGHT) {
    StateChange change = new StateChange();
    change.deltaX = 5;
    changeArray = (StateChange[]) append(changeArray, change);
  }
  if (keyCode == LEFT) {
    StateChange change = new StateChange();
    change.deltaX = -5;
    changeArray = (StateChange[]) append(changeArray, change);
  }

  if(key == ','){
    StateChange change = new StateChange();
    change.deltaRotZ = -.09f;
    changeArray = (StateChange[]) append(changeArray, change);
  }
  if(key == '.'){
    StateChange change = new StateChange();
    change.deltaRotZ = .09f;
    changeArray = (StateChange[]) append(changeArray, change);
  }

/*
  if (key == 'z') {
    zoom *= .5;
  }
  if (key == 'x') {
    zoom *= 2;
  }
  */

  // Setting flags
  if (key == 'g') {
    grow = !grow;
    if (grow) { 
      growDirection = -growDirection;
    }
  }

  if (key == 'p') {
    planes = !planes;
  }
  if (key == 'c') {
    colors = !colors;
  }
  if (key == 'x'){
    xyPlane = !xyPlane;
  }
  if (key == 'y'){
    yzPlane = !yzPlane;
  }
  if (key == 'z'){
    zxPlane = !zxPlane;
  }
  if (key == 'a'){
    axes = !axes;
  }
}

int prevX;
int prevY;

public void mousePressed() {
  prevX = mouseX;
  prevY = mouseY;
}

public void mouseDragged() {
  StateChange change = new StateChange();

  change.deltaRotY += 0.05f*(mouseX - prevX);
  change.deltaRotX -= 0.05f*(mouseY - prevY);

  prevX = mouseX;
  prevY = mouseY;

  changeArray = (StateChange[]) append(changeArray, change);
}

public class Vector extends Object {
  float x;
  float y;
  float z;

  public Vector(float xC, float yC, float zC) {
    x = xC;
    y = yC;
    z = zC;
  }
  
  public Vector sum(Vector v){
    Vector outputVector = new Vector(x + v.x, y + v.y, z + v.z);
    
    return outputVector;
  }
  
    public Vector scalarMultiple(float scalar){
    Vector outputVector = new Vector(x*scalar, y*scalar, z*scalar);
    
    return outputVector;
  }
  
  public void printVector(){
   println("Vector is (" + x + "," + y + "," + z + ")");
  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "SafeConfigSpace" });
  }
}
