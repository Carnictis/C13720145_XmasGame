//this class handles the controls and handling of the player sprite 
class Dinosaur extends MobileEntity
{
  PImage DinoImage;    //image for Dinosaur
  int lives;    //lives for the Dinosaur
  int scores;  //scores for the Dinosaur
  boolean isCollide=false;    //flag for collide Dinosaur with enemy sprite
  ArrayList<Bubble> bubbles=new ArrayList<Bubble>();    //ArrayList of Bubbles
  int flipperTimer=0;    //flipper Timer

  Dinosaur(float xPos, float yPos, String imagePath, int w, int h)      //constructor for Dinosaur
  {
    this.xPos=xPos;
    this.yPos=yPos;
    this.DinoImage = loadImage(imagePath);
    this.w=w;
    this.h=h;
    this.lives=5;
    this.scores=scores;
  }//end Constructor

  //__________________________________________



  //draw Dinosaur
  void drawDinosaur()
  {
    if (!isCollide)
    {
      image(DinoImage, this.xPos, this.yPos, w, h);  //draw the image of one of the Dinosaurs
      flipperTimer=0;
    }//end is Colliding
    else
    {
      //if Dinosaur collides wih enemy sprite flip and play sound
      if (flipperTimer<105)
      {
        if (flipperTimer%2==0)
        {
          image(DinoImage, this.xPos, this.yPos, w, h);
        }// end if flipper %2
        flipperTimer++;
      }//end if FlipperTimer
      else
      {
        isCollide=false;
        flipperTimer=0;
      }// end is colliding false
    }// end else


    //draw all bubbles and move
    for (int i=0; i<bubbles.size (); i++)
    {
      bubbles.get(i).drawBubble();
      bubbles.get(i).moveUP();
    }//end bubbles for loop
  }// end Draw Dinosaur

  //__________________________________________


  //check Dinosaur collide  With Fruit
  void collideDinosaurWithFruit(ArrayList<Fruit> fruits)
  {
    for (int i=0; i<fruits.size (); i++)
    {
      if (fruits.get(i).collide(this))
      {
        if (fruits.get(i).findIsGoodFruit())
        {
          this.scores++;                      //if Dinosaur collides  With Good Fruit add score
        }// end if
        else
        {
          this.lives--;                   //if Dinosaur collides  With other  Enemies sub lives
          isCollide=true;
        }// end else
        fruits.remove(i);                 //remove enemy sprite from list
      }//end if
    }
  }// end Dino Fruit Collision Check

  //__________________________________________

  //collide Bubble With Fruit
  void collideBubbleWithFruit(ArrayList<Fruit> fruits)
  {
    for (int i=0; i<bubbles.size (); i++)
    {
      for (int j=0; j<fruits.size (); j++)
      {
        if (bubbles.get(i).collide(fruits.get(j)) && 
          !fruits.get(j).findIsGoodFruit())
        {
          bubbles.remove(i);                    //delete bubbles from their list
          fruits.remove(j);                     //delete fruits from their list
        }// end innermost if
      }// end inner for (fruits)
    }//end outer for (bubbles)
  }// end Bubble Fruit Collision Check

  //__________________________________________


  //move Dinosaur using mouse
  void mouse_Moved(int mouse_X)
  {
    this.xPos=mouse_X-w/2;
  }//end mouse Moved

  //move Dinosaur using left and right buttons
  void move(int direction)
  {
    //left 
    if (direction==0)
    {
      moveLeft();
    }//end if left

      //Right
    if (direction==1)
    {
      moveRight();
    }//end if right
  }//end move

  //__________________________________________

  //move let
  void moveLeft()
  {
    if (xPos>=0)
    {
      xPos-=5;
    }// ed if
  }//end move Left

  //__________________________________________


  //move Right
  void moveRight()
  {
    if (xPos+w<=width)
    {
      xPos+=5;
    }//end if
  }//end move right

  //__________________________________________
  /*Below are various methods including 
   those for shooting, setting
   scores, lives etc*/

  //this is the shoot method
  void shoot()
  {
    Bubble bubble=new Bubble(this.xPos+w/2, this.yPos, 15, 20);
    bubbles.add(bubble);
  }// end shoot

  //set Lives
  void setLives(int lives)
  {
    this.lives=lives;
  }//end set Lives


    //set Scores
  void setScores(int scores)
  {
    this.scores=scores;
  }//end set scores


    //get Lives
  int getLives()
  {
    return this.lives;
  }// end get Lives


    //get Scores
  int getScores()
  {
    return this.scores;
  }// end get scores

    //get IsCollide
  boolean getIsCollide()
  {
    return isCollide;
  }//end bool Get Is Collide
}//end Class Dinosaur
