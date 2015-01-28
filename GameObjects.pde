class GameObjects
{
  PVector pos;
  PVector vertical;
  PVector horizontal;
  boolean alive;
  float theta2;
  int powerUPid;
  
  GameObjects()
  {
    alive = true;
    pos = new PVector(random(100,700), random(100,500));
    vertical = new PVector(0,1);
    horizontal = new PVector(1,0);
  }
  
  void move()
  {
  }

  void display()
  {
  }
}
