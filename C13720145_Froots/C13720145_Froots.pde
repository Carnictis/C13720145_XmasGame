//Owen Grogan
//C13720145
//DT228_2, Group B

//Christmas Assignment 2014/2015

//Set Up comments to go in here


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
  
 

