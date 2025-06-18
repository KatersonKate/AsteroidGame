class Obstacle
{
  float x,y;
  int size;
  float speed;
  
  void show()
  {
    fill(174);
    ellipse(x,y,size,size);
    
  }
  
  void checkHit()
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
  void checkIfOnScreen()
    {
    if(y > height)
    {
      respawn();
    }
  }
  
  void respawn()
  {
    score += size;
    x=random(0, width);
    size = (int)random(10, 50);
    y = random(-height / 4, size);
  }

  void move()
  {
    y += (size + height/2)*speed;
    checkIfOnScreen();
  }
}
