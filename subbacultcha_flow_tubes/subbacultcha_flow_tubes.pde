
int col, row;
int scl = 5;
int p = 500;

int padding = 50;

float maxSpeed = 2;
float mag = 5;
float lifetime = 70;
float zOff;
float zInc = 0.05;

float inc = 0.005;
ColorContainer startColor;
ColorContainer endColor;
PVector[] vectors;

Particle[] particles = new Particle[p];

void setup() {
  size(900, 900, P2D);
  //blendMode(SCREEN);
  col = floor(width / scl) + 1;
  row = floor(height / scl) + 1;
  vectors = new PVector[col * row];
  //colorMode(HSB, 360, 100, 100);
  colorMode(RGB);
  //startColor = new ColorContainer(90, 30, 80);// greenish to dark yellow
  //endColor = new ColorContainer(53, 100, 79.6); 
 
  startColor = new ColorContainer(random(255), random(255), random(255));//
  endColor = new ColorContainer(random(255), random(255), random(255)); 
  
  for (int i = 0; i < p; i++) {
    
    PVector pos = new PVector(random(padding, width - padding), random(padding, height - padding));
    PVector vel = new PVector(0, 0);
    PVector acc = new PVector(0, 0);
    
    
    particles[i] = new Particle(pos, vel, acc, startColor,endColor, maxSpeed, lifetime);
  }

  background(startColor.c);
}

void draw() {
  colorMode(RGB);
  //fill(0, 1);
  //rect(0, 0, width, height);
  noFill();
  stroke(255);
  float xOff = 0;
  for (int x = 0; x < col; x++) {

    float yOff = 0;
    for (int y = 0; y < row; y++) {

      float a = noise(xOff, yOff, zOff) * TWO_PI *2;//map(mouseX, 0, width, 1, 4);
    
      PVector v = PVector.fromAngle(a);
      v.setMag(mag);
      int index = x + y * col;
      vectors[index] = v;
      //pushMatrix();
      //translate(x * scl + scl/2, y * scl + scl/2);
      //rotate(v.heading());
      //strokeWeight(1);
      //line(0,0,scl,0);

      //popMatrix();


      yOff += inc;
    }
    xOff += inc;
  }

  zOff += zInc;

  for (int i = 0; i < particles.length; i++) {
    particles[i].follow();
    particles[i].update();
    particles[i].edges();
    particles[i].show();
    particles[i].updatePrev();
  }
  
  if(particles[0].dead) {
    saveFrame("output/image"+ year() + month() + day() + hour() + second() + ".png");
    stop();
  }
  
  //saveFrame("output/image###.png");
}

void keyPressed() {
  println(keyCode);
  
  if(keyCode == 32) {
    //saveFrame("stills/image_###.png");
  }
}
