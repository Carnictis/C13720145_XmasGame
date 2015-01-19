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
      //fall code to go here
      
  }//end fall()
  /*Boolean for deciphering good fruit to go here*/
  
}//end Class Fruit
