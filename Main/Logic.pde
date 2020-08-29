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
