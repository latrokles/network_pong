

public class player
{
  int centerX;
  int centerY;
  int playerWidth;
  int playerHeight;
  Color playerColor;
  int playerDX;
  int points;
  
  public player(int pHeight)
  {
    centerX = width/2;
    centerY = pHeight;
    playerWidth = 50;
    playerHeight = 10;
    playerDX = 5;
    points = 0;
  }
  
  public void resetplayer(int pHeight)
  {
    centerX = width/2;
    centerY = pHeight;
  }
  
  public void move(int direction)
  {
    if((direction == LEFT) && (centerX - playerWidth > 0))
        centerX -= playerDX;
            
    if((direction == RIGHT) && (centerX < width))
       centerX += playerDX;


  }
  
  public void score()
  {
    points++;
  }
  
  public void draw()
  {
    fill(0, 255, 0);
    rect(centerX - playerWidth, centerY - playerHeight/2, playerWidth, playerHeight);
  }
}
 
