int id;
draw_ellipse2[] balls = new draw_ellipse2[1000];

void setup(){
		size(600, 600);
		background(255);
		ellipseMode(CORNERS);
		colorMode(RGB, 255, 255, 255, 100);

		for(int i = 0; i<balls.length; i++){
				balls[i] = new draw_ellipse2();
		}
}

void draw(){
		background(255);

		if(balls[id].status == 1)
				balls[id].drawing();

		for(int i = 0; i<=id; i++){
				switch(balls[i].status){
						case 2:
								balls[i].falling();
								break;
				}
						
				if(balls[i].visible)
						balls[i].disp();

		}
}

void mousePressed() {
		if (balls[id].status == 0){ 
				balls[id].status = 1;
				balls[id].x1 = mouseX;
				balls[id].y1 = mouseY;
		}
}

void mouseReleased() {
		if (balls[id].status == 1) {
				balls[id].status = 2;
				balls[id].visible = true;
		}
}
