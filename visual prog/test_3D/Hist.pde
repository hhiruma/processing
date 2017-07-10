class Hist{
	int w, h, div;
	Bar[][] bars;

	Hist(int _width, int _height, int _div){
		//set vals from argument
		w= _width;
		h= _height;
		div = _div;		//create Bars
		bars = new Bar[h/div][w/div];
		for(int j = 0; j<h/div; j++){
			for(int i = 0; i<w/div; i++){
				PVector tmp = new PVector(i*div-w/2, j*div-h/2, 0);
				bars[j][i] = new Bar(tmp, 100, color(255));
			}
		}

	}

	void update(color[][] _c){
		for(int j = 0; j<h/div; j++){
			for(int i = 0; i<w/div; i++){
				bars[j][i].update(_c[j][i]);
			}
		}
	}

	void disp(){
		for(int j = 0; j<h/div; j++){
			for(int i = 0; i<w/div; i++){
				bars[j][i].disp();
			}
		}
	}
}
