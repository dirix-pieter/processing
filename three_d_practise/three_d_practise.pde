float angle = 0.01;
float box2Position = 0;
float cubeSize = 50;
float speed = 1;
static float margin = 100;
static ArrayList<Cube> cubes = new ArrayList<Cube>();
static final int up = 0;
static final int right = 1;
static final int down = 2;
static final int left = 3;
static final int endOrStart = 4;


void setup() {
  size(800, 800, P3D);
  initCubes();
  ortho();
  
  
  
}


void draw() {
  background(0);
  
  stroke(255);
  strokeWeight(1);
  noFill();
  for (int i = cubes.size() - 1; i >= 0; i--) {
    
    cubes.get(i).updateCube();

  }

}

void initCubes() {
  Cube starter;
  starter = new Cube(cubeSize, new PVector(width/2, height/2, 0), 0, 2, true); 
  cubes.add(starter);
  
  Cube c = new Cube(cubeSize, starter.realPos, speed, 2, false);
  c.newD = 0;
  println(c.newD);
  cubes.add(c);
  
  Cube v = new Cube(cubeSize, starter.realPos, speed, 2, false);
  v.newD = 1;
  cubes.add(v);
  
  //Cube b = new Cube(cubeSize, starter.realPos, speed, 2, false);
  //b.newD = 2;
  //cubes.add(b);
  
  //Cube n = new Cube(cubeSize, starter.realPos, speed, 2, false);
  //n.newD = 3;
  //cubes.add(n);
}
