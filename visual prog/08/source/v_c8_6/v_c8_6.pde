import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioSample player;

void setup(){
  size(100,100);
  minim = new Minim(this);
  player = minim.loadSample("pe.mp3");
}

void draw(){
}

void mouseClicked(){
  player.trigger();
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}
  
