class Dot {
  float x;
  float y;
  float dist;
  
  
  Dot (float xPos, float yPos, float distance ) {
    x = xPos;
    y = yPos;
    dist = distance;
  }
  void drawDot() {
    strokeWeight(5);
    point(x, y);
  }

}
