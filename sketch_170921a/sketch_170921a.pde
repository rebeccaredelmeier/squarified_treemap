ArrayList<Node> tree;
int treeElems;
int rootNode;
Rectangle test;

void setup() 
{
  background(204);
  tree = new ArrayList<Node>();
  parse();
  //traverse();
  surface.setResizable(true);
  test = new Rectangle(60, 60, 20, 20, 1);
}

void draw() 
{
  //for (int i = 0; i < currCanvas.numRects
    test.checkRect();
      
}

void traverse() {
  Node tempNode = tree.get(rootNode);
  traverseHelper(tempNode);
}

void traverseHelper(Node currNode) {
  print("nodeID: " + currNode.ID + " ");
  if (currNode.childIDs.size() == 0) {
    print(currNode.weight + "*  ");
    return;
  }

  for(int i = 0; i < currNode.childIDs.size(); i++) {
    int currChild = currNode.childIDs.get(i);
    traverseHelper(tree.get(currChild)); 
  }
}