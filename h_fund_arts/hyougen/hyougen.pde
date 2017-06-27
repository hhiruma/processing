Ball[] balls;
String lin;
String lines[];
int ln;

float xAx, yAx, zAx;
float radH, radV, radS;
float cam;

void setup() {
  size(600, 600, P3D);
  frameRate(30);
  background(255);
  //default settins ----
  noFill();
  stroke(0);
  //---------

  //load data------
  ln = 0;
  lines = loadStrings("data.txt");
  balls = new Ball[lines.length];
  for (int i = 0; i<balls.length; i++) {
    String[] co = split(lines[i], ",");
    balls[i] = new Ball(float(co[0])-300, float(co[1])-300, float(co[2])/2);
  }
  //---------


  xAx = 600; 
  yAx = 600; 
  zAx = 600;
  radH = 0; 
  radV = 0; 
  radS = 0;
  cam = zAx;
}

void draw() {
  background(0);
  translate(xAx, yAx, zAx);

  if (keyPressed) {

    if (key == 'x') {
      radH -= 2;
    } else if (key == 'z') {
      radH += 2;
    } else if (key == 's') {
      radV -= 2;
    } else if (key == 'a') {
      radV += 2;
    } else if (key == 'w') {
      radS -= 2;
    } else if (key == 'q') {
      radS += 2;
    } else if (key == 'c') {
      cam -= 5;
    } else if (key == 'd') {
      cam += 5;
    }
  }

  setCamera();
  //drawAxis();

  pointLight(255, 255, 255, 0, 0, zAx);
  pointLight(255, 255, 255, 0, 0, -zAx);
  pointLight(255, 0, 0, 0, yAx, 0);
  pointLight(0, 0, 255, 0, -yAx, 0);
  pointLight(243, 247, 30, -xAx, 0, 0);
  pointLight(0, 255, 0, xAx, 0, 0);

  for (int i = 0; i<balls.length; i++) {
    balls[i].disp();
  }
}

void setCamera() {
  beginCamera();
  translate(xAx, yAx, zAx);
  camera(0, 0, cam, 0, 0, 0, 0, 1, 0);
  rotateX(radians(radV));
  rotateY(radians(radH));
  rotateZ(radians(radS));
  endCamera();
}

void drawAxis() {
  textSize(10);
  stroke(255, 0, 0);
  fill(255, 0, 0);
  line(-xAx, 0, 0, xAx, 0, 0);
  for (int i = (int)-xAx; i <= xAx; i += 50) {
    text(i, i, -5, 0);
  }

  stroke(0, 0, 255);
  fill(0, 0, 255);
  line(0, -yAx, 0, 0, yAx, 0);
  for (int i = (int)-yAx; i <= yAx; i += 50) {
    text(i, 5, i, 0);
  }

  stroke(0, 255, 0);
  fill(0, 255, 0);
  line(0, 0, -zAx, 0, 0, zAx);
  for (int i = (int)-zAx; i <= zAx; i += 50) {
    //text(i, 0, 5, i);
  }
  stroke(0);


  fill(200);
  box(xAx*2 + 100);
  noFill();
}
/*
void keyTyped(){
 if(key == 'x'){
 radH -= 5;
 } else if(key == 'z'){
 radH +=5;
 } else if(key == 's'){
 radV -= 5;
 } else if(key == 'a'){
 radV += 5;
 } else if(key == 'w'){
 radS -= 5;
 } else if(key == 'q'){
 radS += 5;
 } else if(key == 'c'){
 cam -= 20;
 } else if(key == 'd'){
 cam += 20;
 }
 }
 */