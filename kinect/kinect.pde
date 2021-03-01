import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;


Kinect kinect;

void setup() {
  size(800,800);
  kinect = new Kinect(this);
  kinect.activateDevice(0);
  kinect.initDepth();
  kinect.initVideo();
}

void draw() {
  background(0);
  
  PImage img = kinect.getDepthImage();
  image(img, 0, 0);
}
