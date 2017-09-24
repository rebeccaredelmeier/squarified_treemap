class Rectangle {

  Node currNode;
  int rectWidth, rectHeight, rectX, rectY;
  
  Rectangle(int w, int h, int x, int y, int NodeID) {
    fill(153);
    rect(x, y, w, h);
    rectWidth = w;
    rectHeight = h;
    rectX = x;
    rectY = y;
  }
  
  boolean mouseOver() {
    if (mouseX >= rectX && mouseX <= rectX+rectWidth &&
        mouseY >= rectY && mouseY <= rectY+rectHeight) {
          println("yes moused over");
          return true;
     }
     else {
       return false;  
     }
  }
  
  void checkRect() {
    if (mouseOver()) {
      fill(80);
      rect(rectX, rectY, rectWidth, rectHeight);
    }
    else {
      fill(153);
      rect(rectX, rectY, rectWidth, rectHeight);
    }
  }
}