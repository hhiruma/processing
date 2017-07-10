import processing.video.*;

Capture video;

int d, cWidth, cHeight;
color base;
color[][] tmpC;
Hist h;

float xAx, yAx, zAx;
float radH, radV, radS;
float cam;

void setup(){
	size(600, 600, P3D);

	setInitVals();

	tmpC = new color[cHeight/d][cWidth/d];
	h = new Hist(cWidth, cHeight, d);
}

void draw(){
	//___env settings___
	translate(xAx, yAx, zAx);
	keyCommand();
	setCamera();
	drawAxis();

	//___set pixels___
	reversePixels(video);
	for(int y = 0; y < video.height; y+=d){
		for(int x = 0; x < video.width; x+=d){
			tmpC[y/d][x/d] = video.pixels[y*video.width + x];
		}
	}

	//___for hist___
	h.update(tmpC);
	h.disp();
}

void captureEvent(Capture video){
	if(video.available()){
		video.read();
		video.loadPixels();
	}
}
