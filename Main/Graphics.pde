void draw()
{
  for(int i=0; i<newMap.length; i++)
  {
    for(int j=0; j<newMap[0].length; j++)
    { 
      Square sqr = newMap[i][j];
      rect(sqr.x, sqr.y, sqr.w, sqr.h);    
      if (sqr.state == 'O')
      {
        circle(sqr.x+sqr.w/2, sqr.y+sqr.h/2, 2*sqr.w/3);
      }
      else if (sqr.state == 'X')
      {
        line(sqr.x, sqr.y, sqr.x+sqr.w, sqr.y+sqr.h);
        line(sqr.x+sqr.w, sqr.y,sqr.x , sqr.y+sqr.h);
      }
    }
  }
  
  if(mousePressed && mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height)
  {
    
    int indexX = ceil(mouseX*n/width);
    int indexY = ceil(mouseY*n/height);
    Square clickedSquare = newMap[indexX][indexY];
   
    game.turn(clickedSquare);

    String[] ConnectedGraphString = {String.valueOf(clickedSquare.state)}; //Four disjoint graphs that you can imagine as 4 parallel lines with dots on them for each vertex that represent their position on the grid.
   //<>// //<>// //<>//
    ConnectedGraphString = ConnectionInformation(indexX, indexY, clickedSquare);
      
    print(ConnectedGraphString[3]);
    print("\n");
     

  }
}


String[] ConnectionInformation(int indexX, int indexY, Square clickedSquare)
{   
  //Four disjoint graphs that you can imagine as 4 parallel lines with dots on them for each vertex that represent their position on the grid.
  String thisSquare = String.valueOf(clickedSquare.state);
  String[] ConnectedGraphString = {thisSquare, thisSquare, thisSquare, thisSquare};     
  for (int i=1; i<numberInRowToWin; i++)
  {    
    //The ith index if the index is to the right of the edge, otherwise return 0
    int a = i*int(indexX+i<n);
    //Same but left edge
    int b = i*int(indexX-i>=0);
    //Same but top of the board
    int c = i*int(indexY+i<n);
    //Same but for the bottom of the board
    int d = i*int(indexY-i>=0); 
    
    
    if (i!=0)
    {
     ConnectedGraphString[0] = ((b != 0) ? newMap[indexX-b][indexY].state : '_') 
    + ConnectedGraphString[0] 
    + ((a != 0) ? newMap[indexX+a][indexY].state : '_');
    
     ConnectedGraphString[1] = ((d != 0) ? newMap[indexX][indexY-d].state : '_') 
    + ConnectedGraphString[1] 
    + ((c != 0) ? newMap[indexX][indexY+c].state : '_');
    
     ConnectedGraphString[2] = ((b != 0 && c != 0) ? newMap[indexX-b][indexY+c].state : '_') 
    + ConnectedGraphString[2] 
    + ((a != 0 && d != 0) ? newMap[indexX+a][indexY-d].state : '_');
    
      ConnectedGraphString[3] = ((b != 0 && d != 0) ? newMap[indexX-b][indexY-d].state : '_') 
    + ConnectedGraphString[3] 
    + ((a != 0 && c !=0) ? newMap[indexX+a][indexY+c].state : '_');   
    
    
    
    }  
    
    
} 
   
    return ConnectedGraphString;
}


/*String oneGraph(int indexX, int indexY, String input)
{
  String ConnectedGraphString = input;
     ConnectedGraphString = ((d != 0 && int(i) !=0) ? newMap[indexX][indexY-d].state : '_') 
    + ConnectedGraphString
    + ((c != 0 && int(i) !=0) ? newMap[indexX][indexY+c].state : '_');  
  
}*/
