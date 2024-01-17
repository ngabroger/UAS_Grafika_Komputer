bird b = new bird();
pillar[] p = new pillar[3];
PImage[] frames = new PImage[4];
PImage pillarImage;

boolean end = false;
boolean intro = true;
int currentFrame = 0;
int lastFrameTime = 0;
int frameDelay = 50;
int score = 0;

void setup() {
  size(500, 800);
  for (int i = 0; i < frames.length; i++) {
    frames[i] = loadImage("bird/frame-" + (i + 1) + ".png");
  }
  pillarImage = loadImage("pillar/pillar_fluppybird.png");  // Load the pillar image
  for (int i = 0; i < 3; i++) {
    p[i] = new pillar(i);
  }
}

void draw() {
  background(0);
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
    text(score, 30, 58);
  } else {
    rect(150, 100, 200, 50);
    rect(150, 200, 200, 50);
    fill(255);
    if (intro) {
      text("Flappy Bird", 155, 140);
      text("Click to Play", 155, 240);
    } else {
      text("Game Over", 170, 140);
      text("Score", 180, 240);
      text(score, 280, 240);
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
