/* Defining some globals */
int LEFT = 1;
int RIGHT = 2;
 
 
/*Define the ball */
int ballCX;
int ballCY;
int ballR;
int ballDX;
int ballDY;
/*End definition*/
 
/* define Players */
player player1;
player player2;
 
void setup()
{
  size(500, 700);
  background(0);
  
  /* Create Ball */
  ballCX = width/2;
  ballCY = height/2;
  ballR = 10;
  ballDX = 1;
  ballDY = 1;
 
  /* Create Player */
  player1 = new player(50);
  player2 = new player(height - 55);
  
}
 
void reset()
{
  ballCX = width/2;
  ballCY = height/2;
  player1.resetplayer(50);
  player2.resetplayer(height - 55);
}


void draw()
{
  detectCollisions();
  background(0);
  stroke(255);
  fill(255);
  ellipse(ballCX, ballCY, ballR, ballR);
  updateBall();
  player1.draw();
  player2.draw();
  
}
 
void keyPressed()
{
  if(key == 'a')
    player1.move(LEFT);
  
  if(key == 'd')
    player1.move(RIGHT);
    
  if(key == 'j')
    player2.move(LEFT);
  
  if(key == 'l')
    player2.move(RIGHT);
    
  if(key == 'p')
    noLoop();
    
  if(key == ' ')
    loop();
}
 
/* collision detection for the game */
void detectCollisions()
{
  if( (ballCX - ballR/2 <= 0 ) || (ballCX + ballR/2 >= width) )
    ballDX = -ballDX;
    
  //if( (ballCY - ballR/2 <= 0 ) || (ballCY + ballR/2 >= height) )
  //  ballDY = -ballDY;
    
  /* Collision detection with players to be added here... by Wing */
  if( (ballCY - ballR/2) <= ( player1.centerY + player1.playerHeight) )
  {
    //checking leftside
    if ( (ballCX + ballR/2) < (player1.centerX + player1.playerWidth ) )
    {
      if( (ballCX - ballR/2) > (player1.centerX - player1.playerWidth ) )
        ballDY = -ballDY;
      else
       {
         player2.score();
         println( player2.points);
         reset();
       }
    }
    //checking rightside
    if ( (ballCX + ballR/2) > (player1.centerX + player1.playerWidth ) )
    {
      if( (ballCX - ballR/2) < (player1.centerX - player1.playerWidth ) )
        ballDY = -ballDY;
      else
       {
         player2.score();
         println(player2.points);
         reset();
       }
    }
  
    }
  if( (ballCY + ballR/2) >= ( player2.centerY - player2.playerHeight) )
  { //checking leftside
    if ( (ballCX + ballR/2) < (player2.centerX + player1.playerWidth ) )
    {
      if( (ballCX - ballR/2) > (player2.centerX - player1.playerWidth ) )
        ballDY = -ballDY;
      else
       {
         player1.score();
         println( " Player 1: "+ player1.points);
         reset();
       }
    }
    //checking rightside
    if ( (ballCX + ballR/2) > (player2.centerX + player1.playerWidth ) )
    {
      if( (ballCX - ballR/2) < (player2.centerX - player1.playerWidth ) )
        ballDY = -ballDY;
      else
       {
         player1.score();
         println( player1.points);
         reset();
       }
    }
  }
}
void updateBall()
{
  ballCX += ballDX;
  ballCY += ballDY;
}
