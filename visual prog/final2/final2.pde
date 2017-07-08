import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

Capture video;
OpenCV opencv;
Rectangle[] faces;
draw_ellipse[] ovals = new draw_ellipse[1000];
int id = 0;

PImage pic;

void setup(){
	size(640, 480);

	noFill();
	stroke(255, 0, 0);

	video = new Capture(this, 640, 480, 30);
	video.start();
}

void draw(){
	if (video.available()) video.read();

	opencv = new OpenCV(this, video);

	opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
	faces = opencv.detect();

	image(opencv.getInput(), 0, 0);

	for (int i = 0; i<faces.length; i++){
		rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
	}
}

void mousePressed() {
	if (ovals[id].status == 0 || ovals[id].status == 4) {
		ovals[id].status = 1;
		ovals[id].x1 = mouseX;
		ovals[id].y1 = mouseY;
	}
}

void mouseReleased() {
	if (ovals[id].status == 1) {
		ovals[id].status = 2;
	}
	id++;
}

void keyTyped(){
	if (key == 's'){
		// save
		ovals[id].status = 3;
		id++;
	} else if (key == 'x'){
		// undo
		ovals[id].status = 4;
	} 
}


