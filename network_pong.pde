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
  ballDX = 5;
  ballDY = 5;

  /* Create Player */
  player1 = new player(50);
  player2 = new player(height - 55);
  
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

void detectCollisions()
{
  if( (ballCX - ballR/2 <= 0 ) || (ballCX + ballR/2 >= width) )
    ballDX = -ballDX;
    
  if( (ballCY - ballR/2 <= 0 ) || (ballCY + ballR/2 >= height) )
    ballDY = -ballDY;
    
  /* Collision detection with players to be added here... by Wing */
}
void updateBall()
{
  ballCX += ballDX;
  ballCY += ballDY;
}
