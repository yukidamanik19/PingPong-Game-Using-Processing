import processing.video.*; 
import processing.sound.*;

int jumball = 40;
int startTime, phase = 0, once = 0;
PFont start, title, again, press; 
Garnish [] balls = new Garnish[jumball];
Paddle left = new Paddle(100, 400, 30, 150);
Paddle right = new Paddle(900, 400, 30, 150);
Ball ball = new Ball(500, 400, 30, 30);
Garnish score = new Garnish();
Garnish count = new Garnish();
Garnish check = new Garnish();

SoundFile ding, paddle, wall, menu;
Movie myMovie;
boolean wKey, sKey, upKey, downKey, enterKey = false, enterPressed = false, GameOver = false;

void setup(){
  size(1000,800);
  frameRate(60);
  
  ding = new SoundFile(this, "C:/Users/yukid/OneDrive/Documents/Processing/ProjectPingpong/ding.mp3");
  paddle = new SoundFile(this, "C:/Users/yukid/OneDrive/Documents/Processing/ProjectPingpong/paddle.MP3");
  wall = new SoundFile(this, "C:/Users/yukid/OneDrive/Documents/Processing/ProjectPingpong/wall.MP3");
  menu = new SoundFile(this, "C:/Users/yukid/OneDrive/Documents/Processing/ProjectPingpong/theme.MP3");

  //myMovie = new Movie(this, "C:/Users/yukid/OneDrive/Documents/Processing/ProjectPingpong/Background.mp4");
  //myMovie.loop();
  
    for(int i=0; i<jumball; i++){
    balls[i]= new Garnish();
    balls[i].SetData(int(random(0,1000)),int(random(0, 800)),30,color(255));         
  }
}

void draw(){
  background(0);
  //image(myMovie, 0, 0, 1000, 800);
  //myMovie.read();
  
  if (enterKey == true) {
    
    count.ready();
    
    if (phase == 2) {
      
      fill(255,0,0);
      rect(500,0,2,width*2);
      left.display();
      right.display();
      ball.display();
      score.updatescore();
      
      left.moveWS();
      right.moveArrow();
      ball.move();
    
      ball.collision();
      check.gameover();
      
    } else if (phase ==3) {
      if (ball.scoreleft == 10) {
        again = createFont("Arial", 60);
        fill(255,0,0);
        textFont(again);
        text("Left Win!!", 500 , 380);
      } else {
        again = createFont("Arial", 60);
        fill(255,0,0);
        textFont(again);
        text("Right Win!!", 500 , 380);
      }
      press = createFont("Arial", 35);
      fill(255,0,0);
      textFont(press);
      text("Tekan 'Enter' untuk bermain lagi", 500 , 450);
   }  
     
   } else {
    
    if (once == 0 ) {
      menu.play();
      menu.loop();
      once = 1;
    }
     
    for(int i=0; i<jumball; i++){ 
    balls[i].show(); 
    balls[i].move2();
    }
    title = createFont("Arial", 60);
    fill(255,0,0);
    textFont(title);
    text("Pong-Game!!", 300, 200);
    start = createFont("Arial", 45);
    fill(255,0,0);
    textFont(start);
    text("Please 'ENTER' to start the game...", 150, 450);
   
   }
}

void keyPressed(){
  if(key == 'w' || key == 'W'){
    wKey = true;
  }
  if(key == 's' || key == 'S'){
    sKey = true;
  }
  if(keyCode == UP){
    upKey = true;
  }
  if(keyCode == DOWN){
    downKey = true;
  }
  if(keyCode == ENTER && !enterPressed){
    enterKey = true;
    startTime = millis();
    enterPressed = true;
    menu.pause();
  } if(keyCode == ENTER && GameOver == true){
    phase = 0;
    enterKey = true;
    startTime = millis();
    enterPressed = true;
    menu.pause();
    ball.scoreleft=0;
    ball.scoreright=0;
    for(int i=0; i<jumball; i++){
    balls[i]= new Garnish();
    balls[i].SetData(int(random(0,1000)),int(random(0, 800)),30,color(255));         
  }
  } 
}

void keyReleased(){
  if(key == 'w' || key == 'W'){
    wKey = false;
  }
  if(key == 's' || key == 'S'){
    sKey = false;
  }
  if(keyCode == UP){
    upKey = false;
  }
  if(keyCode == DOWN){
    downKey = false;
  }
}
