//Owen Grogan
//C13720145
//DT228_2, Group B

//Christmas Assignment 2014/2015

//Set Up comments to go in here

//sketches needed:
//three bgs
//four dinos
//three fruits

//The initial premise of this game is to use a dinosuar to blast bubbles
// or similar at falling enemies so he is free to catch fruit
//It will use the trackpad or mouse to control and click to shoot

import ddf.minim.*; //use this to import  sund library

PImage LevelBG, StartBG, EndBG; // images for the Splashes
//these have yet to be drawn

PFont font; //font in use

Dinosaur dinosaur; // create the Dinosaur Sprites Players

int timer = 0; //timer

int FruitTimer=0; //timer for generating new falling fruits

int direction = -1;

int scene =0; //this variable will guide the text and backgrounds

ArrayList<Fruit> fruits=new ArrayList<Fruit>();

String message="";  //variable for any messages required

  Minim minim;  //sounds objects
  AudioPlayer player;
  
  Minim minimCrash;
  AudioPlayer playerCollide;
  
  
  //now setup
  void setup()
  {
    size (650,857);
    
    LevelBG = loadImage("images//BackGround.jpeg"); // insert names of background when ready
    
    StartBG = loadImage("images//StartBG.jpeg"); //as above, images will go into the image folder of the sketch
    
    EndBG = loadImage("images//");
    
    int randDino = (int)random(1,4); // choose a random dinosaur sprite
    
    dinosaur = new Dinosaur(300,500,"images//dino"+randDino+".png",150,150);
    //the above line will draw a dino at the given xy and 
    //concatenate a number twixt 1&4 and show that dino
    
    font = loadFont("HillHouse.vlw"); // load up new font
    
    generateNewFruits(); // create and add new fruits to the array
    
    minim = new Minim(this);//load sound for shoot
    player = minim.loadFile("sound//BubblePop.wav");// bubble sound
    
    
    minim = new Minim(this);//load sound for collide with bad sprite
    playerBump = minimBump.loadFile("sound//Bump.mp3");// need collision sound 
  }//end of set up
  
  
  //__________________________________________
  
 //now implement a method to add new Fruits 
 void generateNewFruits()
 {
   int randImage = (int)random (1,4);
   
   int randXPos = (int) random(0,7);
   
   int randomSize= (int) random(1,3);
   
   //these above three randomisers will choose a random sprite,
   //place at a random X position
   //and with a random size
   
    if(randImage==3)
    {
       isGoodFruit=true; //Good/ Edible is true and generete the fruit
    }
   
   Fruit fruit= new Fruit(randXPos*130+20,0,"images//GoodFruit"+randImage+".png",
    70*randomSize,70*randomSize,isGoodFruit);  
      
   fruits.add(fruit); //add fruit to the fruits array list
   
 }//end of generate Fruits method
 
 //__________________________________________
 
 void draw()
 {
   if(scene==0)
   {
     startWelcomeScreen();
     
   }//end if scene==0

 //__________________________________________ 

  if(scene==1)
  {
    if(dinosaur.getLives()>0)      //Now check if player has any lives
    {
      //play
       play();
       if(dinosaur.hasCollided())   //check if dino collides with obstacle
       {
         //play sound
          playerBump.play();
          //load sound again
          playerBump = minimBumploadFile("sound//");
       }// end if collision with bad sprite
    }//end if Check for Lives
    
  }// end if scene ==1
  
  else
    {
      scene=2; //if the player has lost show this message

      message="Game Over!";
    }//end if Game Over
    
      if(dinosaur.getScores()==20)   //check if player has won
  {
      scene=2; 
      message="Well Done!";
  }//end if scores ==20
  
   if(scene==2)
  {
     background(EndBG);
     textFont(font, 80);
     fill(255,255,255);
     text(message,500, 100);
     textFont(font, 50);
     text("Click to Start Over!",60, 600);
     int randDino= (int)random(1,7);//generate new dinosaur for next game
     dinosaur = new Dinosaur(300,500,"images//dino"+randDino+".png",150,150); //choose the sprite
     }//end if scene ==2 
  
  }//end draw


 //__________________________________________ 

void startWelcomeScreen()
{
  background(StartBG);
  textFont(font, 50);
  fill(255);
  text("Froots",70,300);
  textFont(font,40);
  text("Click to Play!",60,500);

}//end of startWelcomeScreen

//__________________________________________ 

//begin play method here

void play()
{
  background(BackGround) = loadImage"images//"); //load background image
  
  textFont (font,35); //set new font
  
  fill(255);
  text("Score: "+dinosaur.getScores(),20, 25);
  
  text("Lives: "+dinosaur.getLives(),750, 25); 
  
  dinosaur.drawDinosaur(); //draw dinosaur sprite
  
  dinosaur.move(direction); //move dinosaur
  
  if(FruitTimer>40) //once these milliseconds have passed generate a new fruit
  {
      generateNewFruits(); //generate new fruits
      
      FruitTimer=0;
      
  }//end if fruit timer
  if (dinosaur.getScores()>5&& FruitTimer>30) //if conditions to increase the number of fruits once the score increases
  {
    generateNewFruits();     
    FruitTimer=0;
  }//this is the end of the if that will make the game trickier
  
  if (dinosaur.getScores()>10&& FruitTimer>20)
  {
    generateNewFruits();     
    FruitTimer=0;
  }// end of second time frame difficulty tier
  
  if (dinosaur.getScores()>15&& FruitTimer>10)
  {
    generateNewFruits();     
    FruitTimer=0;
  }// end of third time frame difficulty tier
  
  FruitTimer++;
  
  for(int i=0;i<fruits.size();i++)//draw all fruits in an array list
  {
    fruits.get(i).drawFruit();
      fruits.get(i).fall(); //manipulate and move fruit
  }//end for, fruit array list
  
  //now to check for collision from dino bubble with enemy sprites
  dinosaur.collideBubbleWithEnemies(fruits);
  
  //now to check for collision from dino itself with enemy sprites
  dinosaur.collideDinoWithEnemies(fruits);
  
  timer++;
  if(timer>20)
  {
      direction=-1;
  }//end of timer check
  
  
}//end of play method

//__________________________________________

//function for when the mouse is moved
void mouseMoved()
{
   dinosaur.mouse_Moved(mouseX);
}//end of moved

//__________________________________________

//function for when mouse is Pressed
void mousePressed()
{
   if(scene==0)//if the scene is 0, start the game
   {
     scene=1;
   }//end if scene 0
   if(scene==1)// if the scene is 1, shoot a projectile
   {
     //if user click shoot
     dinosaur.shoot();
     //play the sound when projectile is shot
     player.play();
   }// end if scene 1

  if(scene==2)// if game over screen, reset everything
   {
     scene=0;
     //set new score and new lives for new game
     dinosaur.setLives(3);
     dinosaur.setScores(0);
     //clear all fruits
     fruits.clear();
   }//end if scene 2
   
}//end  mouse pressed

//__________________________________________


  //when the mouse is released
  void mouseReleased()
  {  
    //as the file has been closed it need to be reloaded
    player = minim.loadFile("sound//");// insert soundfile later
  }// end of mouse released


  void keyPressed() 
{
    if (key == CODED)
    {
      //if left button pressed...
      if (keyCode == LEFT)
      {
         direction=0;
         timer=0;
      } // end left
      //if right button pressed...
      if (keyCode == RIGHT) 
      {
          direction=1;
          timer=0;
      }// end right
    }// end coded
    //user can use s to shoot also, press s, 
    //play sound and make projectile
    if (key =='s') 
    {
       dinosaur.shoot();
        player.play();
   }//end key pressed s
   
}//end void keyPressed

//__________________________________________


void keyReleased() 
{
 if (key == CODED)
 {
      //if left button pressed...
      if (keyCode == LEFT)
      {
         timer=0;   
      } //end left
      //if right button pressed...
      if (keyCode == RIGHT) 
      {
         timer=0;
      }//end right
      
  }//end of key coded
  
  player = minim.loadFile("sound//");
  
}// end key released
  
  //__________________________________________

//end of required methods
//now for other game object classes.
