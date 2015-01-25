class Speed extends GameObjects
{
  
  Speed()
  {
  }
  
  Speed(float x, float y)
  {
    pos.x = x;
    pos.y = y;
    
  }
  
  void display()
  {
    ellipse(pos.x,pos.y,20,20);
    line(pos.x, pos.y -1, pos.x + 6, pos.y - 1);
    line(pos.x + 6, pos.y - 1, pos.x, pos.y + 7);
    line(pos.x, pos.y + 7, pos.x, pos.y + 1);
    line(pos.x, pos.y + 1, pos.x - 6, pos.y + 1);
    line(pos.x - 6, pos.y + 1, pos.x, pos.y - 7);
    line(pos.x, pos.y - 7, pos.x, pos.y - 1);
  }
}  
    
    
