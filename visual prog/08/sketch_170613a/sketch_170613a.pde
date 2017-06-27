import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioSample player;

void setup(){
  size(200, 200);
  minim = new Minim(this);
  player = minim.loadSample("pe.mp3");
  rectMode(CORNER);
  rect(50, 50, 30, 30);
}

void draw(){
}

void mouseClicked(){
  if(mouseX >= 50 && mouseX <= 80){
    if(mouseY >= 50 && mouseY <=80){
      player.trigger();
    }
  }
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}