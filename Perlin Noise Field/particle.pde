class Particle {

  private PVector pos;
  private PVector vel;
  private PVector acc;
  private float maxspeed;
  private boolean particleColorWhite;
  int timer = 0;

  private PVector prevPos;

  Particle() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    prevPos = pos.copy();
    maxspeed = 3;
  }

  void Reset() {
    vel.x = 0;
    vel.y = 0;
    acc.x = 0;
    acc.y = 0;
    NewParticlePos();
    particleColorWhite = !particleColorWhite;
  }

  void Update() {
    pos.add(vel);
    vel.add(acc);
    vel.limit(maxspeed);
    acc.mult(0);
  }

  private void ApplyForce(PVector force) {
    acc.add(force);
  } 

  void Show() {
    timer ++;
    colorMode(RGB);
     //RBG Coloration
    color red = color(255,107,107,50);
    color yell = color(255,230,109,50);
    color grad = lerpColor(red, yell, (millis()%5000)/5000.0);
    stroke (grad);
   // strokeWeight(1);
    line(pos.x, pos.y, prevPos.x, prevPos.y);
    UpdatePrevious();
  }

  private void NewParticlePos() {
    pos.x = random(width);
    pos.y = random(height);
    UpdatePrevious();
  }
  //keep particles inside edges of window
  void EdgeCheck() {
    if (pos.x > width ||pos.x < 0) {    
      NewParticlePos();
    }
    if (pos.y > height || pos.y < 0 ) { 
      NewParticlePos();
    }
  }


  void UpdatePrevious() {
    prevPos.x = pos.x;
    prevPos.y = pos.y;
  }

  void FollowFlow(PVector[] vectors) {
    int x = int(floor(pos.x-1))/scl;
    int y = int(floor(pos.y-1))/scl;
    int index = x+y*cols;
    ApplyForce(vectors[index]);
  }
}
