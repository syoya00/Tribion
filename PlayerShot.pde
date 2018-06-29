class PlayerShot {
  float shotX;
  float shotY;
  int shotSpeed;
  PlayerShot(float x, float y) {
    shotX = x;
    shotY = y;
    shotSpeed = 10;
  }
  void  display() {
    stroke(255);
    strokeWeight(5);
    line(shotX, shotY, shotX, shotY+5);
  }
  void move() {
    shotY -= shotSpeed;
    for (int i=0; i<e.size (); i++) {
      if (e.get(i).hit(shotX, shotY)==1) {
        reset();
      }
    }
    if (shotY<0) {
      reset();
    }
  }
  void setShot(float x, float y) {
    if (shotY<0) {
      shotX = x;
      shotY = y;
    }
  }
  void reset() {
    shotX = -1000;
    shotY = 0;
  }
}

