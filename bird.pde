// bird.pde
class bird {
  float xPos, yPos, ySpeed;
  
  int currentFrame = 0;

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
    ySpeed += 0.4;
  }

  void move() {
    yPos += ySpeed;
    for (int i = 0; i < 3; i++) {
      p[i].xPos -= 3;
    }
  }

  void checkCollisions() {
    if (yPos > 800) {
      end = false;
    }
    for (int i = 0; i < 3; i++) {
      if ((xPos < p[i].xPos + 10 && xPos > p[i].xPos - 10) && (yPos < p[i].opening - 100 || yPos > p[i].opening + 100)) {
        end = false;
      }
    }
  }
}
