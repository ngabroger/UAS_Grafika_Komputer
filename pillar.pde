class pillar {
  float xPos, opening;
  boolean cashed = false;

  pillar(int i) {
    xPos = 100 + (i * 200);
    opening = random(600) + 100;
  }

  void drawPillar() {
    pushMatrix(); // Save the current matrix
    scale(1, -1); // Flip vertically
    image(pillarImage, xPos, -opening + 100, 50, opening - 100);
    popMatrix(); // Restore the matrix

    image(pillarImage, xPos, opening + 100, 50, 800 - (opening + 100));
  }

  void checkPosition() {
    if (xPos < 0) {
      xPos += (200 * 3);
      opening = random(600) + 100;
      cashed = false;
    }
    if (xPos < 250 && !cashed) {
      cashed = true;
      score++;
    }
  }
}
