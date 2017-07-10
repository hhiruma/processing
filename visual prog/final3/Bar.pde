class Bar{
	int x, y, z;
	float len;
	color c;

	Bar(int _x, int _y, int _z, float _len, color _c){
		x = _x;
		y = _y;
		z = _z;
		len = _len;
		c = _c;
	}

	void disp(){
		pushMatrix();
			translate(x, y, z + len / 2);
			fill(c);
			box(10, 10, len);
		popMatrix();
	}

	void update(color _c){
		len = 300 -sqrt(sq(red(base)-red(_c))*7+sq(green(base)-green(_c))*17+sq(blue(base)-blue(_c))*64);
		if(len < 0 ) len = 20;
		c = _c;
	}
}
