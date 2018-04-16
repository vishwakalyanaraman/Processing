int scl, cols, rows, backgroundColor, backgroundColorIncrement;
boolean whiteBackground;
float inc, zinc, zoff;
Particle[] particles;
PVector[] flowField;
int timer = 0;
void settings(){
  //size(1280,720);
  fullScreen(P2D);
}


void setup() {
  //Display params
  colorMode(RGB);
  background(247,255,247);
  frameRate(30);
  smooth();

  //Variables
  scl = 40;
  inc = 0.1;
  zinc = 0.00001;
  zoff = 0;
  backgroundColor =2555;
  

  //Field grid
  cols = int(width/scl);
  rows = int(height/scl);

  //flowfield and particles
  particles = new Particle[5000];
  flowField = new PVector[cols*rows];
  CreateParticles();
}
void UpdateFlowField() {
  float yoff = 0;
  for (int y = 0; y<rows; y++) {
    float xoff=0;
    for (int x = 0; x<cols; x++) {
      int index = x+y*cols;
      float angle = noise(xoff, yoff, zoff)*TWO_PI*2;
      PVector v = PVector.fromAngle(angle).setMag(1);
      flowField[index] = v;
      xoff+= inc;
    }
    yoff +=inc;
    zoff +=zinc;
  }
  FlowFieldParticles(flowField);
}

void draw() {
  UpdateFlowField();
}

void CreateParticles() {
  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle();
  }
}

void FlowFieldParticles(PVector[] flowField) {
  for (Particle p : particles) {
    p.FollowFlow(flowField);
    p.Update();
    p.EdgeCheck();
    p.Show();
  }
}
