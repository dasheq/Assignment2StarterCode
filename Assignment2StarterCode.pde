/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/
PImage startbg;
int gamemode = 0;
boolean[] keys = new boolean[526];
boolean option1;
boolean option2;
boolean option3;
int textColor1;
int textColor2;
int textColor3;
int noPlayers;
 
void setup()
{
  size(800, 600);
  
  gamemode = 0;
  textColor1 = (int)random(0,255);
  textColor2 = (int)random(0,255);
  textColor3 = (int)random(0,255);
    
}


ArrayList<GameObjects> objects = new ArrayList<GameObjects>();

void draw()
{
  if (gamemode == 0)
  {

    startbg = loadImage("startbg.jpg");
    startbg.resize(800,600);
    background(startbg);
    textSize(80);
    fill(textColor1,textColor2,textColor3);
    text("K9LL", width/2,100);
    textSize(30);
    if( (mouseX >280 && mouseY > 370 )&& (mouseX < 520 && mouseY < 400))
      {
        
       showText1();
        
      }
      else if( (mouseX >280 && mouseY > 402 )&& (mouseX< 520 && mouseY < 433 ))
      {
       
        showText2();
        
      }
      else if((mouseX > 310 && mouseY > 435) && (mouseX< 490 && mouseY < 465))
      {

        showText3();
      }
      else
      { 
        showText4();
      }
  }
  
  
  if(gamemode == 1)
  {
    background(0);
   if(noPlayers == 1)
   //for(Player player:players)
   { 
       setUpPlayerControllers();
       objects.add(new Speed(400,400));
       objects.add(new Wallhack(200,200));
       objects.get(objects.size()-2).display();
       objects.get(objects.size()-1).display();
       for (int i = 0 ; i < noPlayers ; i ++)
       {
          objects.get(i).move();
          objects.get(i).display();
          if (! objects.get(i).alive)
          {
            objects.remove(i);
          }
       }
   
       
       for(int i = 0 ; i < noPlayers ; i++)
       {
            objects.get(noPlayers+i).display();
       }
   } 
       
   
   if(noPlayers == 2)
   {
       setUpPlayerControllers();
       objects.add(new Speed(400,400));
       objects.add(new Wallhack(200,200));
       objects.get(objects.size()-2).display();
       objects.get(objects.size()-1).display();
       
       for (int i = 0 ; i < noPlayers ; i ++)
       {
         objects.get(i).display();
          objects.get(i).move();
        
     
         if (! objects.get(i).alive)
         {
           objects.remove(i);
         }
       }
       
       for(int i = 0 ; i < noPlayers ; i++)
       {
         objects.get(noPlayers+i).display();
       }
   }   
  }
 }

void showText1()
{
        textAlign(CENTER);
        fill(255);
        stroke(0);
        text("START GAME 1P",width/2,400);
        textAlign(CENTER);
        fill(textColor1,textColor2,textColor3);
        text("START GAME 2P",width/2, 433);
        textAlign(CENTER);
        text("EXIT GAME", width/2, 465);
        option1 = true;
        option2 = false;
        option3 = false;
}

void showText2()
{       
        textAlign(CENTER);
        fill(textColor1,textColor2,textColor3);
        text("START GAME 1P",width/2,400);
        textAlign(CENTER);
        fill(255);
        text("START GAME 2P",width/2, 433);
        textAlign(CENTER);
        fill(textColor1,textColor2,textColor3);
        text("EXIT GAME", width/2, 465);
        option1 = false;
        option2 = true;
        option3 = false;
  
}

void showText3()
{
         
        textAlign(CENTER);
        fill(textColor1,textColor2,textColor3);
        stroke(0);
        text("START GAME 1P",width/2,400);
        textAlign(CENTER);
        text("START GAME 2P",width/2, 433);
        textAlign(CENTER);
        fill(255);
        text("EXIT GAME", width/2, 465);
        option1 = false;
        option2 = false;
        option3 = true;
}


void showText4()
{
        textAlign(CENTER);
        fill(textColor1,textColor2,textColor3);
        stroke(0);
        text("START GAME 1P",width/2,400);
        textAlign(CENTER);
        text("START GAME 2P",width/2, 433);
        textAlign(CENTER);
        text("EXIT GAME", width/2, 465);
        option1 = false;
        option2 = false;
        option3 = false;
        
  
}
void mousePressed()
{
  if(option1 == true)
  {
      gamemode = 1;
      noPlayers = 1;
  }
  else if(option2 == true)
  {
      gamemode = 1;
      noPlayers = 2;
  }
  else if(option3 == true)
  {
    exit();
  }
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < noPlayers ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(
            i
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML);
    int x = (i + 1) * gap;
    p.pos.x = x;
    p.pos.y = 300;
   objects.add(p);         
   objects.add(new Ufo());
  }
}


