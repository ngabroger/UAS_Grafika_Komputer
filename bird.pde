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
