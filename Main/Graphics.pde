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
    circle(clickedSquare.x, clickedSquare.y, 10);
    for (int i=1; i<numberInRowToWin; i++) //<>//
    { //<>//
      int a = i*int(indexX+i<n);
      int b = i*int(indexX-i>=0);
      int c = i*int(indexY+i<n);
      int d = i*int(indexY-i>=0); //<>// //<>//
      circle(newMap[indexX+a][indexY].x,newMap[indexX+a][indexY].y, 10);
      circle(newMap[indexX-b][indexY].x,newMap[indexX-b][indexY].y, 10);
      circle(newMap[indexX][indexY+c].x,newMap[indexX][indexY+c].y, 10);
      circle(newMap[indexX][indexY-d].x,newMap[indexX][indexY-d].y, 10);
      circle(newMap[indexX+a][indexY-d].x,newMap[indexX+a][indexY-d].y, 10);      
      circle(newMap[indexX+a][indexY+c].x,newMap[indexX+a][indexY+c].y, 10);    
      circle(newMap[indexX-b][indexY-d].x,newMap[indexX-b][indexY-d].y, 10);    
      circle(newMap[indexX-b][indexY+c].x,newMap[indexX-b][indexY+c].y, 10);    
      
      /*if (indexX-i>=0)
      {
        circle(newMap[indexX-i][indexY].x,newMap[indexX-i][indexY].y, 10);
      }
      if (indexY+i<n)
      {
        circle(newMap[indexX][indexY+i].x,newMap[indexX][indexY+i].y, 10);
      }  
      if (indexY-i>=0)
      {
        circle(newMap[indexX][indexY-i].x,newMap[indexX][indexY-i].y, 10);
      } */       
      
      
      
      
      
      
    }
  }
}
