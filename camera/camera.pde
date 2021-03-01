import processing.video.*;


Capture cam;

int skip = 20;
void setup() {
  size(640, 480, P3D);
  ortho();
  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  cam.filter(GRAY);

  //for (int x = 0; x < cam.width; x += skip) {
  //  for (int y = 0; y < cam.height; y += skip) {
  //     int index = x + y * cam.width;
  //     float b = brightness(cam.pixels[index]);
  //     //text(b, x,y);
  //     fill(b);
  //     rect(x,y, skip, skip);
  //  }
  //}
  image(cam, 0, 0);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}
