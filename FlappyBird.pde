import ddf.minim.*;

Minim minim;
AudioSample hitSound;
AudioSample pointSound;
AudioSample wooshSound;

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
PFont Font;
PFont Score;

void setup() {
  size(500, 800);

  Font = createFont("assets/font/FlappyBird.ttf", 48);
  Score = createFont("assets/font/flappy-bird-font.ttf", 28);
  


  // Load bird frames
  for (int i = 0; i < frames.length; i++) {
    frames[i] = loadImage("assets/bird/frame-" + (i + 1) + ".png");
  }
  
  // Load the pillar image
  pillarImage = loadImage("assets/pillar/pillar_flappybird.png");

  // Initialize Minim and load sound files
  minim = new Minim(this);
  hitSound = minim.loadSample("assets/sound/sfx_die.wav");
  pointSound = minim.loadSample("assets/sound/sfx_point.wav");
  wooshSound = minim.loadSample("assets/sound/sfx_woosh.wav");

  // Initialize pillars
  for (int i = 0; i < 3; i++) {
    p[i] = new pillar(i);
  }
}

void draw() {
  background(0);
  
  // If the game is over, move the bird and allow dragging
  if (end) {
    b.move();
  }
  
  // Draw the bird
  b.drawBird();
  
  // If the game is over, allow dragging
  if (end) {
    b.drag();
  }
  
  // Check for collisions with pillars
  b.checkCollisions();
  
  // Draw and check position of pillars
  for (int i = 0; i < 3; i++) {
    p[i].drawPillar();
    p[i].checkPosition();
  }
  
  fill(0);
  stroke(255);
  textSize(32);
  
  // If the game is over, display the score
  if (end) {
    rect(20, 20, 100, 50);
    fill(255);
    textFont(Score);
    text(score, 30, 58);
  } else {
    // Display intro screen or game over screen
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
  // Set the game state to over and reset values
  end = true;
  score = 0;
  b.yPos = 400;
  
  // Move pillars to initial position and reset cashed status
  for (int i = 0; i < 3; i++) {
    p[i].xPos += 550;
    p[i].cashed = false;
  }
}

void mousePressed() {
  // Trigger bird jump and set intro to false
  b.jump();
  intro = false;
  
  // If the game is not over, reset the game
  if (!end) {
    reset();
  }
  
  wooshSound.trigger();
}

void keyPressed() {
  // Trigger bird jump and set intro to false
  b.jump();
  intro = false;
  
  // If the game is not over, reset the game
  if (!end) {
    reset();
  }
}

void stop() {
  // Stop Minim when the application is stopped
  minim.stop();
  super.stop();
}
