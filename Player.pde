public class Player
{
  int x, y; //members
  private PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12;  //image class  
  int counter = 0;
  int size;

  Player ()
  {
    this.x = 0;
    this.y = 0;
    this.size = 50;
    loadImages();
  }

  Player(int x, int y, int size) 
  {
    this.x = x;    
    this.y = y;
    this.size = size;
    loadImages();
  }


  void renderRight() //render animation for chicken running right
  {
    //change image every 10 calls

    if (counter>=0 && counter<10)
    {  
      image(img1, this.x, this.y);
    } else if (counter>=10 && counter<20)
    {  
      image(img2, this.x, this.y);
    } else if (counter>=20 && counter<30)
    {  
      image(img3, this.x, this.y);
    } else if (counter ==30)
    {
      image(img3, this.x, this.y);
      counter=0; // reset to go through sequence again
    }
    counter++;
  }

  void renderLeft() //render animation for chicken running left
  {
    //change image every 10 calls

    if (counter>=0 && counter<10)
    {  
      image(img4, this.x, this.y);
    } else if (counter>=10 && counter<20)
    {  
      image(img5, this.x, this.y);
    } else if (counter>=20 && counter<30)
    {  
      image(img6, this.x, this.y);
    } else if (counter ==30)
    {
      image(img6, this.x, this.y);
      counter=0; // reset to go through sequence again
    }
    counter++;
  }

  void renderDown() //render animation for chicken running down
  {
    //change image every 10 calls

    if (counter>=0 && counter<10)
    {  
      image(img7, this.x, this.y);
    } else if (counter>=10 && counter<20)
    {  
      image(img8, this.x, this.y);
    } else if (counter>=20 && counter<30)
    {  
      image(img9, this.x, this.y);
    } else if (counter ==30)
    {
      image(img9, this.x, this.y);
      counter=0; // reset to go through sequence again
    }
    counter++;
  }

  void renderUp() //render animation for chicken running up
  {
    //change image every 10 calls

    if (counter>=0 && counter<10)
    {  
      image(img10, this.x, this.y);
    } else if (counter>=10 && counter<20)
    {  
      image(img11, this.x, this.y);
    } else if (counter>=20 && counter<30)
    {  
      image(img12, this.x, this.y);
    } else if (counter ==30)
    {
      image(img12, this.x, this.y);
      counter=0; // reset to go through sequence again
    }
    counter++;
  }

  void keyPress() // check for arrow keys and move 10px 
  {
    if (key==CODED)
    {
      if (keyCode == LEFT && this.x>=0)// if left arrow pressed and chicken.x isnt against the left wall then move it right by 10 pixels
      {
        this.x = this.x - 10;
      }
      if (keyCode == RIGHT && this.x+this.size<=(width)) 
      {
        this.x = this.x + 10;
      }
      if (keyCode == UP && this.y>=0)
      {
        this.y = this.y - 10;
      }
      if (keyCode == DOWN && this.y+this.size<=(height))
      {
        this.y = this.y + 10;
      }
    }
  }

  int detectCollision() //check for collisions with melons on screen
  {
    int melonNumber = -1;
    for (int i=0; i<melons.size(); i++)
    {  
      Melon myTemporaryMelon = melons.get(i); // fetch melon x,y from array list
      if ((this.x >= (myTemporaryMelon.x - 50)) && (this.x <= (myTemporaryMelon.x + 50))) // check chicken pos is within 50px of the centre of the x melon
      {
        if ((this.y >= (myTemporaryMelon.y - 50)) && (this.y <= (myTemporaryMelon.y + 50))) // check chicken pos is within 50px of the centre of the y melon
        {
          melonNumber = i; 
          break;
        }
      }
    }
    return melonNumber; // pass melon number to main code
  }

  private void loadImages() // create and load images
  {
    img1 = loadImage("chicken1.png");
    img1.resize(size, size); 
    img2 = loadImage("chicken2.png");
    img2.resize(size, size); 
    img3 = loadImage("chicken3.png");
    img3.resize(size, size); 
    img4 = loadImage("chickenL1.png");
    img4.resize(size, size); 
    img5 = loadImage("chickenL2.png");
    img5.resize(size, size); 
    img6 = loadImage("chickenL3.png");
    img6.resize(size, size); 
    img7 = loadImage("chickenD1.png");
    img7.resize(size, size); 
    img8 = loadImage("chickenD2.png");
    img8.resize(size, size); 
    img9 = loadImage("chickenD3.png");
    img9.resize(size, size);
    img10 = loadImage("chickenU1.png");
    img10.resize(size, size); 
    img11 = loadImage("chickenU2.png");
    img11.resize(size, size); 
    img12 = loadImage("chickenU3.png");
    img12.resize(size, size);
  }
}
