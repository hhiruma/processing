PImage myPhoto;

void setup(){
  size(1920, 1200);
  colorMode(RGB);
  myPhoto = loadImage("suica2.jpg");
}

void draw(){
  image(myPhoto, 0, 0);
  loadPixel();
  int x = mouseX;
  int y = mouseY;
  fill(pixels[y*width+x]);
  noStroke();
  rect(20, 20, 60, 60);
  
  color myPhotoColro
}