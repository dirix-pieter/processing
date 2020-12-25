float angle = 0.01;
float box2Position = 0;

Cube starter;
void setup() {
  size(800, 800, P3D);
  
  starter = new Cube(100, new PVector(width/2, height/2, 0), 2); 
  //ortho();
  
}


void draw() {
  background(0);
  
  stroke(255);
  strokeWeight(2);
  noFill();
  
  starter.updateCube();
  
  //pushMatrix();
  //translate(width/2, height/2, 0);
  
  //float x = modelX(0,0,0);
  //float y = modelY(0,0,0);
  //float z = modelZ(0,0,0);
  //rotateY(angle * 2);

  //box(100);
  //popMatrix();
  
  
  //pushMatrix();

  
  //translate(x, y + box2Position, z);
  //rotateY(angle * 2);
  //box(100);
  //println(y);
  //popMatrix();
  
  //angle += 0.01;
  //if(y + box2Position >= height/2 - 100 ) {
  //  box2Position -= 1;
  //}
  

}
