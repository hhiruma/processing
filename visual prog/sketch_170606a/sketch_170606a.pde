int numSpots = 20;
Spot[] spots = new Spot[numSpots];

void setup(){
  size(400, 400);
  smooth();
  noStroke();
  
  for(int i = 0; i < spots.length; i++){
    float x = 10 + i * 20;
    float rate = 2.0 + i * 0.1;
    color c = color(
    spots[i] = new Spot(x, 50, 16, rate);
  }
}

void draw(){
  fill(0, 12);
  rect(0, 0, width, height);
  for (int i = 0; i < spots.length ; i++){
    spots[i].move();
    spots[i].display();
  }
}

class Spot{
  float x, y, diameter, speed;
  int direction = 1;
  Spot(float _x, float _y, float _diameter, float _speed){
    x = _x;
    y = _y;
    diameter = _diameter;
    speed = _speed;
  }
  
  void move(){ 
    y += (speed * direction);
    if ((y > (height - diameter/2)) || (y<diameter/2)){
      direction *= 1;
    }
  }
  
  void display(){
    fill(255);
    ellipse(x, y, diameter, diameter);
  }
}