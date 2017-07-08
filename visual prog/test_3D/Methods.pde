float xAx, yAx, zAx;
float radH, radV, radS;
float cam;

//___physics value___
float g = 9.8/60;
PVector initPos = new PVector(0, -200, 50);
PVector initSpd = new PVector(0, 0, 0);

void setInitVals(){
	//___init settings____
	xAx = 600; 
	yAx = 600; 
	zAx = 600;
	radH = 40.0;
	radV = -25.0; 
	radS = 0;
	cam = zAx;

	//__for b___
	b = new Ball(initPos, initSpd, 30);
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
