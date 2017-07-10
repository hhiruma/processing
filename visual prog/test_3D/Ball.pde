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
		resistance();

		//___apply to pos___
		pos.add(spd);
	}

	void resistance(){
		spd.mult(0.9);
	}

	void gravity(){
		spd.y += g;
	}

	void collision(){
		float len;
		boolean[][] collided = new boolean[24][32];
		PVector bal2D = new PVector (this.pos.x, this.pos.y);

		for(int j = 0; j<h.bars.length; j++){
			for(int i = 0; i<h.bars[j].length; i++){
				PVector bar2D = new PVector(h.bars[j][i].pos.x, h.bars[j][i].pos.y);
				if(PVector.dist(bal2D, bar2D) < this.r + 8){
					System.out.println("found");
					collided[j][i] = true;
				}else{
					collided[j][i] = false;
				}
			}
		}

		PVector count = new PVector(0, 0, 0);
		for(int j = 0; j<h.bars.length; j++){
			for(int i = 0; i<h.bars[j].length; i++){
				if(collided[j][i] == true){
					PVector bar2D = new PVector(h.bars[j][i].pos.x, h.bars[j][i].pos.y);
					PVector diff = bal2D.sub(bar2D);
					PVector tmp = new PVector(diff.x, diff.y, 0);
					count.add(tmp);
					System.out.println("x : "+count.x+", y : "+count.y);
				}
			}
		}
		spd.sub(count.mult(0.0001));

	}
}
