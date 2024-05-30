String scene = "start"; 
int ballX = 400;
int ballY = 1000;
int ballSIZE = 100;
int ballMOVE = 5;
int ballSPEED = 0;
int player1SCORE = 0;
int player2SCORE = 0;
int playerCOUNT = 0;
int pin1 = 220;
int pin2 = 220;
int pin3 = 220;
int pin4 = 220;
int pin5 = 220;
int pin6 = 220;
float wallset = 0;
float pinpercent = 0;
ArrayList<Triangle> triangles;
int spawnInterval = 20;
int frameCount = 0;
int triangleSize = 60;

void setup(){
  size(820, 1080);
  background(50, 50, 50);
  PFont font = createFont("Meiryo", 40);
  textFont(font);
  noStroke();
  triangles = new ArrayList<Triangle>();
}

void draw(){
  if(scene == "start") start_scene();
  else if(scene == "game") game_scene();
  else if(scene == "solo") solo_scene();
  else if(scene == "clear") clear_scene();  
}

void common(){
  background(50, 50, 50);
}

void start_scene(){
  common();  
  fill(255, 255, 255);
  textSize(40);
  text("ボウリングゲーム", width/5, height/4);
  text("PLAY", 260, 540);
  text("SOLO", 260, 740);
  fill(0, 240, 0);
  rect(380, 500, 120, 80);
  fill(0, 240, 240);
  rect(380, 700, 120, 80);
  ballSPEED = 0;
  player1SCORE = 0;
  player2SCORE = 0;
  playerCOUNT = 1;
  pin1 = 220;
  pin2 = 220;
  pin3 = 220;
  pin4 = 220;
  pin5 = 220;
  pin6 = 220;
  ballX = 400;
  ballY = 1000;
  pinpercent = random(0, 100);
  wallset = random(0, 7);
  triangles.clear();
}

void game_scene(){
  background(60, 60, 20);
  fill(255, 255, 255);
  text(playerCOUNT, 20, 60);
  text("Pのばん", 60, 60);
  text("左右キーで移動ｚキーで投げる", 30, 1000);
  rect(400, 0, 1, 1080);
  rect(360, 0, 1, 1080);
  rect(440, 0, 1, 1080);
  rect(320, 0, 1, 1080);
  rect(480, 0, 1, 1080);

  fill(220, 0, 220);
  ellipse(ballX, ballY, ballSIZE, ballSIZE);
  if(left) ballX -= ballMOVE;
  if(right) ballX += ballMOVE;
  if(z) ballSPEED = 10;
  if(ballSPEED == 0){
    if(ballX > 510){ballX -= ballMOVE;}
    if(ballX < 310){ballX += ballMOVE;}
  }

  fill(220, pin1, pin1);
  triangle(400, 160, 380, 240, 420, 240);
  if(ballX <= 420 + ballSIZE/2 && ballX >= 380 - ballSIZE/2 && ballY == 220){
    pin1 = 0;
    if(playerCOUNT == 1){player1SCORE += 1;}
    else if(playerCOUNT == 2){player2SCORE += 1;}
  }
  fill(220, pin2, pin2);
  triangle(360, 80, 340, 160, 380, 160);
  if(ballX <= 380 + ballSIZE/2 && ballX >= 340 - ballSIZE/2 && ballY == 140){
    pin2 = 0;
    if(playerCOUNT == 1){player1SCORE += 1;}
    else if(playerCOUNT == 2){player2SCORE += 1;}
  }
  fill(220, pin3, pin3);
  triangle(440, 80, 420, 160, 460, 160);
  if(ballX <= 460 + ballSIZE/2 && ballX >= 420 - ballSIZE/2 && ballY == 140){
    pin3 = 0;
    if(playerCOUNT == 1){player1SCORE += 1;}
    else if(playerCOUNT == 2){player2SCORE += 1;}
  }
  fill(220, pin4, pin4);
  triangle(320, 0, 300, 80, 340, 80);
  if(ballX <= 340 + ballSIZE/2 && ballX >= 300 - ballSIZE/2 && ballY == 60){
    pin4 = 0;
    if(playerCOUNT == 1){player1SCORE += 1;}
    else if(playerCOUNT == 2){player2SCORE += 1;}
  }
  fill(220, pin5, pin5);
  triangle(400, 0, 380, 80, 420, 80);
  if(ballX <= 420 + ballSIZE/2 && ballX >= 380 - ballSIZE/2 && ballY == 60){
    pin5 = 0;
    if(playerCOUNT == 1){player1SCORE += 1;}
    else if(playerCOUNT == 2){player2SCORE += 1;}
  }
  fill(220, pin6, pin6);
  triangle(480, 0, 460, 80, 500, 80);
  if(ballX <= 500 + ballSIZE/2 && ballX >= 460 - ballSIZE/2 && ballY == 60){
    pin6 = 0;
    if(playerCOUNT == 1){player1SCORE += 1;}
    else if(playerCOUNT == 2){player2SCORE += 1;}
  }
  
  if(wallset >= 1 && wallset < 2){
    fill(20, 20, 20);
    rect(300, 500, 220, 110);
    if(ballX >= 300 - ballSIZE/4 && ballX <= 520 + ballSIZE/4 && ballY >= 500 - ballSIZE/4 && ballY <= 610 + ballSIZE/4)
    {ballY = -40;}
  }
  if(wallset >= 2 && wallset < 3){
    fill(20, 20, 20);
    rect(420, 750, 300, 50);
    if(ballX >= 420 - ballSIZE/4 && ballX <= 720 + ballSIZE/4 && ballY >= 750 - ballMOVE/4 && ballY <= 800 + ballSIZE/4)
    {ballY = -40;}
    fill(20, 20, 20);
    rect(100, 300, 300, 50);
    if(ballX >= 100 - ballSIZE/4 && ballX <= 400 + ballSIZE/4 && ballY >= 300 - ballMOVE/4 && ballY <= 350 + ballSIZE/4)
    {ballY = -40;}
  }
  if(wallset >= 3 && wallset < 4){
    fill(20, 20, 20);
    rect(250, 320, 100, 400);
    if(ballX >= 250 - ballSIZE/4 && ballX <= 350 + ballSIZE/4 && ballY >= 320 - ballMOVE/4 && ballY <= 720 + ballSIZE/4)
    {ballY = -40;}
    fill(20, 20, 20);
    rect(470, 320, 100, 400);
    if(ballX >= 470 - ballSIZE/4 && ballX <= 570 + ballSIZE/4 && ballY >= 320 - ballMOVE/4 && ballY <= 720 + ballSIZE/4)
    {ballY = -40;}
  }
  if(wallset >= 4 && wallset < 5){
    fill(20, 20, 20);
    rect(300, 380, 140, 190);
    if(ballX >= 300 - ballSIZE/4 && ballX <= 440 + ballSIZE/4 && ballY >= 380 - ballSIZE/4 && ballY <= 570 + ballSIZE/4)
    {ballY = -40;}
  }
  if(wallset >= 5 && wallset < 6){
    fill(20, 20, 20);
    rect(430, 280, 200, 180);
    if(ballX >= 430 - ballSIZE/4 && ballX <= 630 + ballSIZE/4 && ballY >= 280 - ballMOVE/4 && ballY <= 460 + ballSIZE/4)
    {ballY = -40;}
    fill(20, 20, 20);
    rect(180, 710, 200, 190);
    if(ballX >= 180 - ballSIZE/4 && ballX <= 380 + ballSIZE/4 && ballY >= 710 - ballMOVE/4 && ballY <= 900 + ballSIZE/4)
    {ballY = -40;}
  }
  if(wallset >= 6){
    fill(20, 20, 20);
    rect(250, 260, 100, 100);
    if(ballX >= 250 - ballSIZE/4 && ballX <= 350 + ballSIZE/4 && ballY >= 260 - ballMOVE/4 && ballY <= 360 + ballSIZE/4)
    {ballY = -40;}
    fill(20, 20, 20);
    rect(450, 260, 100, 100);
    if(ballX >= 450 - ballSIZE/4 && ballX <= 550 + ballSIZE/4 && ballY >= 260 - ballMOVE/4 && ballY <= 360 + ballSIZE/4)
    {ballY = -40;}
    fill(20, 20, 20);
    rect(350, 520, 100, 100);
    if(ballX >= 350 - ballSIZE/4 && ballX <= 450 + ballSIZE/4 && ballY >= 520 - ballMOVE/4 && ballY <= 620 + ballSIZE/4)
    {ballY = -40;}
    fill(20, 20, 20);
    rect(250, 780, 100, 100);
    if(ballX >= 250 - ballSIZE/4 && ballX <= 350 + ballSIZE/4 && ballY >= 780 - ballMOVE/4 && ballY <= 880 + ballSIZE/4)
    {ballY = -40;}
    fill(20, 20, 20);
    rect(450, 780, 100, 100);
    if(ballX >= 450 - ballSIZE/4 && ballX <= 550 + ballSIZE/4 && ballY >= 780 - ballMOVE/4 && ballY <= 880 + ballSIZE/4)
    {ballY = -40;}
  }
  if (ballY == 0) {
    if (pin4 == 220 && pin2 == 0 && pinpercent >= 40){pin4 = 0; if(playerCOUNT == 1){player1SCORE += 1;}
    else if(playerCOUNT == 2){player2SCORE += 1;}}
    if (pin5 == 220 && pin2 == 0 && pin3 == 0 && pinpercent >= 20){pin5 = 0; if(playerCOUNT == 1){player1SCORE += 1;}
    else if(playerCOUNT == 2){player2SCORE += 1;}}
    if (pin6 == 220 && pin3 == 0 && pinpercent >= 40){pin6 = 0; if(playerCOUNT == 1){player1SCORE += 1;}
    else if(playerCOUNT == 2){player2SCORE += 1;}}
  }
  if (ballY == -90){
    if(playerCOUNT == 1){
      ballSPEED = 0;
      player2SCORE = 0;
      playerCOUNT = 2;
      pin1 = 220;
      pin2 = 220;
      pin3 = 220;
      pin4 = 220;
      pin5 = 220;
      pin6 = 220;
      ballX = 400;
      ballY = 1000;
      pinpercent = random(0, 100);
    }
    else if(playerCOUNT == 2){scene = "clear";}
  }
  ballY -= ballSPEED;
}

void solo_scene(){ 
  background(60, 60, 20);
  fill(255, 255, 255);
  rect(400, 0, 1, 1080);
  rect(240, 0, 1, 1080);
  rect(560, 0, 1, 1080);
  rect(320, 0, 1, 1080);
  rect(480, 0, 1, 1080);
  fill(0, 0, 220);
  ellipse(ballX, ballY, ballSIZE, ballSIZE);
  if(left) ballX -= ballMOVE;
  if(right) ballX += ballMOVE;
  if(shift){ballMOVE = 5;}
  else{ballMOVE = 10;}
  if(ballX > 40){ballX -= ballMOVE;}
  if(ballX < 770){ballX += ballMOVE;}

  if (frameCount % spawnInterval == 0) {triangles.add(new Triangle()); player1SCORE++;}
  for (int i = triangles.size() - 1; i >= 0; i--) {
    Triangle t = triangles.get(i);
    t.update();
    t.display();
    if (t.y > height) {triangles.remove(i);}
  }
  for (Triangle t : triangles) {
    if (checkCollision(ballX, ballY, ballSIZE, t.x, t.y, triangleSize)) {
      scene = "clear";
    }
  }
  frameCount++;
}

boolean checkCollision(float bx, float by, float bsize, float tx, float ty, float tsize) {
  float radius = bsize / 2;
  PVector p1 = new PVector(tx, ty + tsize); 
  PVector p2 = new PVector(tx - tsize / 2, ty); 
  PVector p3 = new PVector(tx + tsize / 2, ty); 
  PVector ballCenter = new PVector(bx, by);

  if (ballCenter.dist(p1) < radius || ballCenter.dist(p2) < radius || ballCenter.dist(p3) < radius) {
    return true;
  }
  return false;
}

void clear_scene(){
  common(); 
  fill(255, 255, 255);
  text("Finish!", width/5, height/4);
  text("クリックで最初に戻る", 160, 540);
  text(player1SCORE, 720, 60);
  if(playerCOUNT == 2){
    text("スコア1P", 540, 60);
    text(player2SCORE, 720, 120);
    text("スコア2P", 540, 120);
    if(player1SCORE >= player2SCORE){fill(0, 255, 0); text("1Pの勝利!", 180, 460);}
    else if(player1SCORE < player2SCORE){fill(0, 255, 0); text("2Pの勝利!", 180, 460);}
  }
}

void mousePressed(){
  if(scene == "start"){
    if (get(mouseX, mouseY) == color(0, 240, 0)){scene = "game";}
    else if (get(mouseX, mouseY) == color(0, 240, 240)) {scene = "solo";}
  }
  else if(scene == "clear") scene = "start";
}

class Triangle {
  float x, y, speed;

  Triangle() {
    x = random(width);
    y = -triangleSize;
    speed = random(4, 8);
  }

  void update() {y += speed;}

  void display() {
    fill(220, 220, 220);
    noStroke();
    triangle(x, y, x - triangleSize / 2, y + triangleSize, x + triangleSize / 2, y + triangleSize);
  }
}

boolean left, right, shift, z;
void keyPressed(){
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
  if (keyCode == SHIFT) shift = true;
  if (key == 'z') z = true;
}
void keyReleased() {
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
  if (keyCode == SHIFT) shift = false;
  if (key == 'z') z = false;
}