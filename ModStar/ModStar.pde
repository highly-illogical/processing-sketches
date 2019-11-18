int n, k, r;

class Point {
  float x, y;

  Point(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void draw() {
    translate(x, y);
    ellipseMode(CENTER);
    ellipse(0, 0, 10, 10);
    translate(-x, -y);
  }
}

ArrayList<Point> points = new ArrayList<Point>();

void setup() {
  size(600, 600);
  n = 30;
  r = 150;
  k = 1;
  for (int i=0; i<n; i++) {
    points.add(new Point(r*cos(i*TWO_PI/n), r*sin(i*TWO_PI/n)));
  }
}

void draw() {
  background(255);
  translate(width/2, height/2);

  fill(0);
  for (int i=0; i<n; i++) {
    line(points.get((i)%n).x, points.get((i)%n).y, points.get((i+k)%n).x, points.get((i+k)%n).y);
  }
  
  k = k+1;
}

void mousePressed() {
  //n = n+1;
}
