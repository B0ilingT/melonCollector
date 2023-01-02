public class BombMelon extends CollectableObject 
{
  int speedX = 0;
  int speedY = 0;
  int counter = 0;
  private PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12; // private names for the images
  boolean exploded = false;
  boolean exploding = false;
  BombMelon(int x, int y, int size)
  {
    super(x, y, size);
    img1 = loadImage("bombMelon.png"); // load image of melon 
    img1.resize(size, size);
    img2 = loadImage("Explosion.png"); // images for explosion animation
    img2.resize(size, size); 
    img3 = loadImage("Explosion2.png");
    img3.resize(size, size); 
    img4 = loadImage("Explosion3.png");
    img4.resize(size, size); 
    img5 = loadImage("Explosion4.png");
    img5.resize(size, size); 
    img6 = loadImage("Explosion5.png");
    img6.resize(size, size); 
    img7 = loadImage("Explosion6.png");
    img7.resize(size, size); 
    img8 = loadImage("Explosion7.png");
    img8.resize(size, size); 
    img9 = loadImage("Explosion8.png");
    img9.resize(size, size);
    img10 = loadImage("Explosion9.png");
    img10.resize(size, size); 
    img11 = loadImage("Explosion10.png");
    img11.resize(size, size); 
    img12 = loadImage("Explosion11.png");
    img12.resize(size, size);
  }

  void move() //tracks chicken 
  {
    if (chickenX>this.x)    // tracking for xpos of chicken
    {
      speedX = 1;
    } else if (chickenX<this.x)
    {
      speedX = -1;
    }

    if (chickenY>this.y)   // tracking for ypos of chicken
    {
      speedY = 1;
    } else if (chickenY<this.y)
    {
      speedY = -1;
    }


    this.x = this.x + this.speedX;
    this.y = this.y + this.speedY;
  }
  void render()
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
      }
    }
    return collided;
  }

  void renderExplosion() // method for rendering explosion animation
  {    
    exploding = true;
    if (counter ==0)
    {
      lives = lives - 1;
    }
    if (counter>=0 && counter<10)
    {  
      image(img2, this.x, this.y);
    } else if (counter>=10 && counter<20)
    {  
      image(img3, this.x, this.y);
    } else if (counter>=20 && counter<30)
    {  
      image(img4, this.x, this.y);
    } else if (counter>=30 && counter<40)
    {  
      image(img5, this.x, this.y);
    } else if (counter>=40 && counter<50)
    {  
      image(img6, this.x, this.y);
    } else if (counter>=50 && counter<60)
    {  
      image(img7, this.x, this.y);
    } else if (counter>=60 && counter<70)
    {  
      image(img8, this.x, this.y);
    } else if (counter>=70 && counter<80)
    {  
      image(img9, this.x, this.y);
    } else if (counter>=80 && counter<90)
    {  
      image(img10, this.x, this.y);
    } else if (counter>=90 && counter<100)
    {  
      image(img11, this.x, this.y);
    } else if (counter ==100)
    {
      image(img11, this.x, this.y);
      counter = 0; 
      exploded = true;
      exploding = false;
    }

    counter = counter + 5;
  }
}
