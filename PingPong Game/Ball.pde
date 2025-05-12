class Ball {
  float x, y;
  int scoreleft=0, scoreright=0;
  float xVel = 5, yVel = 5;
  float initialX, initialY;
  int ballWidth;
  int ballHeight;
  float angle, max_bounce=45, min_bounce=315;
  float ballspeed = 15;
  
  Ball(float initialX, float initialY, int ballWidth, int ballHeight){
    this.initialX = initialX;
    this.initialY = initialY;
    this.ballWidth = ballWidth;
    this.ballHeight = ballHeight;
    x = initialX;
    y = initialY;
  }
  
  void display(){
    noStroke();
    fill(255);
    ellipseMode(CENTER);
    ellipse(x, y, ballWidth, ballHeight);
 }
  
  void move(){
    x += xVel;
    y += yVel;
    
    if(x >= width - ballWidth/2) {
      scoreleft++;
      ding.play();
      x = width/2;
      y = height/2;
      yVel = int(random(-10,10));
      xVel = 7;
      ballspeed = 15;
    }
    if( x <= ballWidth/2){
      scoreright++;
      ding.play();
      x = width/2;
      y = height/2;
      yVel = int(random(-10,10));
      xVel = -7;
      ballspeed = 15;
    }
    if(y >= height - ballHeight/2) {
      yVel*=-1;
      y-=1;
      wall.play();
    }
    else if (y <= ballHeight/2 ){
      yVel *= -1;
      y+=1;
      wall.play();
    }
  }
  
 void collision() {
    // collision with left paddle
    if ((x - ballWidth / 2 <= left.x + left.paddleWidth / 2) && (x - ballWidth / 2 >= left.x - left.paddleWidth / 2) && (y >= left.y - left.paddleHeight / 2) && (y <= left.y + left.paddleHeight / 2)) {
      float relativeIntersectY = (left.y - y);
      float normalizedRelativeIntersectionY = (relativeIntersectY / (left.paddleHeight / 2));
      float bounceAngle = radians(max_bounce * normalizedRelativeIntersectionY);
      xVel = ballspeed * cos(bounceAngle);
      yVel = ballspeed * -sin(bounceAngle);
      ballspeed+=0.1;
      paddle.play();
    }
    // collision with right paddle
    else if ((x + ballWidth / 2 >= right.x - right.paddleWidth / 2) && (x + ballWidth / 2 <= right.x + right.paddleWidth / 2) && (y >= right.y - right.paddleHeight / 2) && (y <= right.y + right.paddleHeight / 2)) {
      float relativeIntersectY = (right.y - y);
      float normalizedRelativeIntersectionY = (relativeIntersectY / (right.paddleHeight / 2));
      float bounceAngle = radians(max_bounce* normalizedRelativeIntersectionY);
      xVel = -ballspeed * cos(bounceAngle);
      yVel = ballspeed * -sin(bounceAngle);
      ballspeed+=0.1;
      paddle.play();
    }
   
  }
}
