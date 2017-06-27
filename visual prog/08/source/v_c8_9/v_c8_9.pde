import ddf.minim.*;   
import ddf.minim.signals.*;    
 
Minim minim;
AudioOutput out;  
SineWave sine;   
float waveHeight = 50;   
 
void setup()
{
  size(512, 200);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  out.addSignal(sine);
}
 
void draw()
{
  background(0);
  stroke(255);
  for(int i = 0; i < out.bufferSize()-1; i++)
  {
    point(i, 50 + out.left.get(i)*waveHeight);  
    point(i, 150 + out.right.get(i)*waveHeight);  
  }
}

void mouseMoved(){
  float freq = map(mouseX, 0, width, 40,2000);
  sine.setFreq(freq);
}
  
 
void stop()
{
  out.close();
  minim.stop();
  super.stop();
}