Point[] points = new Point[10];
float m, b, del_m, del_b, alpha;

void setup() {
  size(640, 480);
  m = 2;
  b = 1;
  alpha = 0.0000001;
  
  for (int i = 0; i < points.length; i++) {
    float px = random(0, width);
    points[i] = new Point(px, height - px + random(-100, 100));
  }  
}

void draw() {
  background(255);
  del_m = 0;
  del_b = 0;
  for (int i = 0; i < points.length; i++) {
    points[i].draw();
    del_m = del_m + (points[i].y - m * points[i].x - b)*points[i].x;
    del_b = del_b + 100000 * (points[i].y - m * points[i].x - b);
  }
  m = m + alpha * del_m;
  b = b + alpha * del_b;
  line(0, m*0 + b, width, m*width + b);
}
