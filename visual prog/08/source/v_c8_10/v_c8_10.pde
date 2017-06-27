import ddf.minim.*;   
import ddf.minim.signals.*;    
 
Minim minim;
AudioOutput out;   
SineWave sine1, sine2;  
float waveH = 50;   
 
void setup()
{
  size(512, 200);
  smooth();
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO); 
  sine1 = new SineWave(440, 0.5, out.sampleRate());
  sine2 = new SineWave(1000, 0.2, out.sampleRate());
 
  out.addSignal(sine1);
  out.addSignal(sine2);
}
 
void draw()
{
  background(255);
  stroke(0);
  for(int i = 0; i < out.bufferSize()-1; i++)
  {
    point(i, 50 + out.left.get(i)*waveH);  
    point(i, 150 + out.right.get(i)*waveH);  
  }
}
 
void stop()
{
  out.close();
  minim.stop();
  super.stop();
}