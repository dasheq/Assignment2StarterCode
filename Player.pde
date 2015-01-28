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
  int score;
  int score2;
  float health; 
  int doubleSpeed;  
  int doublePoints;
  
  float timeDelta = 1.0f / 60.0f;
  float fireRate = 10.0f;
  float ellapsed = 0.0f;
  float ellapsed2 = 0.0f;
  float toPass = 1.0f / fireRate;
    
  Player()
  {
    
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
    theta2 = 0;
    health = 100f;
    score = 0;
    score2 = 0;
    doubleSpeed = 1;
    doublePoints = 1;
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
    ellapsed += timeDelta;
    vertical.x = doubleSpeed*2*(sin(theta2));
    vertical.y = doubleSpeed*2*(-cos(theta2));
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
       
    }
    if (checkKey(button1))
    {
      if (ellapsed > toPass)
          {
            Bullet bullet = new Bullet();
            bullet.pos = pos.get();
            bullet.theta2 = theta2;
            bullet.id = index;
            objects.add(bullet);
            ellapsed = 0.0f;
          }
    }
    if (checkKey(button2))
    {
      println("Player " + index + " button 2");
    }    
  }
  
  void display()
  {    
     //Checking if player touches planets, if so health is decreased
     for(int i = 0; i<planets.size(); i++)
      {
        Planets planet = planets.get(i);
      
        if(dist(pos.x, pos.y, planet.pos.x, planet.pos.y) < 40)
        {
          health -= 0.1f;
          playerhurt.play();
          playerhurt.rewind();          
        }
      }

    //Checking if player touches enemies, if so health is decreased at 2x rate
    for(int i = 0; i<enemies.size(); i++)
    {
       Ufo enemy = enemies.get(i);
       
       if(dist(pos.x, pos.y, enemy.pos.x, enemy.pos.y) < 30)
       {
         health -= 0.2f;
         playerhurt.play();
         playerhurt.rewind();
       }
    }
    
    for(int i = 0; i<powers.size(); i++)
    {
       PowerUp pu = powers.get(i);
       if(dist(pos.x, pos.y, pu.pos.x, pu.pos.y) < 20 && pu.powerUPid == 2)
       {
         doubleSpeed = 2;
         speed.play();
         speed.rewind();
         pu.alive = false;
         powers.remove(i);
       }
       if(dist(pos.x, pos.y, pu.pos.x, pu.pos.y) < 20 && pu.powerUPid == 1)
       {
         doublePoints = 2;
         points.play();
         points.rewind();
         pu.alive = false;
         powers.remove(i);
       
       }
       if(dist(pos.x, pos.y, pu.pos.x, pu.pos.y) < 20 && pu.powerUPid == 3)
       {
         health = health+10;
         healthup.play();
         healthup.rewind();
         pu.alive = false;
         powers.remove(i);
         health = health+10;
       
       }
    }
    
    if(doubleSpeed == 2)
    {
         ellapsed2 += timeDelta;
         if(ellapsed2 > 5)
         {
           doubleSpeed = 1;
           ellapsed2 = 0;
         }
    }
       
    if(doublePoints == 2)
    {
         ellapsed2 += timeDelta;
         if(ellapsed2 > 5)
         {
           doublePoints = 1;
           ellapsed2 = 0;
         }
    }
    
    if(health < 0)
    {
      alive = false;
      if(noPlayers == 1)
      {
        gamemode+= 2;
      }
      else
      {
        gamemode++;
      }
    }
     
    //lines   
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
    stroke(255,0,0);
    fill(0);
    ellipse(10, 8, 3, 10);
    ellipse(-10,8, 3, 10);
    
    
    fill(0,255,0);
    rectMode(CENTER);
    rect(0, 25, health/2,5);
    popMatrix();
  }  
  
  void scoreGain()
  {
    score = score + doublePoints;
  }
  
  void scoreGain2()
  {
    score2 = score2 + doublePoints;
  }
  
}
