class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  ColorContainer c;// = random(0,360);
  ColorContainer e;
  float maxSpeed = 10;
  float lifetime;
  float sL;
  float strokeWeight = 30;
  boolean dead;
  PVector prevPos;

  Particle(PVector pos, PVector vel, PVector acc, ColorContainer c, ColorContainer e, float maxSpeed, float lifetime) {
    this.pos = pos;
    this.vel = vel;
    this.acc = acc;
    this.c = c;
    this.e = e;
    this.maxSpeed = maxSpeed;
    this.lifetime = lifetime;
    this.sL = lifetime;
    this.dead = false;
    this.prevPos = pos.copy();
  }
  
  void update() {
    lifetime--;
    if(lifetime <= 0) {
      this.dead = true;
    }
    
    if(!dead) {
      vel.add(acc);
      vel.limit(maxSpeed);
      pos.add(vel);
      acc.mult(0);
    }
    
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void show() {
    //colorMode(HSB, 360, 100, 100);
    strokeWeight(this.lifetime + this.strokeWeight);
    float index = map(lifetime, this.sL, 0, 0, 1);
    color c = lerpColor(startColor.c,endColor.c,index);
    
    stroke(c);
    
    //stroke(map(lifetime, this.sL, 0, c.h, e.h),map(lifetime, this.sL, 0, c.s, e.s),map(lifetime, this.sL, 0, c.b, e.b));
    line(pos.x, pos.y, prevPos.x, prevPos.y);
    //if (colour >= 360) {
    //  colour = 0;
    //}
    //colour+=0.01;
  }

  void follow() {
    int x = floor(pos.x/scl);
    int y = floor(pos.y/scl);
    int index = x + y * col;

    PVector force = vectors[index];
    if (force != null) {
      applyForce(force);
    }
  }

  void updatePrev() {
    prevPos = pos.copy();
  }

  void edges() {
    if (pos.x > width) {
      pos.x = 0;
      updatePrev();
    }

    if (pos.x < 0) {
      pos.x = width;
      updatePrev();
    }

    if (pos.y > height) {
      pos.y = 0;
      updatePrev();
    }

    if (pos.y < 0) {
      pos.y = height;
      updatePrev();
    }
  }
}
