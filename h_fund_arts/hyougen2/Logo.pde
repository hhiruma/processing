class Logo{
	Ball[] balls;

	Logo(Ball[] _balls){
		balls = new Ball[_balls.length];
		for(int i = 0; i<_balls.length; i++){
			balls[i] = _balls[i];
		}
	}

	void disp(){
		for(int i = 0; i<balls.length; i++){
			balls[i].disp();
		}
	}
}
