class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float maxSpeed = 5;

  PVector prevPos;

  Particle(PVector startPos, PVector startVel, PVector startAcc, float mSpeed) {
    pos = startPos;
    vel = startVel;
    acc = startAcc;
    maxSpeed = mSpeed;
    prevPos = pos.copy();
  }
  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector force) {

    acc.add(force);
  }

  void show() {
    colorMode(HSB, 360, 100, 100);
    strokeWeight(1);

    stroke(255, 100);
    line(pos.x, pos.y, prevPos.x, prevPos.y);
    
  }

  void follow() {
    int x = floor(pos.x/scl);
    int y = floor(pos.y/scl);
    int index = x + y * img.width;

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
