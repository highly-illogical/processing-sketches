Metaball[] meta;

void setup() {
  size(200, 200);
  colorMode(HSB);
  meta = new Metaball[12];
  for (int m = 0; m < meta.length; m++) {
    meta[m] = new Metaball();
  }
}

int col = 0;

void draw() {
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      float brightness = 0;
      
      for (int m = 0; m < meta.length; m++) {
        float distance = dist(x, y, meta[m].origin.x, meta[m].origin.y);
        float addition = 500*pow(distance+1, -1);
        brightness = brightness + addition;
      }
      pixels[index] = color(col, 160, brightness);
    }
  }
  updatePixels();
  for (Metaball m: meta) {
    m.update();
  }
  col = (col + 2) % 255;
}
