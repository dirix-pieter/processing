class Cube {
  PVector pos;
  PVector initPos;
  PVector realPos;
  float size;
  float a = 0.01;
  float s;
  int newD;
  boolean stopped = false;
  boolean isStarter = false;
  boolean sleep = false;

  Cube(float size, PVector position, float speed, int previousDirection, boolean starter) {
    this.size = size;
    pos = position;
    initPos = new PVector(pos.x, pos.y, pos.z);
    //println(pos.y);
    s = speed; 
    newD = new Direction().returnRandomDirection(previousDirection);
    isStarter = starter;
    pushMatrix();
    translate(pos.x, pos.y, 0);
    rotateY(a * 2);

    realPos = new PVector(modelX(0, 0, 0), modelY(0, 0, 0), modelZ(0, 0, 0));
    popMatrix();
  }

  void updateCube() {
    println(s);
    stopCube();
    pushMatrix();
    if (!stopped) {
      switch(newD) {
      case 0:
        if (pos.y - s > initPos.y - size) {
          pos.set(pos.x, pos.y -= s, pos.z);
        } else {

          // translate(pos.x , pos.y-= size, pos.z);
          stopped = true;
        }
        break;

      case 1:
        if (pos.x + s < initPos.x + size) {
          pos.set(pos.x += s, pos.y, pos.z);
        } else {
          stopped = true;
        } 
        break;

      case 2:

        if (pos.y + s < initPos.y + size) {

          pos.set(pos.x, pos.y += s, pos.z);
        } else {
          //translate(pos.x, pos.y += size, pos.z);
          stopped = true;
        } 
        break;
      case 3:
        if (pos.x > initPos.x - size) {

          pos.set(pos.x -= s, pos.y, pos.z);
        } else {

          //translate(pos.x -= size, pos.y, pos.z);
          stopped = true;
        }
        break;
      case 4:
        s = 0;
        break;
      }
    }

    //rotateY(a * 2);
    
    translate(pos.x, pos.y, 0);
    realPos = new PVector(modelX(0, 0, 0), modelY(0, 0, 0), modelZ(0, 0, 0));
    rotateX(-PI/6);
    rotateY(PI/3);
    box(size);
    
    a += 0.01;
    popMatrix();

    if (stopped && !isStarter && !sleep) {
      Cube newCube = new Cube(size, realPos, s, newD, false);

      three_d_practise.cubes.add(newCube);
      sleep = true;
      //newCube.updateCube();
    }
  }

  void stopCube() {
    float m = three_d_practise.margin;
    if(screenX(pos.x, pos.y, pos.z) >= width - m || screenX(pos.x, pos.y, pos.z) <= m || screenY(pos.x, pos.y, pos.z) >= height - m || screenY(pos.x, pos.y, pos.z) <= m) {
      stopped = true;
    
    }  

  }
}
