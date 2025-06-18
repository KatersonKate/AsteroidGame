class Obstacle
{
  float x,y; // asteroid coordinates
  int size; //asteroid size
  float speed; //asteriod speed
  
  void show() //creates the asteroids
  {
    fill(174);
    ellipse(x,y,size,size);
    
  }
  
  void checkHit() //checks if asteriods hit the rocket
  {
    if(dist(playerX,playerY,x,y)< size)
    {
      background(250,0,0);
      println(heal);
      heal=heal-10;
      respawn();
    }
    if(heal<0)
    {
      screenNumber=2;
    }
  }
  void checkIfOnScreen() //checks if the asteroids are on game screen
    {
    if(y > height)
    {
      respawn();
    }
  }
  
  void respawn() //respawns the asteroids
  {
    score += size;
    x=random(0, width);
    size = (int)random(10, 50);
    y = random(-height / 4, size);
  }

  void move() //moves the asteroids
  {
    y += (size + height/2)*speed;
    checkIfOnScreen(); //checks if they are on the screen after they moved
  }
}
