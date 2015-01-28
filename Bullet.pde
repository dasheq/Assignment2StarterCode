class Bullet extends GameObjects
{
  float toLive = 2.0f;
  float ellapsed = 0.0;
  float timeDelta = 1.0f / 60.0f;
  int id = 0;
  
  Bullet()
  {
    
  }
  
  void move()
  { 
    //Make the bullet disappear after 3s
    ellapsed += timeDelta;
    if (ellapsed > toLive)
    {
      
      fill(255,20,20);
      ellipse(pos.x,pos.y,5,5);
      alive = false;
    }
    
    //Make the bullet disappear if it goes outside the map boundaries
    if(pos.x < 0 || pos.x > width || pos.y > height || pos.y < 55)
    {
      
      fill(255,20,20);
      ellipse(pos.x,pos.y,5,5);
      alive = false;
    }
    
    //Hit detection against enemies and incrementing the correct player's score
    Player sc3 = players.get(0);
    if(players.size() == 2)
      {
        Player sc2 = players.get(1);
      }            
    for(int i = 0; i<enemies.size(); i++)
    {
      if(players.size() == 2)
      {
        Player sc2 = players.get(1);
      }  
      Ufo enemy = enemies.get(i);
      if(dist(pos.x, pos.y, enemy.pos.x, enemy.pos.y) < 30)
      {
        fill(255,20,20);
        ellipse(pos.x,pos.y,5,5);
        alive = false;
        if(id == 0)
        {
          sc3.scoreGain();
        }
        if(id == 1)
        {
          sc3.scoreGain2();
        }
        
        enemy.hit(i);
        
      }
    }
    
    //Hit detection against planets
    for(int i = 0; i<planets.size(); i++)
    {
      Planets planet = planets.get(i);
      
      if(dist(pos.x, pos.y, planet.pos.x, planet.pos.y) < 35)
      {
        fill(255,20,20);
        ellipse(pos.x,pos.y,5,5);
        alive = false;
      }
    } 
    
    vertical.x = 2*(sin(theta2));
    vertical.y = 2*(-cos(theta2));
    float speed = 1.0f;
 
    PVector velocity = PVector.mult(vertical, speed);
    pos.add(vertical);
        
  }
  
  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta2);
    fill(textColor2,textColor3,textColor1);
    stroke(textColor2,textColor3,textColor1);
    line(0, - 5, 0, 5);
    popMatrix();
  }
}
