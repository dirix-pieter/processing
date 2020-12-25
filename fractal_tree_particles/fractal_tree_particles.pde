


float xStart, yStart, initialLength, strokeWidth, currentLength;
Branch starter; 

void setup() {
  size(1200,1200, P2D);
  xStart = width/2;
  yStart = height/2;
  initialLength = 180;
  currentLength = initialLength;
  strokeWidth = 7;
  stroke(color(80));
  starter = new Branch(0, 0, initialLength, strokeWidth);
  background(color(240));
  
  for(int i = 0; i <= 3; i++) {
    
    pushMatrix();
      translate(xStart, yStart);
      rotate((PI/2) * i);
      starter.drawBranch();
      drawFractalTree(starter);
      currentLength = initialLength;
    popMatrix();
  }
  saveFrame("squareFractalTree.jpeg");
}

void draw() {

} 
void drawFractalTree(Branch branch) {
  float lAngle = radians(90);
  float rAngle = radians(270);
  float sh = 0.25;
  
  if (currentLength > 50) {
    drawNewBranch(lAngle,branch,sh);
    drawNewBranch(rAngle,branch,sh);
  }
} 

void drawNewBranch(Float angle, Branch branch, float sh) {
  pushMatrix();
     currentLength = branch.l - (branch.l * sh);
     PVector newPosR = new PVector(branch.x, branch.y - branch.l);
     translate(newPosR.x, newPosR.y);
     rotate(angle);
     Branch rBranch = new Branch(0, 0, currentLength, branch.sw );
     rBranch.drawBranch();
     drawFractalTree(rBranch); 
   popMatrix();

}
