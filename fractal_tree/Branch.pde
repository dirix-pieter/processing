class Branch {
  float x, y;
  float l;
  float sw;
  
  
  Branch () {
  }
  Branch (float xPos, float yPos, float le, float strw) {
    x = xPos;
    y = yPos;
    l = le;
    sw = strw;
  }
  void drawBranch() {
    strokeWeight(sw);
    strokeCap(SQUARE);
    line(x,y,x,y - l);
  }

}
