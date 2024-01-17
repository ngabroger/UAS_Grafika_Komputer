// pillar.pde
class pillar {
  float xPos, opening;
  boolean cashed = false;

  pillar(int i) {
    xPos = 100 + (i * 200);
    opening = random(600) + 100;
  }
  void drawPillar() {
    line(xPos, 0, xPos, opening - 100);
    line(xPos, opening + 100, xPos, 800);
  }
 
