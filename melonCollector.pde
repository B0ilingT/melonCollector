// global variables
Chicken chicken;
ArrayList<Melon> melons;
final int melonNumber = 31;
int chickenX, chickenY;
PImage menuScreen, gameOverScreen, gameWonScreen, backGround, foreGround, menuBox; // names of images used in game
int Score = 0;
BombMelon bombMelon;
int lives = 3;
int gameLength = 3600; // 60 x how ever many seconds you want
GoldenMelon goldenMelon;
GameMode mode = GameMode.SPLASHSCREEN;
int timeRemaining = gameLength;
int topScore = 0;

void setup()
{
  size(1000, 600);
  surface.setTitle("Melon Collector"); // sets window title to Melon Collector instead of melonCollector
  createGame(); // set up game Objects
}

void draw() //repeat 60 times a second
{
  gameModes();
}


void createGame() //setup game Objects and classes
{
  chicken = new Chicken();
  bombMelon = new BombMelon(int(random(width-50)), int(random(height-50)), 50); //create a new bombmelon with random x , y
  goldenMelon = new GoldenMelon(int(random(width-50)), int(random(height-50)), 50); // create a new golden melon with random x, y
  melons = new ArrayList<Melon>(melonNumber); // make arraylist to store random melon placement
  menuScreen = loadImage("melonMenu.png");
  gameOverScreen = loadImage("gameOver.png");
  gameWonScreen = loadImage("gameWon.png");
  backGround = loadImage("chickenBackGround.png");
  foreGround = loadImage("chickenForeGround.png");
  menuBox = loadImage("menuBox.png");
  for (int i=0; i<melonNumber; i++) // for loop generates the amount of melons specified in melonsNumber with random x,y coords
  {
    Melon myTemporaryMelon = new Melon(int(random(width-50)), int(random(height-50)), 50); // create 1 random melon
    melons.add(myTemporaryMelon); // store in list
  }
}

void renderMelons() // function to draw melons when called in void draw()
{
  for (int i=0; i<melons.size(); i++)
  {
    Melon myTemporaryMelon = melons.get(i); // fetch melon x,y from array list
    myTemporaryMelon.render(); // call render in Melon class
  }
}

void drawMenu() // draw menu elements such as boxes and text
{
  image(menuBox, -1, 9);
  image(menuBox, -1, 39);
  image(menuBox, -1, 69);
  image(menuBox, -1, 99);
  fill(0, 102, 153);      
  text("Score:", 15, 25); // score text
  text(Score, 55, 25);    // shows value of score next to Score:
  text("Time Left:", 15, 55); // time text
  text((timeRemaining/gameLength), 72, 55); //display seconds remaining top left 
  text("Lives Left:", 15, 85); // lives text
  text(lives, 75, 85); // shows value of lives
  text("Top Score:", 15, 115); // top score text
  text(topScore, 75, 115); // shows value of top score
}

void keyPressed() // runs on keypressed
{
  chicken.keyPress();
  int melonCollision;
  melonCollision = chicken.detectCollision();
  if ( melonCollision >= 0 ) // if there is a collision between a melon and the player remove that melon then add 1 to the score
  {
    melons.remove(melonCollision);
    Score += 1;
  }  
  if (key==ENTER) 
  {
    if ((mode==GameMode.GAMEOVER) || (mode==GameMode.SPLASHSCREEN) || (mode==GameMode.GAMEWON)) // if ENTER is pressed during the GAMEOVER screen, GAMEWON or SPLASHSCREEN screen then restart game, score, lives and timer
    {
      timeRemaining = gameLength*60;
      lives = 3;
      mode = GameMode.PLAYINGGAME;
      createGame();
      if (Score>topScore) // if the score is greater than the top score then make the top score the current score
      {
        topScore = Score;
      }
      Score = 0;
    }
  }
}

void specialMelons() //contains melon collision detection logic for golden and bomb melons
{
  if ((goldenMelon.checkCollision() == false)&&(goldenMelon.hit == false)) //if the golden melon is not colliding or hasnt collided render and move the golden melon
  {
    goldenMelon.render();
    goldenMelon.randomGoldenMelonMove();
  } else 
  {
    goldenMelon.colliding();
  }


  if ((bombMelon.checkCollision() == false) && (bombMelon.exploded == false) && (bombMelon.exploding == false)) //if the bomb melon is not collided and hasn't exploded render the melon , if it has exploded and collided render the explosion and update bombMelon.exploded to true
  {       
    bombMelon.render();
    bombMelon.move();
  } else 
  {           
    if (bombMelon.exploded == false)
    {                               
      bombMelon.renderExplosion();
    } else if (bombMelon.exploding == false)
    {                  
      bombMelon.exploded = true;
      bombMelon = new BombMelon(int(random(width-50)), int(random(height-50)), 50); // spawn a new bomb melon after removing the last one
    }
  }
}

void gameModes() // method for running gamemodes and their specific code
{
  if (timeRemaining>=0)
  {
    timeRemaining = timeRemaining - 60;
  }

  switch(mode)
  {

  case SPLASHSCREEN: // if the gamemode is SPLASHSCREEN then draw splash screen

    image(menuScreen, 0, 0);
    break;


  case GAMEOVER: // if the gamemode is GAMEOVER then draw game

    image(gameOverScreen, 0, 0);
    break; 

  case PLAYINGGAME: // if the gamemode is PLAYINGGAME then draw game

    image(backGround, 0, 0);
    renderMelons();
    chicken.Animate(); 
    specialMelons();
    drawMenu();
    if ((timeRemaining == 0) || (lives == 0))
    {
      mode = GameMode.GAMEOVER;
    }
    if (Score == melonNumber + 10)
    {
      mode = GameMode.GAMEWON;
    }
    image(foreGround, 0, 0);     
    chickenX = chicken.x;
    chickenY = chicken.y;
    break;

  case GAMEWON: // if gamemode is GAMEWON then draw gamewon screen
    image(gameWonScreen, 0, 0);
    break;
  }
}
