class ColorContainer {
  float h;
  float s;
  float b;
  color c;
  
  ColorContainer (float h, float s, float b) {
    
    this.h = h;
    this.s = s;
    this.b = b;
    this.c = color(h,s,b);
  }


}
