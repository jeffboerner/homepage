
int colorIndex = 0;

void setup() {
  size(500, 500);
  background(255,255,255);
  
  //star(250,250,40);
}

void draw() {
}

void mouseDragged() {
  setColor();
  //ellipse(mouseX, mouseY, 5, 5); 
  star(mouseX,mouseY,10);
  colorIndex++;
  if(colorIndex > 6) colorIndex = 0;
}

void setColor() {

  switch(colorIndex) {

  case 0:
    // red
    fill(200, 0, 0);
    break;

  case 1:
    // orange
    fill(255, 153, 51);
    break;

  case 2:
    // yellow
    fill(255, 255, 0);
    break;

  case 3:
    // green
    fill(0, 120, 0);
    break;

  case 4:
    // blue
    fill(0, 0, 120);
    break;

  case 5:
    // indigo
    fill(75, 0, 130);
    break;

  case 6:
    // violet
    fill(120, 0, 120);
    break;
  }
}

void keyPressed(){
 if(key == 'r') background(255,255,255); 
}

void star(int x, int y, int size){
  beginShape();
  /*
  vertex(x + 1/4.0*size*cos(PI/2.0-.4),y - 1/4.0*size*sin(PI/2.0-.4));
  vertex(x + size*cos(PI/2.0),y - size*sin(PI/2.0));
  vertex(x + 1/4.0*size*cos(PI/2.0+.4),y - 1/4.0*size*sin(PI/2.0+.4));
  
  vertex(x + 1/4.0*size*cos(PI/2.0 + 2*PI/5.0 -.4),y - 1/4.0*size*sin(PI/2.0 + 2*PI/5.0 -.4));
  vertex(x + size*cos(PI/2.0 + 2*PI/5.0),y - size*sin(PI/2.0 + 2*PI/5.0));
  vertex(x + 1/4.0*size*cos(PI/2.0 + 2*PI/5.0 +.4),y - 1/4.0*size*sin(PI/2.0 + 2*PI/5.0 +.4));
  
  vertex(x + 1/4.0*size*cos(PI/2.0 + 2*2*PI/5.0 -.4),y - 1/4.0*size*sin(PI/2.0 + 2*2*PI/5.0-.4));
  vertex(x + size*cos(PI/2.0 + 2*2*PI/5.0),y - size*sin(PI/2.0 + 2*2*PI/5.0));
  vertex(x + 1/4.0*size*cos(PI/2.0 + 2*2*PI/5.0 +.4),y - 1/4.0*size*sin(PI/2.0 + 2*2*PI/5.0+.4));
  
  vertex(x + 1/4.0*size*cos(PI/2.0+3*2*PI/5.0-.4),y - 1/4.0*size*sin(PI/2.0+3*2*PI/5.0-.4));
  vertex(x + size*cos(PI/2.0 + 3*2*PI/5.0),y - size*sin(PI/2.0 + 3*2*PI/5.0));
  vertex(x + 1/4.0*size*cos(PI/2.0+3*2*PI/5.0+.4),y - 1/4.0*size*sin(PI/2.0+3*2*PI/5.0+.4));
  
  vertex(x + 1/4.0*size*cos(PI/2.0+4*2*PI/5.0-.4),y - 1/4.0*size*sin(PI/2.0+4*2*PI/5.0-.4));
  vertex(x + size*cos(PI/2.0 + 4*2*PI/5.0),y - size*sin(PI/2.0 + 4*2*PI/5.0));
  */
  
  /*
  vertex(x + 1/2*size*cos(PI/2.0 - 2*pi/10.0),y - 1/2*size*sin(PI/2.0 - 2*pi/10.0));
  vertex(x + size*cos(PI/2.0),y - size*sin(PI/2.0));
  vertex(x + 1/2*size*cos(PI/2.0 + 2*pi/10.0),y - 1/2*size*sin(PI/2.0 - 2*pi/10.0));
  
  vertex(x + 1/4.0*size*cos(PI/2.0 + 2*PI/5.0 -.4),y - 1/4.0*size*sin(PI/2.0 + 2*PI/5.0 -.4));
  vertex(x + size*cos(PI/2.0 + 2*PI/5.0),y - size*sin(PI/2.0 + 2*PI/5.0));
  vertex(x + 1/4.0*size*cos(PI/2.0 + 2*PI/5.0 +.4),y - 1/4.0*size*sin(PI/2.0 + 2*PI/5.0 +.4));
  
  vertex(x + 1/4.0*size*cos(PI/2.0 + 2*2*PI/5.0 -.4),y - 1/4.0*size*sin(PI/2.0 + 2*2*PI/5.0-.4));
  vertex(x + size*cos(PI/2.0 + 2*2*PI/5.0),y - size*sin(PI/2.0 + 2*2*PI/5.0));
  vertex(x + 1/4.0*size*cos(PI/2.0 + 2*2*PI/5.0 +.4),y - 1/4.0*size*sin(PI/2.0 + 2*2*PI/5.0+.4));
  
  vertex(x + 1/4.0*size*cos(PI/2.0+3*2*PI/5.0-.4),y - 1/4.0*size*sin(PI/2.0+3*2*PI/5.0-.4));
  vertex(x + size*cos(PI/2.0 + 3*2*PI/5.0),y - size*sin(PI/2.0 + 3*2*PI/5.0));
  vertex(x + 1/4.0*size*cos(PI/2.0+3*2*PI/5.0+.4),y - 1/4.0*size*sin(PI/2.0+3*2*PI/5.0+.4));
  
  vertex(x + 1/4.0*size*cos(PI/2.0+4*2*PI/5.0-.4),y - 1/4.0*size*sin(PI/2.0+4*2*PI/5.0-.4));
  vertex(x + size*cos(PI/2.0 + 4*2*PI/5.0),y - size*sin(PI/2.0 + 4*2*PI/5.0));
  */
  
  drawSpoke(x,y,size,0);
  drawSpoke(x,y,size,2*PI/5.0);
  drawSpoke(x,y,size,2*2*PI/5.0);
  drawSpoke(x,y,size,3*2*PI/5.0);
  drawSpoke(x,y,size,4*2*PI/5.0);
  
  endShape(CLOSE);
}

void drawSpoke(int x, int y, int size, float angle){
  vertex(x + 1/2.0*size*cos(PI/2.0 - 2*PI/10.0 + angle),y - 1/2.0*size*sin(PI/2.0 - 2*PI/10.0 + angle));
  vertex(x + size*cos(PI/2.0 + angle),y - size*sin(PI/2.0 + angle));
  //vertex(x + 1/2.0*size*cos(PI/2.0 + 2*PI/10.0 + angle),y - 1/2.0*size*sin(PI/2.0 + 2*PI/10.0 + angle));
}

