class Pane {
		float x, y, z, adder = 0.5;
		int paneW = 350, paneH = 350;
		Pane(float _x, float _y, float _z) {
				x = _x;
				y = _y;
				z = _z;
		}

		void disp(Ball[] balls, int type) {
				//___type___
				//  0: x - axis
				//  1: y - axis
				//  2: z - axis

				pushMatrix();

				translate(x, y, z);

				if(type == 0)
						drawEllipseX(balls);
				else if (type == 1)
						drawEllipseY(balls);
				else
						drawEllipseZ(balls);

				//if(balls[0].z > 300 || balls[0].z < -300) adder = -adder;
				//for(int i = 0; i<balls.length; i++){
				//  balls[i].z+=adder;
				//}

				popMatrix();

				//___default settings___
				noFill();
				stroke(0);
		}

		void drawEllipseZ(Ball[] b){
				float d, radius;

				box(paneW, paneH, 0.1);
				fill(255);
				stroke(150);
				for (int i = 0; i<b.length; i++) {
						d = abs(b[i].x - this.z);
						if (d > b[i].size) continue;

						pushMatrix();
						radius = sqrt(b[i].size*b[i].size-d*d);
						translate(0, b[i].y , b[i].z);

						fill(255);
						ellipse(0, 0, radius*2, radius*2);
						popMatrix();
				}

		}

		void drawEllipseY(Ball[] b){
				float d, radius;
				rotateY(-HALF_PI);
				box(paneW, 0.1, paneH);
				fill(255);
				stroke(150);
				for (int i = 0; i<b.length; i++) {
						d = abs(b[i].y - this.y);
						if (d > b[i].size) continue;

						pushMatrix();
						radius = sqrt(b[i].size*b[i].size-d*d);
						rotateX(HALF_PI);
						translate(b[i].x, 0, b[i].z);

						fill(255);
						ellipse(0, 0, radius*2, radius*2);
						popMatrix();
				}
		}

		void drawEllipseX(Ball[] b) {
				float d, radius;

				box(0.1, paneW, paneH);
				fill(255);
				stroke(150);
				for (int i = 0; i<b.length; i++) {
						d = abs(b[i].z - this.x);
						if (d > b[i].size) continue;

						pushMatrix();
						radius = sqrt(b[i].size*b[i].size-d*d);
						rotateY(-HALF_PI);
						translate(b[i].x, b[i].y, b[i].z);

						fill(255);
						ellipse(0, 0, radius*2, radius*2);
						popMatrix();
				}
		}
}
