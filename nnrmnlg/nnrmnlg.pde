PFont font;

void setup() {
 size(800, 800, P3D);
 textMode(SHAPE);
 font = loadFont("sitka48.vlw");
 
 textFont(font);
 background(0);
 textSize(100);
 fill(255, 100);
 textAlign(CENTER, CENTER);
 for(int i = 3; i>=0; i--) {
   text("nnrmnlg",width/2 - 40 + i*20,height/2 + 20 - i*20);
 }
 saveFrame("logo.jpeg");
}

void draw() {

}
