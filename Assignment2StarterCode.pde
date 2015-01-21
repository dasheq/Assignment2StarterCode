/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/
PImage startbg;
int gamemode = 0;
ArrayList<Player> players = new ArrayList<Player>();
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
  size(500, 500);
  
  gamemode = 0;
  
    textColor1 = (int)random(0,255);
    textColor2 = (int)random(0,255);
    textColor3 = (int)random(0,255);
}

void draw()
{
  if (gamemode == 0)
  {

    startbg = loadImage("startbg.jpg");
    startbg.resize(500,500);
    background(startbg);
    textSize(80);
    fill(textColor1,textColor2,textColor3);
    text("K9LL", 250,100);
    textSize(30);
    if( (mouseX >130 && mouseY > 270 )&& (mouseX < 390 && mouseY < 300))
      {
        
       showText1();
        
      }
      else if( (mouseX >130 && mouseY > 302 )&& (mouseX< 390 && mouseY < 333 ))
      {
       
        showText2();
        
      }
      else if((mouseX > 130 && mouseY > 335) && (mouseX< 390 && mouseY < 365))
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
      players.get(0).update();
      players.get(0).display();
   } 
   if(noPlayers == 2)
   {
     setUpPlayerControllers();
     players.get(0).update();
     players.get(0).display();
     players.get(1).update();
     players.get(1).display();
   }
  }
}

void showText1()
{
        textAlign(CENTER);
        fill(255);
        stroke(0);
        text("START GAME 1P",250,300);
        textAlign(CENTER);
        fill(textColor1,textColor2,textColor3);
        text("START GAME 2P",250, 333);
        textAlign(CENTER);
        text("EXIT GAME", 250, 365);
        option1 = true;
        option2 = false;
        option3 = false;
}

void showText2()
{       
        textAlign(CENTER);
        fill(textColor1,textColor2,textColor3);
        text("START GAME 1P",250,300);
        textAlign(CENTER);
        fill(255);
        text("START GAME 2P",250, 333);
        textAlign(CENTER);
        fill(textColor1,textColor2,textColor3);
        text("EXIT GAME", 250, 365);
        option1 = false;
        option2 = true;
        option3 = false;
  
}

void showText3()
{
         
        textAlign(CENTER);
        fill(textColor1,textColor2,textColor3);
        stroke(0);
        text("START GAME 1P",250,300);
        textAlign(CENTER);
        text("START GAME 2P",250, 333);
        textAlign(CENTER);
        fill(255);
        text("EXIT GAME", 250, 365);
        option1 = false;
        option2 = false;
        option3 = true;
}


void showText4()
{
        textAlign(CENTER);
        fill(textColor1,textColor2,textColor3);
        stroke(0);
        text("START GAME 1P",250,300);
        textAlign(CENTER);
        text("START GAME 2P",250, 333);
        textAlign(CENTER);
        text("EXIT GAME", 250, 365);
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
   players.add(p);         
  }
}


