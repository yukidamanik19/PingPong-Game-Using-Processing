class Paddle {
  float x;
  float y;
  int paddleWidth;
  int paddleHeight;
  final int velocity = 15;
  
  Paddle(float x, float y, int paddleWidth, int paddleHeight){
    this.x = x;
    this.y = y;
    this.paddleWidth = paddleWidth;
    this.paddleHeight = paddleHeight;
  }
  
  void display(){
    fill(255);
    rectMode(CENTER);
    rect(x, y, paddleWidth, paddleHeight);
  }
  
  void moveWS(){
    if(wKey){
      if(y > 75){
        y -= velocity;
      }
    }
    if(sKey){
      if(y < 725){
        y += velocity;
      }
    }
  }
  
  void moveArrow(){
    if(upKey){
      if(y > 75){
        y -= velocity;
      }
    }
    if(downKey){
      if(y < 725){
        y += velocity;
      }
    }
  }
}
