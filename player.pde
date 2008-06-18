
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
  
  public void move(int direction)
  {
    if((direction == LEFT) && (centerX - playerWidth > 0))
      centerX -= playerDX;
      
    if((direction == RIGHT) && (centerX - playerWidth < width))
      centerX += playerDX;
  }
  
  public void score()
  {
    points++;
  }
  
  public void draw()
  {
    fill(0, 255, 0);
    rect(centerX - playerWidth/2, centerY - playerHeight/2, playerWidth, playerHeight);
  }
}
