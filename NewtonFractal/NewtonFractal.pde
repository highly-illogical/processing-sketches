Complex f(Complex c) {
  return c.pow(3).add(new Complex(-1.0, 0.0));
}

Complex fp(Complex c) {
  return c.pow(2).mult(new Complex(3.0, 0.0));
}

void findColor(float x, float y) {
  int maxiter = 50;
  color col = color(0);
  
  float zx = map(x, 0, width, -2, 2);
  float zy = map(y, 0, height, 2, -2);
  
  Complex z = new Complex(zx, zy);
  
  Complex roots[] = new Complex[3];
  roots[0] = new Complex(1.0, 0.0);
  roots[1] = new Complex(-.5, sqrt(3)/2);
  roots[2] = new Complex(-.5, -sqrt(3)/2);
  
  color colors[] = new color[3];
  colors[0] = color(255, 0, 0);
  colors[1] = color(0, 255, 0);
  colors[2] = color(0, 0, 255);
  
  for(int i=0; i<maxiter; i++) {
    z = z.sub(f(z).div(fp(z)));
    
    for (int j=0; j<roots.length; j++) {
      if (roots[j].sub(z).mag() < 0.001) {
        col = colors[j];
        break;
      }
    }
  }
  stroke(col);
  point(x, y);
}

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  for(int i=0; i<width; i++) {
    for(int j=0; j<height; j++) {
      findColor(i, j);
    }
  }
}
