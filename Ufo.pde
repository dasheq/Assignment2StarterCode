class Ufo
{
  PVector position;
  PVector cPos;
  Ufo()
  {
    position = new PVector(width/2,width/2);
    cPos = new PVector(0,0);
  }
  
  
  Ufo(float x, float y)
  {
    position.x = x;
    position.y = y;
  }
  
  
  void display()
  {
    
  float segments = 12;
  float thetaInc = TWO_PI/segments;
  float theta = 0;
  float radius = 10;
  
    ellipse(position.x,position.y, 50,30);
    ellipse(position.x,position.y, 40,25);
    ellipse(position.x,position.y, 3,3);
    
    while (theta < TWO_PI)
    {
      cPos.x = position.x + sin(theta) * radius;
      cPos.y = position.y + cos(theta) * radius;
      ellipse(cPos.x, cPos.y, 5, 5);
      theta += thetaInc;
    }
  }
}
