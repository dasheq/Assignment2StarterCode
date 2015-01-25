class Player extends GameObjects
{
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  color colour;
  int score = 0;
    
  Player()
  {
    theta2 = 0;
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
  
  void move()
  {
    
    vertical.x = sin(theta2);
    vertical.y = -cos(theta2);
    if (checkKey(up))
    {
      pos.add(vertical);
    }
    if (checkKey(down))
    {
      pos.sub(vertical);
    }
    if (checkKey(left))
    {
      theta2 -= 0.1f;
    }    
    if (checkKey(right))
    {
      theta2 += 0.1f;
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
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta2);
    
    stroke(colour);
    fill(colour); 
    line(2, -11, 0, -14);
    line(-2, -11, 0, -14);
    line(0, -9, 2, -11);
    line(0, -9, -2, -11);
    line(0, -18, 2, -16);
    line(2, -16, 4, -17);
    line(4, -17, 6, -11);
    line(3, -15, 6, -11);
    line(6, -11, 5, -9);
    line(5, -9, 7, -7);
    line(7, -7, 5, -4);
    line(5, -4, 5, 0);   
    line(0, -18, -2, -16);
    line(-2, -16, -4, -17);
    line(-4, -17, -6, -11);
    line(-3, -15, -6, -11);
    line(-6, -11, -5, -9);
    line(-5, -9, -7, -7);
    line(-7, -7, -5, -4);
    line(-5, -4, -5, 0);
    line(-5, 0, -10, -2 );
    line(-10, -2, -12,-7);
    line(-12, -7, -14, -1);
    line(-14, -1, -13, 4);
    line(-14, 4, -13,7);
    line(-13, 7, -4, 6);
    line(-4, 6, 0, 7);
    line(5, 0, 10, -2 );
    line(10, -2, 12,-7);
    line(12, -7, 14, -1);
    line(14, -1, 13, 4);
    line(14, 4, 13,7);
    line(13, 7, 4, 6);
    line(4, 6, 0, 7);
    popMatrix();
  }  
}
