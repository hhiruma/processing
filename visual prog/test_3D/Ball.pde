class Ball{
	PVector pos, spd;
	int r;

	Ball(PVector _pos, PVector _spd, int _r){
		pos = _pos;
		spd = _spd;
		r = _r;
	}

	void disp(){
		pushMatrix();
			translate(pos.x, pos.y, pos.z);

			noStroke();
			fill(255);
			sphere(r);
		popMatrix();	
	}

	void move(){
		//___calculate spd, acc___
		gravity();
		collision();
		//resistance();

		//___apply to pos___
		pos.add(spd);
	}

	void gravity(){
		spd.y += g;
	}

	void collision(Hist h){
		float len;
		for(int j = 0; j<bars.lenght; j++){
			for(int i = 0; i<bars[j].length; i++){
				
			}
		}
	}
}
