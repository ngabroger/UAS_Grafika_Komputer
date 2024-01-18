bird b = new bird();
pillar[] p = new pillar[3];
PImage[] frames = new PImage[4];
PImage pillarImage;

Background background;
Cloud[] clouds = new Cloud[3];

boolean end = false;
boolean intro = true;
int currentFrame = 0;
int lastFrameTime = 0;
int frameDelay = 50;
int score = 0;
PFont Font;
PFont Score;

void setup() {
  size(500, 800);
  frameRate(60);
  background = new Background("assets/background/bg(1).png");
  
  Font = createFont("assets/font/FlappyBird.ttf", 48);
  Score = createFont("assets/font/flappy-bird-font.ttf", 28);
  
  for (int i = 0; i < frames.length; i++) {
    frames[i] = loadImage("assets/bird/frame-" + (i + 1) + ".png");
  }
  pillarImage = loadImage("assets/pillar/pillar_flappybird.png");  // Load the pillar image
    
    for (int i = 0; i < clouds.length; i++) {
      clouds[i] = new Cloud("assets.cloud/cloud.png", random(width), random(height), random(50, 100)); //Load cloud image      
    }
    
  for (int i = 0; i < 3; i++) {
    p[i] = new pillar(i);
    
  }
}

void draw() {
  background.draw();
   //background(135, 206, 250);

  
// Gambar awan
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].update();
    clouds[i].draw();
  }
  
  if (end) {
    b.move();
  }
  b.drawBird();
  if (end) {
    b.drag();
  }
  b.checkCollisions();
  for (int i = 0; i < 3; i++) {
    p[i].drawPillar();
    p[i].checkPosition();
  }
  fill(0);
  stroke(255);
  textSize(32);
  if (end) {
    rect(20, 20, 100, 50);
    fill(255);
    textFont(Score);
    text(score, 30, 58);
  } else {
    rect(150, 100, 200, 50);
    rect(150, 200, 200, 50);
    fill(255);
    if (intro) {
      textFont(Font);
      text("Flappy Bird", 175, 140);
      text("Click to Play", 170, 240);
    } else {
      textFont(Font);
      text("GAME OVER", 180, 140);
      text("Score", 185, 240);
      textFont(Score);
      text(score, 285, 240);
    }
  }
}

void reset() {
  end = true;
  score = 0;
  b.yPos = 400;
  for (int i = 0; i < 3; i++) {
    p[i].xPos += 550;
    p[i].cashed = false;
  }
}

void mousePressed() {
  b.jump();
  intro = false;
  if (end == false) {
    reset();
  }
}

void keyPressed() {
  b.jump();
  intro = false;
  if (end == false) {
    reset();
  }
}
