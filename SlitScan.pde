import processing.video.*;

Capture video;

int x = 0 ;

static final int WINDOW_HEIGHT = 480;
static final int WINDOW_WIDTH = 1280;
static final int REFRESH_RATE = 100;

void settings() {
  size(WINDOW_WIDTH, WINDOW_HEIGHT);
}

void setup() {
  video = new Capture(this, WINDOW_WIDTH, WINDOW_HEIGHT);
  video.start();
}

void captureEvent (Capture video) {
  video.read();
  x = x + 1;
}

void keyPressed () {
  noLoop();
}

void keyReleased () {
  loop();
}

void draw() {
  imageMode(CENTER);
  int w = video.width;
  int h = video.height;
  copy(video, w/2, 0, 1, h, x - 10, 0, 1, h);

  if (x > width) {
    x = 0;
  }

  filter(GRAY);

  if (keyPressed==true) {  
    text("text", 30, 30);
    println("waiting");
    try {   
      Thread.sleep(3000);
    }
    catch(Exception e) {
    }
  }
}