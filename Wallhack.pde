class Wallhack extends GameObjects
{
  
  Wallhack()
  {
  }
  
  Wallhack(float x, float y)
  {
    pos.x = x;
    pos.y = y;
    
  }
  
  void display()
  {
    ellipse(pos.x,pos.y,20,20);
    ellipse(pos.x-8, pos.y-5, 1,1);
    ellipse(pos.x-5, pos.y-5, 1,1);
    ellipse(pos.x-2, pos.y-5, 1,1);
    ellipse(pos.x+1, pos.y-5, 1,1);
    ellipse(pos.x+4, pos.y-5, 1,1);
    ellipse(pos.x+7, pos.y-5, 1,1);
    ellipse(pos.x-8, pos.y+5, 1,1);
    ellipse(pos.x-5, pos.y+5, 1,1);
    ellipse(pos.x-2, pos.y+5, 1,1);
    ellipse(pos.x+1, pos.y+5, 1,1);
    ellipse(pos.x+4, pos.y+5, 1,1);
    ellipse(pos.x+7, pos.y+5, 1,1);
    
    
  }
}  
