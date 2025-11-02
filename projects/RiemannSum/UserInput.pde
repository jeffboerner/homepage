void mouseClicked(){
  
  if(key == 'f'){
  //gifExport.finish();
  }
  
  //if(true) return;
  
  if(rectControl.touched()) return;
  
  if(mouseX <= 50 && mouseY >= 450){
    auto = !auto;
    n++;
  }
  else{
  n++;
  }
}
