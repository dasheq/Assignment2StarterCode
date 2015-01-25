class Player
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  color colour;
    
  Player()
  {
    pos = new PVector(width / 2, height / 2);
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void update()
  {
    if (checkKey(up))
    {
      pos.y -= 2;
    }
    if (checkKey(down))
    {
      pos.y += 2;
    }
    if (checkKey(left))
    {
      pos.x -= 2;
    }    
    if (checkKey(right))
    {
      pos.x += 2;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))
    {
      println("Player " + index + " button 2");
    }    
  }
  
  void display()
  {    
    stroke(colour);
    fill(colour); 
    line(pos.x+2, pos.y-11, pos.x, pos.y-14);
    line(pos.x-2, pos.y-11, pos.x, pos.y-14);
    line(pos.x, pos.y-9, pos.x+2, pos.y-11);
    line(pos.x, pos.y-9, pos.x-2, pos.y-11);
    line(pos.x, pos.y-18, pos.x+2, pos.y-16);
    line(pos.x+2, pos.y-16, pos.x+4, pos.y-17);
    line(pos.x+4, pos.y-17, pos.x+6, pos.y-11);
    line(pos.x+3, pos.y-15, pos.x+6, pos.y-11);
    line(pos.x+6, pos.y-11, pos.x+5, pos.y-9);
    line(pos.x+5, pos.y-9, pos.x+7, pos.y-7);
    line(pos.x+7, pos.y-7, pos.x+5, pos.y-4);
    line(pos.x+5, pos.y-4, pos.x+5, pos.y);   
    line(pos.x, pos.y-18, pos.x-2, pos.y-16);
    line(pos.x-2, pos.y-16, pos.x-4, pos.y-17);
    line(pos.x-4, pos.y-17, pos.x-6, pos.y-11);
    line(pos.x-3, pos.y-15, pos.x-6, pos.y-11);
    line(pos.x-6, pos.y-11, pos.x-5, pos.y-9);
    line(pos.x-5, pos.y-9, pos.x-7, pos.y-7);
    line(pos.x-7, pos.y-7, pos.x-5, pos.y-4);
    line(pos.x-5, pos.y-4, pos.x-5, pos.y);
    line(pos.x-5, pos.y, pos.x-10, pos.y-2 );
    line(pos.x-10, pos.y-2, pos.x-12,pos.y-7);
    line(pos.x-12, pos.y-7, pos.x-14, pos.y-1);
    line(pos.x-14, pos.y-1, pos.x-13, pos.y+4);
    line(pos.x-14, pos.y+4, pos.x-13,pos.y+7);
    line(pos.x-13, pos.y+7, pos.x-4, pos.y+6);
    line(pos.x-4, pos.y+6, pos.x, pos.y+7);
    line(pos.x+5, pos.y, pos.x+10, pos.y-2 );
    line(pos.x+10, pos.y-2, pos.x+12,pos.y-7);
    line(pos.x+12, pos.y-7, pos.x+14, pos.y-1);
    line(pos.x+14, pos.y-1, pos.x+13, pos.y+4);
    line(pos.x+14, pos.y+4, pos.x+13,pos.y+7);
    line(pos.x+13, pos.y+7, pos.x+4, pos.y+6);
    line(pos.x+4, pos.y+6, pos.x, pos.y+7);
    
  }  
}
