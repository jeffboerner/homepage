public class Control extends Object {

  String[] titles;

  int originX = 0;
  int originY = 0;

  int selectedComponent;

  int theWidth = 50;

  Control(String[] t) {
    titles = new String[t.length];
    arrayCopy(t, titles);
    //controlArray = (Control[]) append(controlArray, this);
  }

  void display() {
    
    selectedComponent = min(selectedComponent,titles.length-1);
    selectedComponent = max(selectedComponent,0);
    
    stroke(0);
    
    for (int i = 0; i < titles.length; i++) {
      if (selectedComponent == i) {
        fill(0, 0, 0, 20);
        rect(originX+i*theWidth, originY, theWidth, 25);
      }
      else {
        fill(255, 255, 255);
        rect(originX+i*theWidth, originY, theWidth, 25);
      }
      stroke(0,0,0);
      fill(0, 0, 0);
      textAlign(CENTER);
      textSize(20);
      text(titles[i], originX+i*theWidth, originY+5, theWidth, 25);
    }
  }

  Boolean touched() {
    if (mouseX >= originX && mouseY >= originY && mouseX <= originX + theWidth*titles.length && mouseY <= originY + 25) {
      selectedComponent = floor((mouseX-originX)/((float)theWidth));
      currentn--;
      return true;
    }
    return false;
  }
}
