Node [] tree;
int rootNode;

void setup() 
{
  background(204);
}

void draw() 
{
}

void parse() 
{
  String[] lines = loadStrings("./data.csv");
  int leafNodes = int(lines[0]);
  int relationships = int(lines[leafNodes]);
  int i, j; // iterator
  String currLine;
  
  string prevLine = 0;
  for (i = 1; i < leafNodes; i++) {
    currLine = lines[i];
    int spaceI = currLine.indexOf(" ");
    int nodeID = int(currLine.substring(0, spaceI - 1));
    int weight = int(currLine.substring(spaceI + 1, currLine.length()));
    tree[nodeID] = new Node (nodeID, weight);
  }
  
  for (j = i; j < relationships; j++) {
     currLine = lines[j];
     int spaceI = currLine.indexOf(" ");
     int parentID = int(currLine.substring(0, spaceI - 1));
     int childID = int(currLine.substring(spaceI + 1, currLine.length()));
     tree[childID].parentID = parentID;
     tree[parentID].addChild(childID);
  }
  rootNode = findRoot();
}

// tree[] as a dynamic array 

// int findRoot() {

// }

//void traverse() {
  
//}



class Node {
  
  int ID;
  int parentID;
  int weight;
  int numChildren;
  ArrayList<Integer> childIDs
  int sizeChildArray;
  
  Node(int currID, int currWeight) {
    ID = currID;
    weight = currWeight;
    numChildren = 0;
    childIDs = new ArrayList<Integer>();
    parentID = -1;
  }
  
  void addChild(int toAdd) {
    Integer intObj = new Integer(toAdd);
    childIDs.add(intObj); // casting Integer
    numChildren++;
  }
}