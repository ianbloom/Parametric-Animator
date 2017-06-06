import controlP5.*;

float[] point = new float[2];
float[] temp = new float[2];

int a = 80;
int b = 1;
int c = 1;
int d = 80;

int e = 1;
int f = 3;
int g = 1;
int h = 3;

float centerX;
float centerY;

float count = 0;
float tick = .01;

ControlP5 cp5;
Slider abc;
int myColor = color(0,0,0);

void setup()
{
  //size(displayWidth,displayHeight);
  fullScreen();
  frameRate(30);
  background(0);
  
  centerX = width/2;
  centerY = height/2;
  
  translate(centerX, centerY);
  scale(centerY/5,centerY/5);
  
  point[0] = cos(a * count) - cos(b * count);
  point[1] = sin(c * count) - sin(d * count);
  
  cp5 = new ControlP5(this);
    // add a vertical slider
  cp5.addSlider("sliderA")
     .setPosition(10,10)
     .setSize(100,20)
     .setRange(0,10)
     .setValue(7)
     .setNumberOfTickMarks(10)
     ;
     
  cp5.addSlider("sliderB")
     .setPosition(10,40)
     .setSize(100,20)
     .setRange(0,10)
     .setValue(6)
     .setNumberOfTickMarks(10)
     ;
     
  cp5.addSlider("sliderC")
     .setPosition(10,70)
     .setSize(100,20)
     .setRange(0,10)
     .setValue(3)
     .setNumberOfTickMarks(10)
     ;
     
  cp5.addSlider("sliderD")
     .setPosition(10,100)
     .setSize(100,20)
     .setRange(0,10)
     .setValue(5)
     .setNumberOfTickMarks(10)
     ;
     
   cp5.addSlider("expE")
     .setPosition(150,10)
     .setSize(40,20)
     .setRange(0,3)
     .setValue(2)
     .setNumberOfTickMarks(4)
     ;
  
   cp5.addSlider("expF")
     .setPosition(150,40)
     .setSize(40,20)
     .setRange(0,3)
     .setValue(1)
     .setNumberOfTickMarks(4)
     ;
     
   cp5.addSlider("expG")
     .setPosition(150,70)
     .setSize(40,20)
     .setRange(0,3)
     .setValue(3)
     .setNumberOfTickMarks(4)
     ;
     
  cp5.addSlider("expH")
     .setPosition(150,100)
     .setSize(40,20)
     .setRange(0,3)
     .setValue(2)
     .setNumberOfTickMarks(4)
     ;
     
  cp5.addSlider("t")
     .setPosition(10,200)
     .setSize(20,400)
     .setRange(0,.01)
     .setValue(.01)
     ;
     
  cp5.addSlider("a")
     .setPosition(30,200)
     .setSize(20,400)
     .setRange(-3,3)
     .setValue(0)
     ;
     
  cp5.addSlider("b")
     .setPosition(50,200)
     .setSize(20,400)
     .setRange(-3,3)
     .setValue(0)
     ;
     
  cp5.addSlider("c")
     .setPosition(70,200)
     .setSize(20,400)
     .setRange(-3,3)
     .setValue(0)
     ;
     
  cp5.addSlider("d")
     .setPosition(90,200)
     .setSize(20,400)
     .setRange(-3,3)
     .setValue(0)
     ;  
  
  cp5.addButton("reset")
     .setValue(0)
     .setPosition(width-30,30)
     .setSize(20,20)
     ;
}

float aRate = 0;
float bRate = 0;
float cRate = 0;
float dRate = 0;

float tick_a = 0;
float tick_b = 0;
float tick_c = 0;
float tick_d = 0;

float a_ = 0;
float b_ = 0;
float c_ = 0;
float d_ = 0;

int periodic = 0;

void draw()
{  
  pushMatrix();
  translate(centerX - 100, centerY + 100);
  scale(centerY/3,centerY/3);
  //count2 += pow(2 , tick2 - 20);
  
  aRate += tick_a;
  bRate += tick_b;
  cRate += tick_c;
  dRate += tick_d;
  
  periodic += .1;
  if(aRate > 999999999999f)
    aRate = 0;
  //float a_ = a + .001 * cos(count2 / 600);
  a_ = a + 0.0001 * aRate;
  b_ = b + 0.0001 * bRate;
  c_ = c + 0.0001 * cRate;
  d_ = d + 0.0001 * dRate;
  background(0);
  count = 0;
  for(int i = 0; i < 5000; i++) {
    count += tick * 2;
    if(aRate > 999999999999f )
      aRate = 0;
    if(bRate > 999999999999f )
      bRate = 0;
    if(cRate > 999999999999f )
      cRate = 0;
    if(dRate > 999999999999f )
      dRate = 0;
    
    temp[0] = point[0];
    temp[1] = point[1];
    
    point[0] = pow(cos(a_ * count), e) - pow(cos(b_ * count), f);
    point[1] = pow(sin(c_ * count), g) - pow(sin(d_ * count), h);
    
    stroke(255 * ((cos(count * 10) + 1) / 2), 255 * ((cos(TWO_PI / 3 + count * 10) + 1) / 2), 255 * ((cos(2 * TWO_PI / 3 + count * 10) + 1) / 2));
    //stroke(255);
    strokeWeight(.005);
    if(i != 0)  {
      line(temp[0],temp[1],point[0],point[1]);
    }
  }
  popMatrix();

}


void sliderA(int value) {
  a = value;
}

void sliderB(int value) {
  b = value;
}

void sliderC(int value) {
  c = value;
}

void sliderD(int value) {
  d = value;
}

void expE(int value) {
  e = value;
}

void expF(int value) {
  f = value;
}

void expG(int value) {
  g = value;
}

void expH(int value) {
  h = value;
}

void t(float value) {
  tick = value;
}

void a(float value) {
  tick_a = value;
}

void b(float value) {
  tick_b = value;
}

void c(float value) {
  tick_c = value;
}

void d(float value) {
  tick_d = value;
}

void reset() {
  cp5.getController("t").setValue(.01);
  cp5.getController("a").setValue(0);
  cp5.getController("b").setValue(0);
  cp5.getController("c").setValue(0);
  cp5.getController("d").setValue(0);
  tick_a = 0;  
  tick_b = 0;
  tick_c = 0;
  tick_d = 0;
  
  a_ = a;
  b_ = b;
  c_ = c;
  d_ = d;
  
  aRate = 0;
  bRate = 0;
  cRate = 0;
  dRate = 0;
  
  
}