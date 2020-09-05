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
   //<>// //<>// //<>//
    String[] ConnectedGraphString = ConnectionInformation(indexX, indexY, clickedSquare);
      
    //For debugging connections
    //print(ConnectedGraphString[3]);
    //print("\n");
  }
}
