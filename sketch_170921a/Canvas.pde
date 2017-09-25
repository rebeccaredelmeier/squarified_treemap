class Canvas {

  int canvasW, canvasH, VA_ratio;
  Node root;
  ArrayList<Rectangle> rectangles;
  
  Canvas(int w, int h, int rootNode) {
    canvasW = w;
    canvasH = h;
    
    root = tree.get(rootNode);
    rectangles = new ArrayList<Rectangle>();
    for(int i = 0; i < root.childIDs.size(); i++) {
      Rectangle newRect = new Rectangle();
      rectangles.add(newRect);
    }
    
  }
  
  void updateCanvas(int w, int h)
  {
    canvasW = w;
    canvasH = h;
    int total_value = root.weight;
    VA_ratio = (canvasW * canvasH) / total_value;
    String short_side; 
    int short_side_length;
    
    if (canvasW >= canvasH) {
      short_side = "width";
      short_side_length = canvasH;
    }
    else {
      short_side = "height";
      short_side_length = canvasW;
    }
    //Rectangle currRect = new Rectangle(0, 0, side_length, (currArea/2), currChild.ID);
    //rectangles.add(currRect);
    fillCanvas(short_side, short_side_length, 0, 0);
  }
  
  void fillCanvas(String short_side, int side_length, int x, int y) 
  {
    int elemsAdded = 0;
    long ratio_C1 = 0;
    
    //root.childIDs.size()
    for (int i = 0; i < 1 ; i++) {
      //for (int j = 0; j <= elemsAdded; j++) {
        Node currChild = tree.get(root.childIDs.get(i));
        long ratio_C2 = tryAdding(side_length, currChild);
        
        //TODO: ratios!
        if (ratio_C2 >= ratio_C1) {
          elemsAdded++;
          set_and_update(short_side, side_length, x, y, currChild, elemsAdded);
          ratio_C1 = ratio_C2;
        }
        else { //step 13, make new canvas
          break;
        }
      //}
    }
  }
  
  void set_and_update(String short_side, int side_length, int x, int y, Node toAdd, int elemsAdded)
  {
    int currArea = toAdd.weight*VA_ratio;
    int currX, currY, w, h;
    
    if (short_side == "width") {
      currX = x + (side_length/elemsAdded) * (elemsAdded - 1);
      currY = y;
      w = side_length / elemsAdded;
      h = currArea / w;
     }
     else {
       currX = x;
       currY = y + (side_length/elemsAdded) * (elemsAdded - 1) ;
       h = side_length / elemsAdded;
       w = currArea/h;
     }
     rectangles.get(elemsAdded).setRect(currX, currY, w, h, toAdd.ID);
     elemsAdded++;
      
  }
  
  //returns aspect ratio
  long tryAdding(int side_length, Node currAttempt) {
    
    int w = side_length;
    int h = currAttempt.weight * VA_ratio;
    
    return w/h;
  }
}
 