import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;

void setup(){
  size(100,100);
  minim = new Minim(this);
  player = minim.loadFile("marcus_kellis_theme.mp3");
}

void draw(){
}

void mouseClicked(){
  player.play();
}

void keyPressed(){
  if(key == 'p'){
    player.pause();
  } else if (key == 'r'){
player.rewind();
}
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}
