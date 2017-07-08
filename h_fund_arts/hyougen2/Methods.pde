void checkStatus(){
	switch(status) {
		case 0:
			//only X-axis framerate = 5;
			for (int i = 0; i<dPNum; i++) panesX[prevX[i]].disp(balls, 0);
			delay(200); break;
		case 1:
			//only Y-axis, framerate = 5;
			for (int i = 0; i<dPNum; i++) panesY[prevY[i]].disp(balls, 1);
			delay(200); break;

		case 2:
			//only Z-axis, framerate = 5;
			for (int i = 0; i<dPNum; i++) panesZ[prevZ[i]].disp(balls, 2);
			delay(200); break;

		case 3:
			//all axis, framerate = 5;
			for (int i = 0; i<dPNum; i++) {
				panesX[prevX[i]].disp(balls, 0);
				panesY[prevY[i]].disp(balls, 1);
				panesZ[prevZ[i]].disp(balls, 2);
			}
			delay(200); break;

		case 4:
			//only X-axis framerate = 50;
			for (int i = 0; i<dPNum; i++) panesX[prevX[i]].disp(balls, 0);
			delay(20); break;

		case 5:
			//only X-axis framerate = 100;
			for (int i = 0; i<dPNum; i++) panesX[prevX[i]].disp(balls, 0);
			delay(10); break;

		case 6:
			//only X-axis framerate = 300;
			for (int i = 0; i<dPNum; i++) panesX[prevX[i]].disp(balls, 0);
			delay(2); break;

		case 7:
			//all axis, framerate = 50
			for (int i = 0; i<dPNum; i++) {
				panesX[prevX[i]].disp(balls, 0);
				panesY[prevY[i]].disp(balls, 1);
				panesZ[prevZ[i]].disp(balls, 2);
			}
			delay(20); break;

		case 8:
			//all axis, framerate = 100
			for (int i = 0; i<dPNum; i++) {
				panesX[prevX[i]].disp(balls, 0);
				panesY[prevY[i]].disp(balls, 1);
				panesZ[prevZ[i]].disp(balls, 2);
			}
			delay(10); break;

		case 9:
			//all axis, framerate = 300
			for (int i = 0; i<dPNum; i++) {
				panesX[prevX[i]].disp(balls, 0);
				panesY[prevY[i]].disp(balls, 1);
				panesZ[prevZ[i]].disp(balls, 2);
			}
			delay(2); break;
		case -1:
			//all axis, framerate = 300
			for (int i = 0; i<dPNum; i++) {
				panesX[prevX[i]].disp(balls, 0);
				panesY[prevY[i]].disp(balls, 1);
				panesZ[prevZ[i]].disp(balls, 2);
			}
			 break;
	}
}

void printStatus(){
	//print about axis
	switch(status){
		case 0: System.out.print("Only X-axis"); break;
		case 1: System.out.print("Only Y-axis"); break;
		case 2: System.out.print("Only Y-axis"); break;
		case 3: System.out.print("All axis"); break;
		case 4: System.out.print("Only X-axis"); break;
		case 5: System.out.print("Only X-axis"); break;
		case 6: System.out.print("Only X-axis"); break;
		case 7: System.out.print("All axis"); break;
		case 8: System.out.print("All axis"); break;
		case 9: System.out.print("All axis"); break;
	}
	System.out.print(", ");

	//print about number of boards
	System.out.print("Num of boards: " + dPNum + ", ");

	//print frame rate
	System.out.print("Frame rate: "); 
	switch(status){
		case 0: System.out.print("5"); break;
		case 1: System.out.print("5"); break;
		case 2: System.out.print("5"); break;
		case 3: System.out.print("5"); break;
		case 4: System.out.print("50"); break;
		case 5: System.out.print("100"); break;
		case 6: System.out.print("500"); break;
		case 7: System.out.print("50"); break;
		case 8: System.out.print("100"); break;
		case 9: System.out.print("500"); break;
	}
	System.out.println();
}

void setTimer(){
	//change settings each 5 seconds
	if((status <= 4 && millis() - time > 10000) || (status > 4 && millis() - time > 5000)){
		if(index > 5 && index < 115){
			time = millis();
			status++;
			if(status > 10){
				status = 0;
				dPNum++; if(dPNum == 3) dPNum++;
			}
		}
	}	
}

void setCamera() {
	beginCamera();
	translate(xAx, yAx, zAx);
	camera(0, 0, cam, 0, 0, 0, 0, 1, 0);
	rotateX(radians(radV));
	rotateY(radians(radH));
	rotateZ(radians(radS));
	endCamera();
}

void drawAxis() {
	textSize(10);
	stroke(255, 0, 0);
	fill(255, 0, 0);
	line(-xAx, 0, 0, xAx, 0, 0);
	for (int i = (int)-xAx; i <= xAx; i += 50) {
		text(i, i, -5, 0);
	}

	stroke(0, 0, 255);
	fill(0, 0, 255);
	line(0, -yAx, 0, 0, yAx, 0);
	for (int i = (int)-yAx; i <= yAx; i += 50) {
		text(i, 5, i, 0);
	}

	stroke(0, 255, 0);
	fill(0, 255, 0);
	line(0, 0, -zAx, 0, 0, zAx);
	for (int i = (int)-zAx; i <= zAx; i += 50) {
		//text(i, 0, 5, i);
	}
	stroke(0);


	fill(200);
	box(xAx*2 + 100);
	noFill();
}

void keyCommand() {
	if (keyPressed) {
		switch(key) {
			//change camera settings
			case 'x': radH -= 2;  break;
			case 'z': radH += 2;  break;
			case 's': radV -= 2;  break;
			case 'a': radV += 2;  break;
			case 'w': radS -= 2;  break;
			case 'q': radS += 2;  break;
			case 'c': cam -= 5;   break;
			case 'd': cam += 5;   break;
			case 'p': noLoop();   break;

					  //alter status
			case '0': status = 0; break;
			case '1': status = 1; break;
			case '2': status = 2; break;
			case '3': status = 3; break;
			case '4': status = 4; break;
			case '5': status = 5; break;
			case '6': status = 6; break;
			case '7': status = 7; break;
			case '8': status = 8; break;
			case '9': status = 9; break;

					  //change dPNum
			case 'u': dPNum = 1;  break;
			case 'i': dPNum = 2;  break;
			case 'j': dPNum = 4;  break;
			case 'k': dPNum = 5;  break;

			//special setting
			case 'h': status = -1; break;
		}
		//System.out.println("status : " + status);
	}
}

void keyTyped() {
	switch(key) {
		case 'p': noLoop(); break;
		case 'o': loop(); time = millis(); break;
	}
}
