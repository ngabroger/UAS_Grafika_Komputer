// bird.pde
class bird {
  float xPos, yPos, ySpeed;
  
  int currentFrame = 0;
  boolean hitSoundPlayed = false;
  boolean punchSoundPlayed = false;

  bird() {
    xPos = 250;
    yPos = 400;

     
    // Load bird animation (GIF) in the constructor
    
  }

  void drawBird() {
   if (millis() - lastFrameTime > frameDelay) {
      // Move to the next frame (loop back to the first frame if at the end)
      currentFrame = (currentFrame + 1) % frames.length;

      // Update the last frame time
      lastFrameTime = millis();
    }

    // Display the current frame
    image(frames[currentFrame], xPos - 20, yPos - 20, 40, 40);
  }
  
  void jump() {
    ySpeed = -10;
  }

  void drag() {

    ySpeed += 0.5;

  }

  void move() {
    yPos += ySpeed;
    for (int i = 0; i < 3; i++) {
      p[i].xPos -= 3;
    }
  }
  
  // Mengecek benturan
  void checkCollisions() {
    if (!end) {
      // Pemeriksaan jika belum mati
      hitSoundPlayed = false;
      punchSoundPlayed = false;
      return;
    }
  
    if (yPos > 800 && !hitSoundPlayed) {
      end = false;
      hitSound.trigger();
      hitSoundPlayed = true;
    }
  
    // Loop untuk memeriksa tabrakan dengan setiap tiang
    for (int i = 0; i < 3; i++) {
      if (!hitSoundPlayed && (xPos + 20 > p[i].xPos && xPos - 20 < p[i].xPos + 50) && (yPos + 20 < p[i].opening - 100 || yPos - 20 > p[i].opening + 100)) {
        end = false;
      }
  
      // Check collision for the second sound
      if (!punchSoundPlayed && (xPos + 20 > p[i].xPos && xPos - 20 < p[i].xPos + 50) && (yPos + 20 < p[i].opening - 100 || yPos - 20 > p[i].opening + 100)) {
        end = false;
        punchSound.trigger();
        punchSoundPlayed = true; // Set variabel menjadi true setelah suara kedua diputar
      }
  }
}
}
