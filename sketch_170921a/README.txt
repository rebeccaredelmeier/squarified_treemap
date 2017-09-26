README.txt
Rebecca Redelmeier & Meredith Clarke
VIS HW1
September 26, 2017


What we implemented correctly:
	Parse data in the *.shf format such that elements are stored in an array that can be traversed from root node to leaves

	Steps 1-8 of Remco's Squarified Treemap Subdivision Algorithm

	Allow mouse-over to highlight each Node

	Created a resizable visualization where the canvas is always filled


What we implemented partially corrected:
	Steps 9-12 of Remco's algorithm. We were able to place the first rectangle on the short side, and worked out how to resize that rectangle when a second, third, fourth, etc. rectangle was added to that size. However, our resize algorithm has some bugs. The algorithm that we were trying to implement is: 
		if ("width" == short_side) {
			currRect.w = (currRect.area / area of all rects currently in the same "row" as currRect) * short_side_length;
		}
		else {
		    ...same but change currRect.w for currRect.h
		}


	A sort algorithm for the children of each parent Node. This sort algorithm exists in our code but does not consistantly sort correctly.


What we did not implement:
	Step 13 of Remco's algorithm. We know that this would require a recursive call. We needed to implement the steps above it succesfuly before implementing, which we were unable to do.

	Zooming. We know that this would require creating a new canvas using the clicked node as the "root" node. We were unable to implement this without havinga fully working Squarify algorithm.

	An additional requirement. Our idea was to implement a gradient color scheme in the leaf nodes that would make a leaf darker/lighter based on its weight. This would allow us to code the weights to a better degree. As well, the distinction in color darkness/lightness is more immediately apparent than between the numerical weights displayed. 
