class draw_ellipse2{
		float x1, y1, x2, y2;
		float r;
		int status;
		boolean visible;

		/*
				status:
				0: selected
				1: drawing
				2: end drawing + start falling
		 */

		draw_ellipse2(){
				status = 0;
				visible = false;
		}

		void drawing(){
				float rX, rY;
				//x1, y1 set when mousePressed()
				rX = x1 - mouseX;
				rY = y1 - mouseY;
				r = abs(rX)>abs(rY)?abs(rX):abs(rY);

				if(rX >= 0){
						x2 = x1 - r;
						if(rY >= 0) y2 = y1 - r;
						else y2 = y1 + r;
				} else {
						x2 = x1 + r;
						if (rY >= 0) y2 = y1 - r;
						else y2 = y1 + r;
				}

				fill(255, 255, 255, 50);
				ellipse(x1, y1, x2, y2);
		}

		void disp(){
				if (status == 2)
						fill(200, 0, 0, 80);
				else
						fill(255);
				ellipse(x1, y1, x2, y2);
		}

		void falling(){
				
		}
}
