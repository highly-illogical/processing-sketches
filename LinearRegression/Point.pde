class Point {
  float x, y;
  
  Point(float xcoord, float ycoord) {
    x = xcoord;
    y = ycoord;
  }
  
  void draw() {
    fill(0);
    ellipse(x, y, 10, 10);
  }
}
