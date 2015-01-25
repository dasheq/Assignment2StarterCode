class Ufo extends GameObjects
{
  PVector cPos;
  int health;
  
  Ufo()
  {
     cPos = new PVector(width/2,width/2);
  }
  
  
  Ufo(float x, float y)
  {
    pos.x = x;
    pos.y = y;
   // position.x = x;  
   // position.y = y;
  }
  
  
  void display()
  {
    
  float segments = 12;
  float thetaInc = TWO_PI/segments;
  float theta = 0;
  float radius = 10;
    fill(0);
    stroke(textColor1,textColor2,textColor3);
    ellipse(pos.x,pos.y, 50,30);
    ellipse(pos.x,pos.y, 40,25);
    ellipse(pos.x,pos.y, 3,3);
    
    while (theta < TWO_PI)
    {
      cPos.x = pos.x + sin(theta) * radius;
      cPos.y = pos.y + cos(theta) * radius;
      ellipse(cPos.x, cPos.y, 5, 5);
      theta += thetaInc;
    }
  }
 
}
