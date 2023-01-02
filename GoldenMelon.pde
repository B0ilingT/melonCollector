public class GoldenMelon extends CollectableObject
{
  int speedX = 3;
  int speedY = 3;
  private PImage img1;
  boolean hit = false;
  private int counter = 0;

  GoldenMelon(int x, int y, int size)
  {
    super(x, y, size);
    img1 = loadImage("goldenMelon.png");
    img1.resize(size, size);
  }

  void randomGoldenMelonMove() // method for golden melon bouncing around the screen
  {
    this.x = this.x + speedX;
    this.y = this.y + speedY; // move ball down screen (y+2 each time)
    if (this.y >= height - size || this.y <= 0) // if ball hits bottom or top then reverse its direction
    {
      speedY = -speedY;
    }
    if (this.x >= width - size || this.x <=0) // if ball hits either side then reverse its direction
    {
      speedX = -speedX;
    }
  }

  void render() // renders image
  {
    image(img1, this.x, this.y);
  }

  boolean checkCollision()
  {
    boolean collided = false;

    if ((this.x >= (chickenX - 50)) && (this.x <= (chickenX + 50))) // check chicken pos is within 50px of the centre of the x bombMelon
    {
      if ((this.y >= (chickenY - 50)) && (this.y <= (chickenY + 50))) // check chicken pos is within 50px of the centre of the y bombMelon
      {
        collided = true;
        hit = true;
      }
    }
    return collided;
  }

  void colliding() //method to fix score being added infinitely
  {
    if (counter ==0)
    {
      Score = Score + 10;
    }
    counter ++;
  }
}
