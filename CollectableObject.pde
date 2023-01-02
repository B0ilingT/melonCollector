public class CollectableObject // super class for all types of collectable game objects with collisons
{
  int x, y;
  int size;
  PImage img1;

  CollectableObject(int x, int y, int size) 
  {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void render()
  {
  }
}
