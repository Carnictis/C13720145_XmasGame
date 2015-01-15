//Owen Grogan
//C13720145
//DT228_2, Group B

//Christmas Assignment 2014/2015

//Set Up comments to go in here

//The initial premise of this game is to use a dinosuar to blast bubbles
// or similar at falling enemies so he is free to catch fruit
//It will use the trackpad or mouse to control and click to shoot
PImage LevelBG, StartBG, EndBG; // images for the Splashes
//these have yet to be drawn

PFont font; //font in use

Dinosaur dinosaur; // create the Dinosaur

int timer = 0; //timer

int FruitTimer=0; //timer for generating new falling fruits

int direction = -1;

int scene =0;

ArrayList<Fruit> fruits=new ArrayList<Fruit>();

String message="";  //variable for any messages

  Minim minim;  //sounds objects
  AudioPlayer player;
  
  Minim minimCrash;
  AudioPlayer playerCollide;
  
  
  //now setup
  void setup()
  {
    size (900,700);
    
    background = loadImage("images//"); // insert names of background when ready
    
    StartBG = loadImage("images//"); //as above, images will go into the image folder of the sketch
    
    EndBG = loadImage("images//");
    
    int randDino = (int)random(1,4); // choose a random dinosaur sprite
    
    dinosaur = new Dinosaur(300,500,"images//dino"+randDino+".png",150,150);
    //the above line will draw a dino at the given xy and 
    //concatenate a number twixt 1&4 and show that dino
    
    font = loadFont("HillHouse.vlw"); // load up new font
    
    generateNewFruits(); // create and add new fruits to the array
    
    minim = new Minim(this);//load sound for shoot
    player = minim.loadFile("sound//");//need bubble sound
    
    minim = new Minim(this);//load sound for collide with bad sprite
    playerBump = minimBump.loadFile("sound//");// need collision sound 
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
   
   Fruit fruit= new Fruit(randXPos*130+20,0,"images//Fruit"+randImage+".png",
    70*randomSize,70*randomSize,isGoodFruit);  
      
   fruits.add(fruit); //add fruit to the fruits array list
   
 }//end of generate Fruits method
 
 //__________________________________________
 
 void draw()
 {
   if(scene==0)
   {
     startWelcomeScreen()
     
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

}//end of play method

//__________________________________________
