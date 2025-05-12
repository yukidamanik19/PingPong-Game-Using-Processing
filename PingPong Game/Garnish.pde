class Garnish {
  PVector pos;
  int delayTime = 1000; 
  int currentCount = 0; 
  int tinggi;
  PFont desc;
  color warna;
  int velocity = 3, velballX = int(random(4,10)), velballY = int(random(4,10));
  int x = 0, y=0;
  PFont titikdua, kiri, kanan;
  
  Garnish() {
    pos = new PVector();
  }
  
  void SetData(int px,int py, int ptinggi, color pc){
    pos.x=px; 
    pos.y=py; 
    tinggi=ptinggi;
    warna=pc;
  }
  void ready() {
    if (enterPressed) {
       int elapsedTime = millis() - startTime;
      
       if (phase == 0 && elapsedTime < delayTime) {
         displayText("Ready");
         
       } else if (elapsedTime < delayTime * 3) {
          desc = createFont("Arial", 35);
          fill(255,0,0);
          textFont(desc);
          text("Capai 10 skor pertama untuk memperoleh kemenangan", 500 , 380);
         
       } else if (elapsedTime < delayTime * 6) {
          currentCount = int((elapsedTime - delayTime) / delayTime) -1 ;
          fill(255,0,0);
          rect(500,0,2,width*2);
          displayText(str(currentCount));
          left.display();
          right.display();
          ball.display();
          score.updatescore();
      
      left.moveWS();
      right.moveArrow();
          
      } else if (elapsedTime <= delayTime * 7) {
        phase = 2;
      }
    }
 }
 
   void displayText(String displayString) {
    fill(255);
    textSize(60);
    textAlign(CENTER, CENTER);
    text(displayString, width / 2, height / 2 - 100);
}
  
  void show(){
    fill(warna);
    ellipse(pos.x, pos.y,tinggi,tinggi);
  }
  
  void updatescore(){
    kiri = createFont("Arial", 60);
    fill(255);
    textFont(kiri);
    text(ball.scoreleft, 435, 80);
    
    kanan = createFont("Arial", 60);
    fill(255);
    textFont(kanan);
    text(ball.scoreright, 550, 80);
  }
  
  void move2() {
    pos.x += velballX;
    pos.y += velballY;
    if (pos.x < 0 || pos.x > width)
    {
      if (velballX < 0)
      {
        velballX = int(random(4,10));
        
      } else velballX = int(random(-10,-4));
        
    } 
    if (pos.y < 0 || pos.y > height)
    {
      if (velballY < 0)
      {
        velballY = int(random(1,10));
      } else velballY = int(random(-10,-1));
      
      
    }
  }
  
  void gameover() {
    if (ball.scoreleft == 10 || ball.scoreright== 10) {
      phase=3;
      GameOver = true;
    }
  }
  
}
