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

Background2 background2;
Background background;
Cloud[] clouds = new Cloud[3];

boolean end = false;
boolean intro = true;
boolean waitingForReset = false;
int resetTime;
int currentFrame = 0;
int lastFrameTime = 0;
int frameDelay = 50;
int score = 0;
PFont Font;
PFont Score;

//Rumput
float grassHeight = 75; // Tinggi rumput
float grassWaveFrequency = 0.05; // Frekuensi gelombang rumput
float grassWaveAmplitude = 10; // Amplitudo gelombang rumput

void setup() {
  size(500, 800);

  background2 = new Background2("assets/background/bg-flappy-intro.png");
  background = new Background("assets/background/bg(1).png");
  Font = createFont("assets/font/FlappyBirdReguler2.ttf", 35);
  Score = createFont("assets/font/FlappyBird-Score.ttf", 28);
  


  // Load bird frames
  for (int i = 0; i < frames.length; i++) {
    frames[i] = loadImage("assets/bird/frame-" + (i + 1) + ".png");
  }

  // Load bird frames
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

  //Rumput (Code Gelombang Statis)
  fill(50, 205, 50); // Warna hijau untuk rumput

  // //Gambar gelombang rumput
  beginShape();
  for (float x = 0; x <= width; x += 5) {
    float y = height - grassHeight + sin(x * grassWaveFrequency) * grassWaveAmplitude;
    vertex(x, y);
  }
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);

 //Rumput di bagian bawah (code)
  fill(150, 75, 0); // Warna hijau untuk rumput
  rect(0, height - 50, width, 50); // Gambar segmen rumput
  
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
  
  // Mengatur warna isian dan garis, ukuran teks, dan atribut lainnya
  fill(255, 133, 18);
  stroke(255);
  textSize(32);
  
  // Jika permainan berakhir, tampilkan skor
  if (end) {
    rect(20, 20, 55, 50);
    fill(255);
    textFont(Score);
    text(score, 30, 58);
  } else {
    // Menampilkan layar intro atau layar game over
    rect(150, 100, 200, 50);
    rect(150, 200, 200, 50);
    fill(255);
    
    if (intro) {
      background2.draw();
      b.drawBird();
      textFont(Font);
      fill(255, 133, 18);
      drawTextWithShadow("Flappy Bird", 167, 250, 3);
      drawTextWithShadow("Click to Play", 155, 300, 3);
      // Menggambar awan pada layar intro
      for (int i = 0; i < clouds.length; i++) {
        clouds[i].update();
        clouds[i].draw();
      }

    } else {
      textFont(Font);
      text("GAME OVER", 175, 135);
      text("Score:", 185, 236);
      textFont(Score);
      text(score, 292, 237);
    }
  }
  
  // Jika permainan berakhir dan menunggu reset
  if (end && waitingForReset) {
    int currentTime = millis();

    // Tunggu selama 3 detik sebelum mereset permainan
    if (currentTime - resetTime >= 3000) {
      reset();
      waitingForReset = false;
    }
  }
}


// Fungsi untuk menampilkan teks dengan bayangan
void drawTextWithShadow(String text, float x, float y, float shadowOffset) {
  fill(255); // Warna bayangan hitam
  textSize(32);
  text(text, x + shadowOffset, y + shadowOffset);
  fill(255, 133, 18); // Warna teks asli
  text(text, x, y);
}

// Fungsi untuk mereset permainan
void reset() {
  // Setel status permainan menjadi berakhir dan reset nilai
  end = true;
  score = 0;
  b.yPos = 400;
  
  // Pindahkan tiang ke posisi awal
  for (int i = 0; i < 3; i++) {
    p[i].xPos += 550;
    p[i].cashed = false;
  }
}

// Fungsi yang dipanggil ketika burung mati
void birdDied() {
  hitSound.trigger();
  punchSound.trigger();
  waitingForReset = true;
  resetTime = millis();
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
    birdDied();
  }
}

void stop() {
  // Stop Minim when the application is stopped
  minim.stop();
  super.stop();
}
