


float xStart, yStart, initialLength, strokeWidth, currentLength;
Dot starter; 

ArrayList<Dot> dotList = new ArrayList<Dot>();

void setup() {
  size(1000,1000, P3D);
  xStart = width/2;
  yStart = height/2;
  initialLength = 180;
  currentLength = initialLength;
  strokeWidth = 7;
  stroke(color(80));
  
  background(color(240));
  
  for(int i = 0; i <= 3; i++) {
    
    pushMatrix();
      translate(xStart, yStart);
      rotate((PI/2) * i);
      starter = new Dot(0,0, initialLength);
    starter.drawDot();
    drawFractalTree(starter);
    currentLength = initialLength;
    popMatrix();
    
    
  }
  //saveFrame("squareFractalTree.jpeg");
  
}

void draw() {
  //background(color(240));
  for(int i = 0; i < dotList.size(); i++) {
    Dot d = dotList.get(i);
    println(d.y);
  }
  
  stop();
} 
void drawFractalTree(Dot dot) {
  float lAngle = radians(90);
  float rAngle = radians(270);
  float sh = 0.25;
  
  
  if (currentLength > 50) {
    dotList.add(dot);
    drawNewDot(lAngle,dot,sh);
    drawNewDot(rAngle,dot,sh);
  }
} 

void drawNewDot(Float angle, Dot dot, float sh) {
  pushMatrix();
     currentLength = dot.dist - (dot.dist * sh);
     PVector newPos = new PVector(dot.x, dot.y - dot.dist);
     
     translate(newPos.x, newPos.y);
     rotate(angle);
     Dot nDot = new Dot(0, 0, currentLength);
   nDot.drawDot();
   dotList.add(nDot);
   drawFractalTree(nDot); 
   popMatrix();
   
}
