Hist h = new Hist(320, 240, 10);
color[][] new_c = new color[24][32];
int count = 0;

Ball b; 

void setup(){
	//use P3D renderer
	size(600, 600, P3D);
	frameRate(60);
	setInitVals();
}

void draw(){
	//env settings
	background(0);
	translate(xAx, yAx, zAx);
	keyCommand();
	setCamera();
	drawAxis();

	//b.len = (sin(count++ / TWO_PI)+1) * 100;

	//b.disp();

	for(int i = 0; i<32; i++){
		for(int j = 0; j<24; j++){
			new_c[j][i] = color(128);
			//new_c[j][i] = color(count++%255);
		}
	}

	h.update(new_c);

	h.disp();

	b.move();
	b.disp();
}
