class Rectangle {

  Node currNode;
  int rectWidth, rectHeight, rectX, rectY;
  
  Rectangle() {
    fill(255);
  }
  
  boolean mouseOver() {
    if (mouseX >= rectX && mouseX <= rectX+rectWidth &&
        mouseY >= rectY && mouseY <= rectY+rectHeight) {
          return true;
     }
     else {
       return false;  
     }
  }
  
  void setRect(int x, int y, int w, int h, int ID) {
    rectX = x;
    rectY = y;
    rectWidth = w;
    rectHeight = h;
    drawRect();
  }
  
  void drawRect() {
    rect(rectX, rectY, rectWidth, rectHeight);
    
  }
  
  void checkRect() {
    if (mouseOver()) {
      
      fill(345);
      rect(rectX, rectY, rectWidth, rectHeight);
    }
    else {
      fill(153);
      rect(rectX, rectY, rectWidth, rectHeight);
    }
  }
}