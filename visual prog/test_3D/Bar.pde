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
		len = sqrt(sq(255-red(_c))+sq(255-blue(_c))+sq(255-green(_c)))/2;
		c = _c;
	}
}
