import ddf.minim.*;

Minim minim;
AudioSample hitSound;
AudioSample pointSound;
AudioSample wooshSound;
AudioSample punchSound;

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

//Rumput
float grassHeight = 50; // Tinggi rumput
float grassWaveFrequency = 0.05; // Frekuensi gelombang rumput
float grassWaveAmplitude = 10; // Amplitudo gelombang rumput

void setup() {
  size(500, 800);

  
  background = new Background("assets/background/bg(1).png");
  Font = createFont("assets/font/FlappyBird.ttf", 48);
  Score = createFont("assets/font/FlappyBird-Score.ttf", 28);
  


  // Load bird frames
  for (int i = 0; i < frames.length; i++) {
    frames[i] = loadImage("assets/bird/frame-" + (i + 1) + ".png");
  }

    
    for (int i = 0; i < clouds.length; i++) {
      clouds[i] = new Cloud("assets.cloud/cloud.png", random(width), random(height), random(50, 100)); //Load cloud image      
    }
    
  
  // Load the pillar image
  pillarImage = loadImage("assets/pillar/pillar_flappybird.png");

  // Initialize Minim and load sound files
  minim = new Minim(this);
  punchSound = minim.loadSample("assets/sound/sfx_punch.wav");
  hitSound = minim.loadSample("assets/sound/sfx_die.wav");
  pointSound = minim.loadSample("assets/sound/sfx_point.wav");
  wooshSound = minim.loadSample("assets/sound/sfx_woosh.wav");

  // Initialize pillars
  for (int i = 0; i < 3; i++) {
    p[i] = new pillar(i);
    
  }
}

void draw() {
  //background.draw();
   background(135, 206, 250);

//Rumput (Code Statis)
   fill(50, 205, 50); // Warna hijau untuk rumput

  // Gambar gelombang rumput
  beginShape();
  for (float x = 0; x < width; x += 5) {
    float y = height - grassHeight + sin(x * grassWaveFrequency) * grassWaveAmplitude;
    vertex(x, y);
  }
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);

//Rumput (Code Gerak)
  //drawGrass();

 //Rumput di bagian bawah (code)
  //fill(50, 205, 50); // Warna hijau untuk rumput
  //rect(0, height - 50, width, 50); // Gambar segmen rumput
  
// Gambar awan
  for (int i = 0; i < clouds.length; i++) {
    clouds[i].update();
    clouds[i].draw();
  }
  
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
  
  fill(222, 133, 18);
  stroke(255);
  textSize(32);
  
  // If the game is over, display the score
  if (end) {
    rect(20, 20, 55, 50);
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

//void drawGrass() {
//  // Set grass color
//  fill(50, 205, 55);

//  // Set the amplitude and frequency of the waves
//  float amplitude = 25;
//  float frequency = 0.025;

//  // Draw grass waves
//  for (int y = height - 25; y < height; y += 5) { 
//    beginShape();
//    for (float x = 0; x <= width; x += 5) {
//      float wave = amplitude * sin(frequency * x + millis() * 0.001);
//      vertex(x, y + wave);
//    }
//    endShape();
//  }
//}

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
