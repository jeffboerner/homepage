void mouseClicked() {

  if (key == 'f') {
    //gifExport.finish();
  }

  //if(true) return;

  if (rectControl.touched()) return;

  if (mouseX <= 50 && mouseY >= 450) {
    auto = !auto;
  }
  else {
  }
}

void keyPressed() {
  if (key == 'i') {
    zoomIn = true;
    zoomOut = false;
  } 
  if (key == 'o') {
    zoomIn = false;
    zoomOut = true;
  }
}

