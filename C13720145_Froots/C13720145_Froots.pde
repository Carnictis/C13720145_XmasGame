//Owen Grogan
//C13720145
//DT228_2, Group B
//comment
//Just a final comment so I can utilise GitHub for one last Commit/Push

//Christmas Assignment 2014/2015
//testing

//Set Up comments to go in here
//Program "Threatens" to compile, just need to send in sketches.
//sketches needed:
//three bgs
//four dinos
//three fruits

//The initial premise of this game is to use a dinosuar to blast bubbles
// or similar at falling enemies so he is free to catch fruit
//It will use the trackpad or mouse to control and click to shoot

import ddf.minim.*; //use this to import  sound library

PImage LevelBG, MenuBG, EndBG; // images for the Splashes
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

Minim minimBump;
AudioPlayer playerCollide;



//now setup
void setup()
{
  size (650, 867);

  LevelBG = loadImage("images//BackGround.jpeg"); // insert names of background when ready

  MenuBG = loadImage("images//MenuBG.jpeg"); //as above, images will go into the image folder of the sketch

  EndBG = loadImage("images//EndBG.PNG");//MenuBG.PNG

  int randDino = (int)random(1, 9); // choose a random dinosaur sprite

  dinosaur = new Dinosaur(100, 670, "images//dino"+randDino+".PNG", 150, 150);
  //the above line will draw a dino at the given xy and 
  //concatenate a number twixt 1&7 and show that dino

  font = loadFont("HillHouse.vlw"); // load up new font

    generateNewFruits(); // create and add new fruits to the array

  minim = new Minim(this);//load sound for shoot
  player = minim.loadFile("sound//BubblePop.wav");// bubble sound
  //sounds


  minimBump = new Minim(this);//load sound for collide with bad sprite
  playerCollide = minimBump.loadFile("sound//Bump.mp3");// need collision sound 


  //minimTrack = new Minim(this);//music
  //music = minimTrack.loadfile("sound//parasol.mp3");
}//end of set up


//__________________________________________

//now implement a method to add new Fruits 
void generateNewFruits()
{
  int randImage = (int)random (1, 7); //generate a random number for the falling item

  int randXPos = (int) random(0, 7);

  int randomSize= (int) random(1, 2);

  boolean isGoodFruit=false; //check to see if is a collectible

    //these above three randomisers will choose a random sprite,
  //place at a random X position
  //and with a random size

    if (randImage==3||randImage==4||randImage==5||randImage==6)
  {
    isGoodFruit=true; //Good/ Edible is true and generete the fruit
  }

  Fruit fruit= new Fruit(randXPos*130+20, 0, "images//GoodFruit"+randImage+".PNG", 
  70*randomSize, 70*randomSize, isGoodFruit);  

  fruits.add(fruit); //add fruit to the fruits array list
}//end of generate Fruits method

//__________________________________________

void draw()
{
  println(frameRate);
  if (scene==0)
  {
    startWelcomeScreen();
  }//end if scene==0

  //__________________________________________ 

  if (scene==1)
  {
    if (dinosaur.getLives()>0)      //Now check if player has any lives
    {
      //play
      play();
      if (dinosaur.getIsCollide())   //check if dino collides with obstacle
      {
        //play sound
        playerCollide.play();
        //load sound again
        playerCollide = minimBump.loadFile("sound//Bump.mp3");
      }// end if collision with bad sprite
    }//end if Check for Lives
    // end if scene ==1
    //initially closed something too early

    else
    {
      scene=2; //if the player has lost show this message

      message="Game Over!";
    }//end if Game Over

    if (dinosaur.getScores()==10)   //check if player has won
    {
      scene=2; 
      message="Well Done!";
    }//end if scores ==20
  } // end scene==1
  if (scene==2)
  {
    //music.play();
    background(MenuBG);
    textFont(font, 80);
    fill(255);
    text(message, 100, 100);
    textFont(font, 50);
    text("Click to Start Over!", 60, 220);
    int randDino= (int)random(1, 7);//generate new dinosaur for next game
    dinosaur = new Dinosaur(100, 670, "images//dino"+randDino+".PNG", 150, 150); //choose the sprite
  }//end if scene ==2
}//end draw


//__________________________________________ 

void startWelcomeScreen()
{
  background(EndBG);
  textFont(font, 100);
  fill(#9be564);
  // fill(#ff99c9);
  text("Froots", 140, 100);
  fill(#ff9f1c);
  textFont(font, 40);
  text("Click to Play!", 170, 150);
  fill(#ff99c9);
  textFont(font, 40);
  text("Use Arrows or Mouse To Move", 30, 200);
  fill(#ff4b3e);
  textFont(font, 40);
  text("Click or S to Shoot", 135, 250);
}//end of startWelcomeScreen

//__________________________________________ 

//begin play method here

void play()
{
  background(LevelBG); //load background image

  textFont (font, 35); //set new font

  fill(255);
  text("Score: "+dinosaur.getScores(), 20, 35);

  text("Lives: "+dinosaur.getLives(), 20, 80); 

  dinosaur.drawDinosaur(); //draw dinosaur sprite

  dinosaur.move(direction); //move dinosaur

  if (FruitTimer>40) //once these milliseconds have passed generate a new fruit
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

  for (int i=0; i<fruits.size (); i++)//draw all fruits in an array list
  {
    fruits.get(i).drawFruit();
    fruits.get(i).fall(); //manipulate and move fruit
  }//end for, fruit array list

  //now to check for collision from dino bubble with enemy sprites
  dinosaur.collideBubbleWithFruit(fruits);

  //now to check for collision from dino itself with enemy sprites
  dinosaur.collideDinosaurWithFruit(fruits);

  timer++;
  if (timer>20)
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
  if (scene==0)//if the scene is 0, start the game
  {
    scene=1;
  } else if (scene==1) // if the scene is 1, shoot a projectile
  {
    //if user click shoot
    dinosaur.shoot();
    //play the sound when projectile is shot
    player.play();
  }// end if scene 1

  if (scene==2)// if game over screen, reset everything
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
  player = minim.loadFile("sound//BubblePop.wav");// insert soundfile later
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

  player = minim.loadFile("sound//BubblePop.wav");
}// end key released

//__________________________________________

//end of required methods
//now for other game object classes.
