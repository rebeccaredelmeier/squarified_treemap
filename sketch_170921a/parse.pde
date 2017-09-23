void parse() 
{
  String[] lines = loadStrings("./hierarchy1.shf");
  int leafNodes = int(lines[0]);
  int i; // iterator
  
  i = parseLeafNodes(lines, leafNodes);
  parseRelationships(i, lines);
  rootNode = findRoot();
}

int parseLeafNodes(String[] lines, int leafNodes) {
  String currLine;
  int i;
  tree.ensureCapacity(leafNodes);
  initTree(0, leafNodes);
  
  for (i = 1; i < leafNodes + 1; i++) {
    currLine = lines[i];
    int spaceI = currLine.indexOf(" ");
    int nodeID = int(currLine.substring(0, spaceI));
    int weight = int(currLine.substring(spaceI + 1, currLine.length()));
    Node newNode = new Node (nodeID, weight);
    initTree(treeElems, nodeID++);
    if (nodeID >= treeElems) { //expand and initialize new nodes
      initTree(treeElems, nodeID+1);
    }
    tree.add(nodeID, newNode);
    println("just added: " + nodeID);
  }
  return i;
}

void parseRelationships(int i, String[] lines) {
  String currLine;
  
  int relationships = int(lines[i]);
  
  for (int j = 0; j < relationships; j++) {
     currLine = lines[i+j+1];
     int spaceI = currLine.indexOf(" ");
     int parentID = int(currLine.substring(0, spaceI));
     println("adding parent id: " + parentID);
     int childID = int(currLine.substring(spaceI + 1, currLine.length()));

     Node childNode = new Node (childID, -1);
     if (childID >= treeElems) { // check to see if Node has already been made
       initTree(treeElems, childID +1);
     } 
     childNode = tree.get(childID);
     childNode.parentID = parentID;
     tree.set(childID, childNode);
     println("childNode: ");
     printNode(childNode);
     
     if (parentID >= treeElems) {
       initTree(treeElems, parentID + 1);
       println("!!!!!!!!!!!initing tree");
     }

     Node parentNode = tree.get(parentID);
     println("!!!parentnode.id is: " + parentNode.ID);
     if (parentNode.ID == -1) { // check to see if Node has already been made
       parentNode.ID = parentID;
       println("********setting new parent ID");
     }
     parentNode.addChild(childID);
     tree.set(parentID, parentNode);
     println("parentNode: ");
     println("NOW parent id: " + parentNode.ID);
     printNode(parentNode);
     println();
  }
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
  for (int i = low; i <= high; i++) {
    Node newNode = new Node(-1, -1);
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