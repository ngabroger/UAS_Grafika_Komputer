class Cloud {
  PImage cloudImage; 
  float x, y, size;
  float speed = 0.5;
  
  Cloud(String imagePath, float x, float y, float size){
    cloudImage = loadImage("assets/cloud/cloud.png");
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  void update() {
    x += speed;
    if (x>width){
      x -= size;
      y = random(50, 100);
    }
  }
  
  void draw() {
    image(cloudImage, x, y, size, size);
  }
}
