// this class will take draw the bullets, move and draw them

class Bubble extends MobileEntity
{
  //Constructor
  Bubble (float xPos, float yPos, int w, int h)
  {  
    this.xPos =xPos;
    this.yPos=yPos;
    this.w=w;
    this.h=h;
  }//end Bubble Constructor

  //now draw bubble as a blue circle, until real sprite is ready
  void drawBubble()
  {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = 150;
    fill(r, g, b, a);
    noStroke();
    ellipse(this.xPos, this.yPos, w, h);
  }//end Draw Bubble

  void moveUP()
  {
    this.yPos-=2;
  }//end move up
  //lock the bubble on its x access and move up the screen
}//End Class Bubble
