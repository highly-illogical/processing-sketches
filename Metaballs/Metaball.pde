class Metaball {
  PVector origin, velocity, acceleration;
  int hue;
  
  Metaball() {
    origin = PVector.random2D();
    origin.add(new PVector(width/2, height/2));
    velocity = PVector.random2D().setMag(4);
  }
  
  void update() {
    origin.add(velocity);
    
    if (origin.x > width || origin.x < 0 || origin.y > height || origin.y < 0) {
      origin = new PVector(width/2, height/2);
      velocity = PVector.random2D().setMag(4);
    }
  }
}
