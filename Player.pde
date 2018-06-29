class Player {
  float playerX;
  float playerY;
  float speed;
  float defSpeed;
  int damage;
  int shotWait;
  int playerCount;
  int bariaCount;
  ArrayList <PlayerShot> shot = new ArrayList <PlayerShot>();
  Player(float x, float y) {
    playerX = x;
    playerY = y;
    speed = 8;
    defSpeed = speed;
    damage = 0;
    shotWait = 9;
    playerCount = 0;
    bariaCount = 200;
  }
  void display() {
    stroke(255);
    strokeWeight(5);
    fill(0);
    if (bariaCount>0) {
      bariaCount--;
      if (bariaCount%4<2) {
        stroke(0);
      }
    }
    if (damage>=1) {
      fill(255, 0, 0);
      noStroke();
      ellipse(playerX, playerY, playerCount, playerCount);
      playerCount++;
      if (playerCount>30) {
        fill(255, 100);
        ellipse(playerX, playerY, playerCount*2-30, playerCount*2-30);
      }
      if (playerCount>60) {
        damage = 0;
        playerCount = 0;
        playerX = 300;
        playerY = 700;
        bariaCount = 200;
        point -= 1000;
      }
    } else {
      pushMatrix();
      translate(playerX, playerY);
      triangle(0, 0, 15, 20, -15, 20);
      popMatrix();
    }
    for (int i=0; i<shot.size (); i++) {
      shot.get(i).display();
    }

    for (int i=0; i<shot.size (); i++) {
      shot.get(i).move();
    }
  }
  void move(int k) {
    if (damage == 0) {
      if (k==1) {
        if (playerX<width) {
          playerX += speed;
        }
      } else if (k==2) {
        if (playerX>0) {
          playerX -= speed;
        }
      } else if (k==3) {
        if (playerY>0) {
          playerY -= speed;
        }
      } else if (k==4) {
        if (playerY<height) {
          playerY += speed;
        }
      } else if (k==5) {
        if (damage==0) {
          shotWait++;
          if (shotWait == 10) {
            sound[0].rewind();
            sound[0].play();
            shot.add(new PlayerShot(playerX, playerY));
            shotWait = 0;
          }
        }
      } else if (k==6) {
        speed = defSpeed/4;
      } else if (k==7) {
        speed = defSpeed;
      }
    }
  }

  void shotWaitReset() {
    shotWait=9;
  }

  void hit(float x, float y) {
    if (dist(playerX, playerY, x, y)<10&&bariaCount==0) {
      damage ++;
      if (damage==1) {
        playerCount = 20;
      }
    }
  }
}

