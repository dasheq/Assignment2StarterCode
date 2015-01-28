class Planets extends GameObjects
{
   Planets()
  {  
      pos.x = (int)random(1,8) * 100;
      pos.y = (int)random(1,5) * 100;
      
  }
  
  void move()
  {
    pos.x = pos.x + random(0,1);
    if(pos.x > (width-25))
    {
      pos.x = 25;
      pos.y = (int)random(1,5) * 100;
    }
  }
  
  void display()
  {
     stroke(255,125,0);
    fill(0);
    ellipse(pos.x, pos.y, 50,50);
    ellipse(pos.x, pos.y, 90,20);
    ellipse(pos.x, pos.y, 50,50);
    ellipse(pos.x, pos.y, 80,10);
  }
}
