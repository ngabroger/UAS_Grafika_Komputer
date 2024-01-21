class Cloud {
  PImage cloudImage; 
  float x, y, size;
  float speed = 0.5;
  
  Cloud(String imagePath, float x, float y, float size){
    cloudImage = loadImage("assets/cloud/cloud.png");
    this.x = x;
    this.y = 100;
    this.size = size;
  }
  
  void update() {
    x -= speed; // Menggulir awan ke kiri
    if (x + size < 0){ // Memulai kembali dari sisi kanan jika mencapai batas kiri
      x = width;
      y = random(50, 100);
    }
  }
  
  void draw() {
    image(cloudImage, x, y, size, size);
  }
}
