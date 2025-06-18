Obstacle[] obstacles; //Creates an array where the obstacles will be stored
int screenNumber;
int playerX= 0; //Player's starting X coordinate
int playerY= 0; //Player's starting Y coordinate
int heal =600; //Player's health
PImage bg; //Background image
PImage player; 
int score = 0;

void setup()
{
  size(845,845); //Creates 845 x 1005 game window
  rectMode(CENTER); //Makes drawing rectangle relative to thier center
  screenNumber = 0; //Shows the title screen
  bg = loadImage ("spaceBG.jpeg"); //Assigns the background image
  player = loadImage("rocket.png");
  obstacles = new Obstacle[11]; //Creating a new obstacles array of 11 values
  for(int i=0; i<11; i++) //For loop to create 11 obstacle values with randomized x, y, and size
  {
    obstacles[i] = new Obstacle();
    obstacles[i].x = random(0, width);
    obstacles[i].size = (int)random(10,50);
    obstacles[i].y = random(-height, -height / 4);
    obstacles[i].speed = 0.005;
    obstacles[i].show();
    obstacles[i].move();
  }
}
void draw ()
{
  background(0); //Fills the screen with one color
  if (screenNumber==0) //Title screen
  {
    background(255,255,255);
    fill(22,3,252);
    textSize(20);
    text("Final Computer Science Project",150,100);
    text("Asteroid Game!",150,130);
    text("Made by Katie Shpatrova",150,160);
    textSize(15);
    fill(216,122,122);
    text("Instructions:",100,266);
    text("1. Use the ARROW keys to move the rocket",100,285);
    text("2. Avoid the flying asteroids coming your way!",100,300);
    text("3. If you hit an asteroid, you will lose 10 health",100,315);
    text("4. Once you reach 0 health, the game is over",100,330);
    text("5. You score points based on thier size (the larger = more points)",100,345);
    text("Have fun!",100,360);
    
    text("Click to Start",360,400);
    checkToStartGame();
    
  }
  else if (screenNumber==1) //The game screen
  {
    
    background(bg);
    showPlayer();
    move();
    //life();
    for(int i=0; i<11; i++)
    {
      obstacles[i].show(); //Makes the current obstacles visible
      obstacles[i].move(); //Makes the current obstacles
      obstacles[i].checkHit(); //Checks if the current obstacles hit the rocket
    }
    textSize(24);
    fill(251);
    text( "Score: " + score, 36, 20);
    text("Health bar: " + heal, 36, 45);
  }
  else if (screenNumber==2) //Game over screen
  {
    textSize(20);
    text("GAME OVER",150,150);
    text("You scored: " + score, 150, 170);
  }
}
/*for(int i=0; i<4; i++)
 {
 g[i].show();
 g[i].energy();
 }*/
void checkToStartGame()
{
  if(mousePressed){
    screenNumber=1;
    playerX = width /2;
    playerY = height / 2;
  }
}

void showPlayer()
{
  fill(255);
  image(player, playerX, playerY, 40, 60);
} 

boolean rightPressed;
boolean leftPressed;
boolean upPressed;
void keyPressed() //function to detect if a key was pressed
{
  if(keyCode == RIGHT ) rightPressed = true;
  if(keyCode == LEFT)leftPressed = true;
  if(keyCode == UP) upPressed = true;
}

void keyReleased() //function to detect if a key was released
{
  if(keyCode == RIGHT ) rightPressed= false;
  if (keyCode == LEFT)leftPressed=false;
  if(keyCode == UP) upPressed =false;
}

void move()
{
  playerY+=1;
  if (rightPressed) playerX+=4;
  if (leftPressed) playerX-=4;
  if (upPressed) playerY-=4;
}
