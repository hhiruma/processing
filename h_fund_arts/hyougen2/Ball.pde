class Ball{
		float x, y, z = 0, size;

		Ball(float _x, float _y,float _size){
				x = _x;
				y = _y;
				size = _size;
		}

		void disp(){
				noStroke();  
				fill(255);

				pushMatrix();
				translate(x, y, z);
				sphere(size);
				popMatrix();

				noFill();
				stroke(0);
		}
}
