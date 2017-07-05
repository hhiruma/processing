Ball[] balls;
Pane[] panesX;
Pane[] panesY;
Pane[] panesZ;
int[] prevX = new int[5];
int[] prevY = new int[5];
int[] prevZ = new int[5];


String lin;
String lines[];
int ln;
boolean moving = true;

float xAx, yAx, zAx;
float radH, radV, radS;
float cam;

int index = 0, a = 3;
int num = 1, count = 0;

void setup(){
		size(600, 600, P3D);
		background(0);
		frameRate(300);
		ellipseMode(CENTER);

		//___default settings___
		noFill();
		stroke(0);

		//___init settings____
		xAx = 600; 
		yAx = 600; 
		zAx = 600;
		radH = 0; 
		radV = 0; 
		radS = 0;
		cam = zAx;

		//___load data___
		ln = 0;
		lines = loadStrings("data.txt");
		balls = new Ball[lines.length];
		for(int i = 0; i<balls.length; i++){
				String[] co = split(lines[i], ",");
				balls[i] = new Ball(float(co[0])-300, float(co[1])-300, float(co[2])/2);
		}

		//___get panes___
		panesX = new Pane[120];
		for (int i = 0; i<120; i++){
				panesX[i] = new Pane(-300 + 5 * i, 0, 0);
		}

		panesY = new Pane[120];
		for (int i = 0; i<120; i++){
				panesY[i] = new Pane(0, -300 + 5 * i, 0);
		}

		panesZ = new Pane[120];
		for (int i = 0; i<120; i++){
				panesZ[i] = new Pane(0, 0, -300 + 5 * i);
		}

}

void draw(){
		background(0);
		translate(xAx, yAx, zAx);

		//___env settings___
		keyCommand();
		setCamera();
		drawAxis();

		index += a;
		if(index % 120 == 0){
				a = -a;
				index += a;
		}


		prevX[(count++)%5] = index;
		prevY[(count++)%5] = index;
		prevZ[(count++)%5] = index;
		for(int i = 0; i<5; i++){
				panesX[prevX[i]].disp(balls, 0);
				panesY[prevY[i]].disp(balls, 1);
				panesZ[prevZ[i]].disp(balls, 2);
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

void keyCommand(){
		if(keyPressed){
				switch(key){
						case 'x': radH -= 2; break;
						case 'z': radH += 2; break;
						case 's': radV -= 2; break;
						case 'a': radV += 2; break;
						case 'w': radS -= 2; break;
						case 'q': radS += 2; break;
						case 'c': cam -= 5; break;
						case 'd': cam += 5; break;
						case 'p': noLoop(); break;
				}
		}
}

void keyTyped(){
		switch(key){
				case 'p': noLoop(); break;
				case 'o': loop(); break;
		}
}