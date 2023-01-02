public class Melon extends CollectableObject
{
  Melon(int x, int y, int size)
  {
    super(x, y, size);
    img1 = loadImage("melon.png"); // load image of melon 
    img1.resize(size, size);
  }

  @Override
    void render()
  {
    image(img1, this.x, this.y);
  }
}
