public class Chicken extends Player // this class uses Player as its super class
{

  Chicken() // parameters added
  {
    super(((width/2)-25), ((height/2)-25), 50);   // x, y, size of chicken
  }

  void Animate() //checks for keypress then changes animation accordingly
  {
    switch(keyCode)
    {
    case LEFT:
      chicken.renderLeft();
      break;
    case RIGHT:
      chicken.renderRight();
      break;
    case UP:
      chicken.renderUp();
      break;
    case DOWN:
      chicken.renderDown();
      break;
    default:
      chicken.renderRight();
      break;
    }
  }
}
