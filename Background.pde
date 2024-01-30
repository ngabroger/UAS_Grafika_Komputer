// Membuat class untuk background
class Background {
  PImage backgroundImage;
  
  Background(String imagePath){
    backgroundImage = loadImage(imagePath);
  }
  
  void draw() {
    image(backgroundImage, 0, 0, width, height);
  }
}


// Membuat class untuk background 2
class Background2 {
  PImage backgroundImage;
  
  Background2(String imagePath){
    backgroundImage = loadImage(imagePath);
  }
  
  void draw() {
    image(backgroundImage, 0, 0, width, height);
  }
}
