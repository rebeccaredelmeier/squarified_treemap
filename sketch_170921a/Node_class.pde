class Node {
  
  int ID;
  int parentID;
  int weight;
  ArrayList<Integer> childIDs;
  
  Node(int currID, int currWeight) {
    ID = currID;
    weight = currWeight;
    childIDs = new ArrayList<Integer>();
    parentID = -1;
  }
  
  void addChild(int toAdd) {
    Integer intObj = new Integer(toAdd);
    childIDs.add(intObj); // casting Integer
  }
}