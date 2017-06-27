PrintWriter outfile;
PImage img;
int id = 0;
draw_ellipse[] balls = new draw_ellipse[1000];

void setup() {
  size(600, 600);
  background(255);
  ellipseMode(CORNERS);
  colorMode(RGB, 255, 255, 255, 100);
  stroke(0, 255, 255);
  
  outfile = createWriter("coords.txt");
  img = loadImage("apple_icon.png");
  
  for (int i = 0; i<balls.length; i++) {
    balls[i] = new draw_ellipse(i);
  }
}

void draw() {
  background(255);
  image(img, 0, 0, width, height);
  
  if (balls[id].status == 1) {
    balls[id].drawing();
  }

  for (int i = 0; i<=id; i++) {
    balls[i].disp();
  }
}

void mousePressed() {
  if (balls[id].status == 0 || balls[id].status == 4) {
    balls[id].status = 1;
    balls[id].x1 = mouseX;
    balls[id].y1 = mouseY;
  }
}

void mouseReleased() {
  if (balls[id].status == 1) {
    balls[id].status = 2;
  }
}

void keyTyped(){
  if (key == 's'){
    // save
    balls[id].status = 3;
    id++;
  } else if (key == 'x'){
    // undo
    balls[id].status = 4;
  } else if (key == 'p'){
    //print
    printCoords();
    println("printed coords");
  }
}

void printCoords(){
  for(int i = 0; i<id; i++){
    balls[i].print_coord(outfile);
  }
  outfile.flush();
  outfile.close();
}