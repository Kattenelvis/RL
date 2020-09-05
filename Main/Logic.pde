class Square
{
  int x;
  int y;
  int w;
  int h;
  private char state; //Can either be _, O or X
  
  public Square(int x,int y,int w,int h)
  {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.state = '_';
  }
  
  public Square()
  {}
  
  public void changeState(char state)
  {
    this.state = state;
  }
}

public Square[][] map(int n)
{
  Square[][] output = new Square[n][n];
  for(int i=0; i<n; i++)
  {
    for(int j=0; j<n; j++)
    { 
      //Math behind this https://www.desmos.com/calculator/totlzuhljr
      output[i][j] = new Square(i*width/n,j*height/n,width/n,height/n);
    }
  }
  return output;
}

public class Game
{
  Square[][] map;
  int playerTurn;
  int players;
  char[] playerSymbols;
  
   Game(Square[][] map, int startingPlayer, int players, char[] playerSymbols)
{
    this.map = map;
    this.playerTurn = startingPlayer;
    this.players = players;
    this.playerSymbols = playerSymbols;
  }
  
  public void turn(Square clicked)
  {
    if (clicked.state == '_')
    {
      clicked.changeState(playerSymbols[this.playerTurn]);
      this.playerTurn = (this.playerTurn+1) % this.players;
    }
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
    
    //This is ugly I should fix this
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
