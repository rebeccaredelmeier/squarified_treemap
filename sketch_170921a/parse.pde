void parse() 
{
  String[] lines = loadStrings("./hierarchy1.shf");
  int leafNodes = int(lines[0]);
  tree.ensureCapacity(leafNodes);
  initTree(0, leafNodes);
  
  parseLeafNodes(lines, leafNodes);
  parseRelationships(lines, leafNodes);
  rootNode = findRoot();
}

void parseLeafNodes(String[] lines, int leafNodes) {
  for (int i = 1; i < leafNodes + 1; i++) {
    String currLine = lines[i];
    int spaceI = currLine.indexOf(" ");
    int nodeID = int(currLine.substring(0, spaceI));
    int weight = int(currLine.substring(spaceI + 1, currLine.length()));
    tree.ensureCapacity(nodeID);
    initTree(treeElems, nodeID + 1);
    Node newNode = tree.get(nodeID);
    newNode.ID = nodeID;
    newNode.weight = weight;
    tree.set(nodeID, newNode);
  
    //initTree(treeElems, nodeID++);
    //if (nodeID >= treeElems) { //expand and initialize new nodes
      //initTree(treeElems, nodeID+1);
    //}
  }
}

void parseRelationships(String[] lines, int leafNodes) {
  int i = leafNodes + 2; // to begin on the right line
  int relationships = int(lines[leafNodes + 1]);
  
  for (int j = 0; j < relationships; j++) {
     String currLine = lines[i + j];
     int spaceI = currLine.indexOf(" ");
     int parentID = int(currLine.substring(0, spaceI));
     int childID = int(currLine.substring(spaceI + 1, currLine.length()));
     if (childID >= treeElems) { // check to see if Node has already been made
       initTree(treeElems, childID + 1);
     } 
     Node childNode = tree.get(childID);
     childNode.parentID = parentID;
     tree.set(childID, childNode);
     
     
     if (parentID >= treeElems) {
       initTree(treeElems, parentID + 1);
     }

     Node parentNode = tree.get(parentID);
     if (parentNode.ID == -1) { // check to see if Node has already been made
       parentNode.ID = parentID;
     }
     parentNode = addChild(parentID, childID);
     tree.set(parentID, parentNode);
     printNode(parentNode);
  }
}

  Node addChild(int NodeID, int toAdd) {
    Integer intObj = new Integer(toAdd);
    Node currNode = tree.get(NodeID);
    currNode.childIDs.add(intObj); // casting Integer
    Node child = tree.get(toAdd);
    currNode.weight += child.weight;
    return currNode;
  }

int findRoot() {
  for (int i = 0; i < tree.size(); i++) {
      Node tempNode = tree.get(i);
      if (tempNode.parentID == -1)   {
        return i;
      }
  }
  return -1;
}

void initTree(int low, int high) 
{
  for (int i = low; i < high; i++) {
    Node newNode = new Node(-1, 0);
    tree.add(i, newNode);
    treeElems++;
  }
}

// --------------------------------- //
void printNode(Node currNode) {
 print("NodeID: " + currNode.ID); 
 print(" parentID: " + currNode.parentID); 
 print(" weight: " + currNode.weight); 
 print(" children: ");
 for (int i = 0; i < currNode.childIDs.size(); i++) {
   print(currNode.childIDs.get(i) + " "); 
 }
 println();
}