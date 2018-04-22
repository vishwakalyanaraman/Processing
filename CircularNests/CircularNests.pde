float t;
float theta;
float theta2;
int maxFrameCount = 1000;
int counter = 0;

void setup(){
  fullScreen();
  //size(1280,720);
  background(#383D3B);
  noFill();
  strokeWeight(1);
  strokeJoin(ROUND);
  strokeCap(ROUND);
  frameRate(30);
}

void draw(){
  translate(width/2,height/2);  
  
  t = (float)frameCount/maxFrameCount;
  float i = random(10,1000);
  theta = TWO_PI*i;
  theta2 = TWO_PI*i*4;
 
  for (int x= -600; x <= 601; x += 400){
    for (int y= -600; y <= 601; y += 400){
     
   float offSet = 0;    
   float pos1 = map(sin(-theta+offSet), 0, 1, 0, (x+y/4));
   float pos2 = map(cos(-theta+offSet), 0, 1, (x+y/4), 0);
   float pos3 = map(cos(-theta2+offSet), 0, 1, -(y), 0);
   float pos4 = map(sin(-theta2+offSet), 0, 1, 0,  y);
   float pos5 = map(cos(-theta+offSet), -1, 1, -300, 300);
   float pos6 = map(sin(-theta+offSet), -1, 1, 300, -300); 

    stroke(#E2247D, 20);
    line(pos6,pos5,x-pos2,y+pos1);
    stroke(#4056F4, 20);
    line(pos5,pos6,x+pos4,y-pos3); 
  }
 }
}
