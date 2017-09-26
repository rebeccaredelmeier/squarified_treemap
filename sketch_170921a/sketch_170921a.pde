ArrayList<Node> tree;
int treeElems;
int rootNode;
Canvas c;

void setup() 
{
  size(320, 240); 
  background(204);
  tree = new ArrayList<Node>();
  parse();
  //traverse();
  surface.setResizable(true);
  c = new Canvas(width, height, rootNode);

}

void draw() 
{
  int currHeight = height;
  int currWidth = width;
  c.updateCanvas(currHeight, currWidth, 0, 0);
  for (int i = 0; i < c.rectangles.size(); i++) {
    c.rectangles.get(i).checkRect();;
  }
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