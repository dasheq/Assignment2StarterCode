class Ufo extends GameObjects
{
  PVector cPos;
  int health;
  
  Ufo()
  {
     cPos = new PVector(width/2,width/2);
     health = 100;
  }
  
  
  Ufo(float x, float y)
  {
    pos.x = x;
    pos.y = y;
    health = 100;
   // position.x = x;  
   // position.y = y;
  }
  
  void hit(int id)
  {
    ufohit.play();
    ufohit.rewind();
    health -= 10;
    if(health < 1)
    {
      alive = false;
      enemies.remove(id);
    }
  }
  
  void display()
  {
    
  float segments = 12;
  float thetaInc = TWO_PI/segments;
  float theta = 0;
  float radius = 10;
    fill(0);
    stroke(150,0,150);
    ellipse(pos.x,pos.y, 50,30);
    ellipse(pos.x,pos.y, 40,25);
      
    while (theta < TWO_PI)
    {
      cPos.x = pos.x + sin(theta) * radius;
      cPos.y = pos.y + cos(theta) * radius;
      ellipse(cPos.x, cPos.y, 5, 5);
      theta += thetaInc;
    }
    fill(255,0,0);
    rectMode(CENTER);
    rect(pos.x, pos.y-25, health/2,5);
  
  }
 
}
