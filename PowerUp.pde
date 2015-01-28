class PowerUp extends GameObjects
{
  
  PowerUp()
  {
    powerUPid = (int)random(1,4);
  }
  

  void display()
  {
    
    if(powerUPid == 1)
    {
      stroke(255,0,0);
      fill(0);
      ellipse(pos.x,pos.y,20,20);
      textSize(10);
      fill(0,255,0);
      text("2X", pos.x,pos.y+4);
    }
   
    if(powerUPid == 2)
    { 
      stroke(255,0,0);
      fill(0);
      ellipse(pos.x,pos.y,20,20);
      stroke(0,255,0);
      line(pos.x, pos.y -1, pos.x + 6, pos.y - 1);
      line(pos.x + 6, pos.y - 1, pos.x, pos.y + 7);
      line(pos.x, pos.y + 7, pos.x, pos.y + 1);
      line(pos.x, pos.y + 1, pos.x - 6, pos.y + 1);
      line(pos.x - 6, pos.y + 1, pos.x, pos.y - 7);
      line(pos.x, pos.y - 7, pos.x, pos.y - 1);
    }
    
    if(powerUPid == 3)
    {
      stroke(255,0,0);
      fill(0);
      ellipse(pos.x,pos.y,20,20);
      stroke(0,255,0);
      
      //Horizontal Part
      line(pos.x-8, pos.y+2, pos.x-2, pos.y+2);
      line(pos.x-8, pos.y-2, pos.x-2, pos.y-2);
      line(pos.x+8, pos.y+2, pos.x+2, pos.y+2);
      line(pos.x+8, pos.y-2, pos.x+2, pos.y-2);
      line(pos.x-8, pos.y-2, pos.x-8, pos.y+2);
      line(pos.x+8, pos.y+2, pos.x+8, pos.y-2);
      
      //Vertical Part
      line(pos.x-2, pos.y+8, pos.x+2, pos.y+8);
      line(pos.x-2, pos.y-8, pos.x+2, pos.y-8);
      line(pos.x-2, pos.y-8, pos.x-2, pos.y-2);
      line(pos.x+2, pos.y-8, pos.x+2, pos.y-2);
      line(pos.x-2, pos.y+8, pos.x-2, pos.y+2);
      line(pos.x+2, pos.y+8, pos.x+2, pos.y+2);
      
    }
  }
}  
    
    
