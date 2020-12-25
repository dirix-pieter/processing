class Cube {
  PVector pos;
  PVector realPos;
  float deltaPos;
  float size;
  float a = 0.01;
  float s;
  
  
  Cube(float size, PVector position, float speed) {
    this.size = size;
    pos = position;
    s = speed; 
  }
  
  void updateCube() {
    pushMatrix();
     
      translate(pos.x, pos.y, pos.z);
      rotateY(a * 2);
      realPos = new PVector(pos.x, pos.y, pos.z);
      box(size);
      
      a += 0.01;
    popMatrix();
    
  }
  
  //void drawCube(PVector position) {

    
  //}
  
  

}
