float xAx, yAx, zAx;
float radH, radV, radS;
float cam;

void setInitVals(){
	//___env settings___
	xAx = 600; 
	yAx = 600; 
	zAx = 600;
	radH = 0;
	radV = 0; 
	radS = 0;
	cam = zAx;

	//___capture settings___
	cWidth = 320;
	cHeight = 240;
	d = 10;
	base = color(250, 210, 120); //skin color

	//___video settings___
	video = new Capture(this, cWidth, cHeight);
	video.start();

	//___rect settings___
	noFill();
	noStroke();
}

void reversePixels(){
	color tmp;
	for(int y = 0; y < video.height; y+= d){
		for(int x = 0; x < video.width; x+=d){
			tmp = video.pixels[y*video.width + x];
			video.pixels[y*video.width+x] = video.pixels[y*video.width+ (video.width - 1 - x )];
		}
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

void keyCommand() {
	if (keyPressed) {
		switch(key) {
			//change camera settings
			case 'x': radH -= 2;  break;
			case 'z': radH += 2;  break;
			case 's': radV -= 2;  break;
			case 'a': radV += 2;  break;
			case 'w': radS -= 2;  break;
			case 'q': radS += 2;  break;
			case 'c': cam -= 5;   break;
			case 'd': cam += 5;   break;
			case 'p': noLoop();   break;
		}
	}
}
