// this class will take draw the bullets, move and draw them

class Fruit extends MobileEntity
{
  PImage FruitImage; // image for fruit sprite
  boolean isGoodFruit; //check the type of fruit it is
  Fruit (float xPos,float yPos,String imagePath,int w,int h,boolean isGoodFruit)//Fruit Constructor
  {
       this.xPos=xPos;
       this.yPos=yPos;
       this.FruitImage = loadImage(imagePath);
       this.w=w;
       this.h=h;
       this.isGoodFruit=isGoodFruit;
  }//end Fruit Constructor
  
  //now draw the Fruit
  void drawFruit()
  {
    image(FruitImage,this.xPos,this.yPos,w,h);
  
  }//end draw meteor
  
  //move the fruit down/fall()
  
  void fall()
  {
     this.yPos+=2;
     //this collection of ifs will increase speed upon 
     //score being greater than
     //5,11 and 16
     if(dinosaur.getScores()>5)
     {
       this.yPos++;
     }//end >5
      
     if(dinosaur.getScores()>11)
     {
       this.yPos++;
       
     }//end >11
     
     if(dinosaur.getScores()>16)
     {
       this.yPos++;
       
     }//end >16
      
      
  }//end fall()
  
  
  /*Boolean for deciphering good fruit to go here*/
  boolean findIsGoodFruit() //retrieve the boolean for deciphering whether or not a fruit is a good one
  {
    return isGoodFruit;
    
  }//end boolean
  
}//end Class Fruit
