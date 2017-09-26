static int FAR_FROM_ONE = 100000;

class Canvas {

  int canvasW, canvasH; 
  int VA_ratio;
  Node root;
  ArrayList<Rectangle> rectangles;
  int currTotalWeight;
  
  Canvas(int w, int h, int rootNode) {
    canvasW = w;
    canvasH = h;
    
    root = tree.get(rootNode);
    rectangles = new ArrayList<Rectangle>();
    
    //initialize an array of Rectangles for the number of
    //children that the node has. some of these indexes will
    //go unused.
    for(int i = 0; i < root.childIDs.size(); i++) {
      Rectangle newRect = new Rectangle();
      rectangles.add(newRect);
    }
    
  }
  
  void updateCanvas(int w, int h, int x, int y)
  {
    rectangles.clear();
    for(int i = 0; i < root.childIDs.size(); i++) {
      Rectangle newRect = new Rectangle();
      rectangles.add(newRect);
    }
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
    
    fillCanvas(short_side, short_side_length, x, y);
  }
  
  void fillCanvas(String short_side, int side_length, int x, int y) 
  {
    currTotalWeight = 0;
    int elemsAdded = 0;
    float ratio_C1 = FAR_FROM_ONE;
    
    for (int i = 0; i < root.childIDs.size() -1 ; i++) {
      elemsAdded++;
      background(204);
      Node currChild = tree.get(root.childIDs.get(i));
      currTotalWeight += currChild.weight;
      for (int j = 0; j <= elemsAdded; j++) {
        currTotalWeight += currChild.weight;
        float ratio_C2 = tryAdding(side_length, currChild);
        
        //TODO: ratios! Whichever is CLOSER to 1 wins.
        //if (closer_to_one(ratio_C1, ratio_C2)) {
          set_and_update(short_side, side_length, x, y, currChild, elemsAdded);
         // ratio_C1 = ratio_C2;
        //}
        //else { //step 13, make new canvas
        //  println("breaking");
        //  break;
        //}
      }
    }
  }
  
  void set_and_update(String short_side, int side_length, int x, int y, Node toAdd, int elemsAdded)
  {
    int currArea = toAdd.weight*VA_ratio;
    float currX, currY, w;
    float h = 0;
    
    if (short_side == "width") {
      float totalArea = (currTotalWeight*VA_ratio) / 2;
      w = (currArea/totalArea) * side_length;
      h = currArea / w;
      currY = y;
      currX = x;
      if (elemsAdded > 1) {
        Rectangle prev = rectangles.get(elemsAdded - 1);
        currX = prev.rectX + prev.rectWidth;
      }
     }
    else {
      float totalArea = (currTotalWeight*VA_ratio) / 2;
      h = (currArea/totalArea) * side_length;
      w = currArea/h;
      currX = x;
      currY = y;
      if (elemsAdded > 1) {
        Rectangle prev = rectangles.get(elemsAdded - 1);
        currY = prev.rectY + prev.rectHeight;
      }
     }
     
     Rectangle temp = rectangles.get(elemsAdded);
     temp.setRect(currX, currY, w, h, toAdd.ID);
     rectangles.set(elemsAdded, temp);
     elemsAdded++;
      
  }
  
  //returns aspect ratio
  float tryAdding(int side_length, Node currAttempt) {
    
    int w = side_length;
    int h = (currAttempt.weight * VA_ratio) / w;
    
    return w/h;
  }
  
  boolean closer_to_one(float C1_ratio, float C2_ratio)
  {
    if (Math.abs(1.0 - C2_ratio) < Math.abs(1.0 - C1_ratio)) {
      return true;
    }
    return false;
      
  }
}
 