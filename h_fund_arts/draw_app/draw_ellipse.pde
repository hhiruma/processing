class draw_ellipse {
  int id;
  float x1, y1, x2, y2;
  float r;
  int status;
  /*
  status:
   0: selected
   1: drawing
   2: end drawing
   3: save
   4: retry selected
   */

  draw_ellipse(int _id) {
    id = _id;
    status = 0;
  }

  void drawing() {
    float rX, rY;
    rX = x1 - mouseX;
    rY = y1 - mouseY;
    r = abs(rX)>abs(rY)?abs(rX):abs(rY);
    
    
    if(rX >= 0){
      x2 = x1 - r;
      if(rY >= 0) y2 = y1 - r;
      else y2 = y1 + r;
    } else {
      x2 = x1 + r;
      if (rY >= 0) y2 = y1 - r;
      else y2 = y1 + r;
    }
    
    fill(255, 255, 255, 50);
    ellipse(x1, y1, x2, y2);
  }
  void disp() {
    if (status == 2)
      fill(200, 0, 0, 80);
    else
      fill(255);
    if (status != 4)
      ellipse(x1, y1, x2, y2);
  }
  
  void print_coord(PrintWriter f){
    f.printf("%f, %f, %f", (x1+x2)/2, (y1+y2)/2, r);
    f.println();
  }
}