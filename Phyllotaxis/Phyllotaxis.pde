float c = 11;
float d = 10;
int nmax = 1000;
float phi0 = 137.507754;
float theta;
float omega = 0.0004;
///////////////////////////////////////////////////
void setup(){
  size(1280,720);
  colorMode(HSB,1000,100,100);
  theta = phi0;
}
///////////////////////////////////////////////////
void draw(){
  background(0);
  drawLeaves(theta);
  theta += omega;
}

void drawLeaves(float phi){
  for(int n = 0; n <= nmax; n++){
    
    float a = n * phi/360.0 * TWO_PI;
    float r = c * sqrt(n);
    
    float x = r * cos(a) + width/2;
    float y = r * sin(a) + height/2;
    fill( (n + 40) % 1000,255,255);
    noStroke();
    ellipse(x, y, d, d);
  }
}
