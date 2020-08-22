int width = 600;
int height = 600;

void setup()
{
  size(600,600);

}

int n = 9;

Square[][] newMap = map(n);
char[] playerSymbols = {'X', 'O'};
int numberInRowToWin = 2;
Game game = new Game(newMap, 0, playerSymbols.length, playerSymbols);
