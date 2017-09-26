class Rectangle {

  Node currNode;
  float rectWidth, rectHeight, rectX, rectY;
  
  Rectangle() {
   
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
  
  void setRect(float x, float y, float w, float h, int ID) {
    rectX = x;
    rectY = y;
    rectWidth = w;
    rectHeight = h;
    currNode = tree.get(ID);
    fill(0, 102, 150);
    checkRect();
    //drawRect();
  }
  
  void drawRect() {
    rect(rectX, rectY, rectWidth, rectHeight);
    fill(0);
    text("Node ID: " + currNode.ID, rectX + (rectWidth / 2), rectY + (rectHeight / 2));
    textAlign(CENTER);
    fill(255);
    
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