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
    //newMap[indexX][indexY].changeState('X');
    int xDisplace = clickedSquare.w/2;
    int yDisplace = clickedSquare.h/2;
    circle(clickedSquare.x+xDisplace, clickedSquare.y+yDisplace, 10);
    String[] ConnectedGraphString = {String.valueOf(clickedSquare.state)}; //Four disjoint graphs that you can imagine as 4 parallel lines with dots on them for each vertex that represent their position on the grid.
    for (int i=1; i<numberInRowToWin; i++) //<>//
    {     //<>//
      int a = i*int(indexX+i<n);
      int b = i*int(indexX-i>=0);
      int c = i*int(indexY+i<n);
      int d = i*int(indexY-i>=0);  //<>//
      circle(newMap[indexX+a][indexY].x+xDisplace,newMap[indexX+a][indexY].y+yDisplace, 10);
      circle(newMap[indexX-b][indexY].x+xDisplace,newMap[indexX-b][indexY].y+yDisplace, 10);
      circle(newMap[indexX][indexY+c].x+xDisplace,newMap[indexX][indexY+c].y+yDisplace, 10);
      circle(newMap[indexX][indexY-d].x+xDisplace,newMap[indexX][indexY-d].y+yDisplace, 10);
      circle(newMap[indexX+a][indexY-d].x+xDisplace,newMap[indexX+a][indexY-d].y+yDisplace, 10);      
      circle(newMap[indexX+a][indexY+c].x+xDisplace,newMap[indexX+a][indexY+c].y+yDisplace, 10);    
      circle(newMap[indexX-b][indexY-d].x+xDisplace,newMap[indexX-b][indexY-d].y+yDisplace, 10);    
      circle(newMap[indexX-b][indexY+c].x+xDisplace,newMap[indexX-b][indexY+c].y+yDisplace, 10);    
            
      ConnectedGraphString[0] = newMap[indexX-b][indexY].state + ConnectedGraphString[0] + newMap[indexX+a][indexY].state;
      
      print(ConnectedGraphString[0]);
           print("\n");
     }
     print("\n");
  }
}
