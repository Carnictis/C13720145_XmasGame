//this class will check for collision of any moving objects
//with the player sprite

class MobileEntity
{  
    float xPos; //the x position of Mobile Entity
    float yPos; //the y position of Mobile Entity
    int w; //width variable
    int h; // height variable
    
    boolean collide(MobileEntity other) //boolean for collision
    {
      if (this.xPos+w/2>other.xPos && this.xPos+w/2< other.xPos+other.w &&  
          this.yPos+h/2>other.yPos && this.yPos< other.yPos+other.h)// condition
      {
          return true;
      }//end if
      
      return false;
      
    }//end boolean collide

}//end class MobileEntity
