
int col, row;
int scl = 10;

int border = 20;
int p = 100;
int pInc = - 1;
int counter = 0;
float zOff = 0;
float zInc = 0.01;

float inc = 0.1;
void setup() {
  size(800, 800);

  col = width / scl;
  row = height / scl;
}

void draw() {
  background(0);

  stroke(255);
  noFill();
  float xOff = 0;
  for (int x = border; x < col - border; x++) {

    float yOff = 0;
    for (int y = border; y < row - border; y++) {

      float a = map(noise(xOff, yOff, zOff), 0, 1, 0, 100);

      if (a > p) {
        
        stroke(255);
        
      } else {

        noStroke();
      }


      rect(x * scl, y * scl, scl, scl);


      yOff += inc;
    }
    xOff += inc;
  }

  zOff += zInc;
  
  
  
  p += pInc;
  
  
  
  pChecks();
  saveFrame("output2/frame####.png");
}

void pChecks() {
  if(p > 100) {
    exit();
  }
  
  if(p == 55) {
    pInc = 0;
    counter++;
    
  }
  
  if(counter >= 250) {
    pInc = 1;
  
  }
}
