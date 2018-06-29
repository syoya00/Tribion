// (x,y,speedx,speedy,acx,acy,mode
//0: go streight no accel.  can setting speed direction.
//1: go streight with accel.  can setting speed and accel direction.
//2: with circle accel. can.  setting direction by speed and accel.
//3: attract player.  can setting some power.
//4: go to player sometime.  can't setting direction and accel.

class EnemyShot {
  float shotX;
  float shotY;
  float defX;
  float defY;
  float speedX;
  float speedY;
  float acX;
  float acY;
  int shotCount;
  int shotMode;
  EnemyShot(float x, float y, float sx, float sy, float ax, float ay) {
    shotX = x;
    shotY = y;
    defX = x;
    defY = y;
    speedX = sx;
    speedY = sy;
    acX = ax;
    acY = ay;
    shotMode = 0;
    shotCount = 0;
  }
  EnemyShot(float x, float y, float sx, float sy, float ax, float ay, int sm) {
    shotX = x;
    shotY = y;
    defX = x;
    defY = y;
    speedX = sx;
    speedY = sy;
    acX = ax;
    acY = ay;
    shotMode = sm;
    shotCount = 0;
  }
  void shoot(float x, float y, float sx, float sy, float ax, float ay) {
    shotX = x;
    shotY = y;
    speedX = sx;
    speedY = sy;
    acX = ax;
    acY = ay;
  }
  void display() {
    if (shotMode==0) {
      stroke(255, 255, 0);
      strokeWeight(5);
      noFill();
      ellipse(shotX, shotY, 10, 10);
    } else if (shotMode==1) {
      stroke(0, 255, 0);
      strokeWeight(5);
      noFill();
      ellipse(shotX, shotY, 10, 10);
    } else if (shotMode==2) {
      stroke(0, 0, 255);
      strokeWeight(5);
      noFill();
      ellipse(shotX, shotY, 10, 10);
    } else if (shotMode==3) {
      stroke(255, 0, 255);
      strokeWeight(5);
      noFill();
      ellipse(shotX, shotY, 10, 10);
    } else if (shotMode==4) {
      stroke(0, 255, 255);
      strokeWeight(5);
      noFill();
      ellipse(shotX, shotY, 10, 10);
    } else if (shotMode==5) {
      stroke(255, 0, 0);
      strokeWeight(5);
      noFill();
      ellipse(shotX, shotY, 10, 10);
    }
  }
  void move() {
    if (shotMode==0) {
      shotX += speedX;
      shotY += speedY;
      p.hit(shotX, shotY);
    } else if (shotMode==1) {
      shotX += speedX;
      shotY += speedY;
      speedX += acX;
      speedY += acY;
      p.hit(shotX, shotY);
    } else if (shotMode==2) {
      shotCount++;
      shotX = defX + (shotCount + speedX)*cos(radians(shotCount + acX));
      shotY = defY + (shotCount + speedY)*sin(radians(shotCount + acY));
      p.hit(shotX, shotY);
    } else if (shotMode==3) {
      shotX += speedX;
      shotY += speedY;
      shotCount++;
      acX = 20/myDist(p.playerX, p.playerY, shotX, shotY);
      acY = 20/myDist(p.playerX, p.playerY, shotX, shotY);

      if (shotCount<500) {
        if (p.playerX<shotX) {
          speedX-=acX;
        } else {
          speedX+=acY;
        }
        p.hit(shotX, shotY);
        if (p.playerY<shotY) {
          speedY-=acX;
        } else {
          speedY+=acY;
        }
      }
      p.hit(shotX, shotY);
    } else if (shotMode==4) {
      shotCount++;
      if (shotCount%50 == 0&&shotCount<=500) {
        float tergetX = p.playerX;
        float tergetY = p.playerY;
        float dist = myDist(tergetX, tergetY, shotX, shotY);
        float shotSpeed = 6;
        speedX = (tergetX-shotX) * shotSpeed / dist;
        speedY = (tergetY-shotY) * shotSpeed / dist;
      } else if (shotCount%50 == 30&&shotCount<500) {
        speedX = 0;
        speedY = 0;
      }
      shotX += speedX;
      shotY += speedY;

      p.hit(shotX, shotY);
    } else if (shotMode==5) {
      shotCount++;
      shotX += speedX;
      shotY += speedY;
      if (shotCount==200) {
        speedX = random(2);
        speedY = random(2);
      }
      p.hit(shotX, shotY);
    }
  }
}

