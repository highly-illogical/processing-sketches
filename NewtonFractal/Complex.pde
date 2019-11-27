class Complex {
  float x, y;
  
  Complex(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  float mag() {
    return x*x + y*y;
  }
  
  Complex conjugate() {
    return new Complex(x, -y);
  }
  
  Complex add(Complex c) {
    return new Complex(x+c.x, y+c.y);
  }
  
  Complex sub(Complex c) {
    return new Complex(x-c.x, y-c.y);
  }
  
  Complex mult(Complex c) {
    float xr = x*c.x - y*c.y;
    float yr = x*c.y + y*c.x;
    return new Complex(xr, yr);
  }
  
  Complex div(Complex c) {
    float d = c.mag();
    Complex n = this.mult(c.conjugate());
    n.x /= d;
    n.y /= d;
    return n;
  }
  
  Complex pow(int n) {
    Complex c = new Complex(1, 0);
    for (int i=0; i<n; i++) {
      c = c.mult(this);
    }
    return c;
  }
  
  void draw() {
    line(0, 0, x, -y);
  }
}
