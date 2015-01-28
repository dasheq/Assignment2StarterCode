/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
    
    Author: Damian Szczepny
    SID: C13450368
    
    Comments: I realise the code is probably a bit messy and overcomplicated
    The general problem I had during this assignment is that every time I
    got something to work, another thing stopped working.
    
    Bugs: After playing the game 2P and you choose to play again the functionality of the game 
    breaks. Score for only P1 is showing and some objects are glitchy.
    Only writing to the file works and a new file is created every time the game is ran.
    
*/
import ddf.minim.*;
//Declare variables
PImage startbg;

Minim minim;

AudioPlayer playerhurt;
AudioPlayer ufohit;
AudioPlayer speed;
AudioPlayer points;
AudioPlayer healthup;
AudioPlayer bgmain;
AudioPlayer bggame;

float[] planetsX = new float[10];
float[] planetsY = new float[10];

int timeBG;
int time;
int gamemode = 0;
int textColor1;
int textColor2;
int textColor3;
int noPlayers;
int j = 0;

boolean[] keys = new boolean[526];
boolean option1;
boolean option2;
boolean option3;
boolean playersCreated;
boolean writeData;

PrintWriter output;

 
void setup()
{
  output = createWriter("data/scores.txt"); 
  size(800, 600);
  //Initialize some variables
  playersCreated = false;
  writeData = false;
  gamemode = 0;
  //The text is different colour every time the game is ran
  textColor1 = (int)random(0,255);
  textColor2 = (int)random(0,255);
  textColor3 = (int)random(0,255);
  
  minim = new Minim(this);
  
  playerhurt = minim.loadFile("PHurt.wav");
  ufohit = minim.loadFile("UfoHit.wav");
  speed = minim.loadFile("2XSpeed.wav");
  points = minim.loadFile("2XPoints.wav");
  healthup = minim.loadFile("PUHealth.wav");
  bgmain = minim.loadFile("bg1.mp3");
  bggame = minim.loadFile("bg2.mp3");
 
}

//Different ArrayList for everything to make things easier
//Probably overcomplicating things but it made the game work
ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Ufo> enemies = new ArrayList<Ufo>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Planets> planets = new ArrayList<Planets>();
ArrayList<PowerUp> powers = new ArrayList<PowerUp>();
ArrayList<GameObjects> objects = new ArrayList<GameObjects>();

void draw()
{
  if (gamemode == 0)
  {
    //This is the main menu of the game
    startbg = loadImage("startbg.jpg");
    startbg.resize(800,600);
    background(startbg);
    
    bgmain.play();
    
    textSize(80);
    fill(textColor1,textColor2,textColor3);
    text("SPACE ATTACK", width/2,100);
    textSize(30);
    
    //Hover over each option to change its colour
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
  
  //The game
  if(gamemode == 1 || gamemode == 2)
  {
    background(0);
    drawbg();
    game();
    
  }
  
  if(gamemode == 3)
  {
    //Game over screen, little buggy
    
    background(startbg);
    Player sc1 = players.get(0);  
    fill(255,255,0);
    textSize(50);
    //Displaying the score at the game over screen
    text("GAME OVER", width/2, 150);
    text("P1 SCORE: ",width/2,250);
    text((int)sc1.score,width/2,300);
    if(players.size() == 2)
      {
        Player sc2 = players.get(1);
        text("P2 SCORE: ", width/2,350);
        text((int)sc1.score2,width/2,400);
      }
      textSize(30);
      //The line below explains everything
      text("PRESS B TO PLAY AGAIN", width/2, 500);
      text("PRESS G TO QUIT", width/2, 540);
      textSize(18);
      while(writeData == false)
      {
        writeData();
      }
      if(keyPressed)
      {
        if(key == 'b' || key == 'B')
        {
            gamemode = 1;
            noPlayers = players.size();
            
            for (int i = 0 ; i < objects.size() ; i ++)
            {
                objects.remove(i);
            }
            for (int i = 0 ; i < players.size() ; i ++)
            {
                players.remove(i);
                println(players.size());
            }
            for (int i = 0 ; i < enemies.size() ; i ++)
            {
                enemies.remove(i);
            }
            for (int i = 0 ; i < planets.size() ; i ++)
            {
                planets.remove(i);
            }
            playersCreated = false;
        }
        if(key == 'g' || key == 'G')
        {
          output.flush();
          output.close();
          exit();
        }
      }
  }
}

void game()
{
    //All the fun stuff
    bggame.play();
    bgmain.pause();
    fill(255,255,0);
    timeBG = frameCount;
    time = 0;
    time =  ((timeBG - (frameCount % 60))/60);   //Overcomplicated timer?
    textSize(32);
    text("TIME :"+time, width/2, 30);
    
     if(noPlayers == 1 && frameCount % 180 == 0) //Spawn enemies every 5 seconds
    {
      Ufo u2 = new Ufo();
      objects.add(u2);
      enemies.add(u2);
    }
    
    if(noPlayers == 2 && frameCount % 120 == 0)
    {
      Ufo u3 = new Ufo();
      objects.add(u3);
      enemies.add(u3);
    }
    
      if(frameCount % 600 == 0)
      {
        PowerUp pu = new PowerUp();
        objects.add(pu);
        powers.add(pu);
      }
       while(playersCreated == false)
       {
         setUpPlayerControllers();
       } 
       Player sc1 = players.get(0);
      textSize(20);
      text("P1 SCORE: ",55,20);
      text((int)sc1.score,130,20);
      text("P1 HEALTH: ",62,40);
      text((int)sc1.health, 135, 40);
      if(players.size() == 2)
      {
        Player sc2 = players.get(1);
        text("P2 HEALTH: ",695,40);
        text((int)sc2.health,768,40);
        text("P2 SCORE: ", 688,20);
        text((int)sc1.score2,763,20);
      }
      //Display objects and movement
       for (int i = 0 ; i < objects.size() ; i ++)
       {
          objects.get(i).move();
          objects.get(i).display();
          if (! objects.get(i).alive)
          {
            objects.remove(i);
          }
       }
    
}

void drawbg()
{
  //Background
  stroke(textColor1,textColor2,textColor2);
  fill(32,32,32);
  rectMode(CORNERS);
  rect(0,0,width-1,50);
  fill(0);
  
    while(j != 10)
     { 
       Planets p1 = new Planets();
       objects.add(p1);
       planets.add(p1);
       j++;
     }
}

//The 4 variations of the function below show the text in the main menu

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
    p.pos.y = 500;
     objects.add(p);
     players.add(p);     
     Ufo u = new Ufo();
     objects.add(u);
     enemies.add(u);
   
  }
  playersCreated = true;
}

void writeData()
{
    Player sc1 = players.get(0);
    output.println(sc1.score);
    if(noPlayers == 2)
    {
          output.println(sc1.score2);
    }  
    writeData = true;   
}
