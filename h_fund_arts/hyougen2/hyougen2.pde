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
int status;
int dPNum;
int time;

void setup() {
	size(600, 600, P3D);
	background(0);
	frameRate(1000);
	ellipseMode(CENTER);

	//___default settings___
	noFill();
	stroke(0);

	//___init settings____
	xAx = 600; 
	yAx = 600; 
	zAx = 600;
	radH = 40.0;
	radV = -25.0; 
	radS = 0;
	cam = zAx;
	status = 0;
	dPNum = 1;
	noLoop();

	//___load data___
	ln = 0;
	lines = loadStrings("data.txt");
	balls = new Ball[lines.length];
	for (int i = 0; i<balls.length; i++) {
		String[] co = split(lines[i], ",");
		balls[i] = new Ball(float(co[0])-300, float(co[1])-300, float(co[2])/2);
	}

	//___get panes___
	panesX = new Pane[120];
	panesY = new Pane[120];
	panesZ = new Pane[120];
	for (int i = 0; i<120; i++) {
		panesX[i] = new Pane(-300 + 5 * i, 0, 0);
		panesY[i] = new Pane(0, -300 + 5 * i, 0);
		panesZ[i] = new Pane(0, 0, -300 + 5 * i);
	}
}

void draw() {
	//setTimer();

	background(0);
	translate(xAx, yAx, zAx);

	//___env settings___
	keyCommand();
	setCamera();
	drawAxis();

	index += a;
	if (index % 120 == 0) {
		a = -a;
		index += a;
	}

	//update displaying panes id
	prevX[(count++)%dPNum] = index;
	prevY[(count++)%dPNum] = index;
	prevZ[(count++)%dPNum] = index;

	checkStatus();

	printStatus();

}
