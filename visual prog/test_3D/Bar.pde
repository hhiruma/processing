class Bar{
	PVector pos;
	float len;
	color c;

	Bar(PVector _pos , float _len, color _c){
		pos = _pos;
		len = _len;
		c = _c;
	}

	void disp(){
		pushMatrix();
			translate(pos.x, pos.y, pos.y + len/2);
			fill(c);
			box(10, 10, len);
		popMatrix();
	}

	void update(color _c){
		len = sqrt(sq(255-red(_c))+sq(255-blue(_c))+sq(255-green(_c)))/2;
		c = _c;
	}
}
