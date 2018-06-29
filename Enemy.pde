//0: shoot es0
//1: shoot es1
//2: shoot es2 
//3: shoot es3
//4: shoot es4

class Enemy {
  float enemyX;
  float enemyY;
  float defX;
  float defY;
  float speedX;
  float speedY;
  float defSX;
  float defSY;
  float accX;
  float accY;
  float defAX;
  float defAY;
  float moveCount;
  int life;
  int skinType;
  int moveType;
  int shotType;
  int hitCount;
  int move01;
  ArrayList <EnemyShot> shot = new ArrayList <EnemyShot>();
  Enemy(float x, float y, float sx, float sy, float ax, float ay, int em) {
    enemyX = x;
    enemyY = y;
    defX = x;
    defY = y;
    speedX = sx;
    speedY = sy;
    defSX = sx;
    defSY = sy;
    accX = ax;
    accY = ay;
    defAX = ax;
    defAY = ay;
    skinType = em;
    moveType = 0;
    shotType = em;
    hitCount = 0;
    if (skinType<100) {
      life = 2;
    } else {
      life = 100;
    }
    move01 = 0;
  }
  Enemy(float x, float y, float sx, float sy, float ax, float ay, int skt, int mot, int sht) {
    enemyX = x;
    enemyY = y;
    defX = x;
    defY = y;
    speedX = sx;
    speedY = sy;
    defSX = sx;
    defSY = sy;
    accX = ax;
    accY = ay;
    defAX = ax;
    defAY = ay;
    skinType = skt;
    moveType = mot;
    shotType = sht;
    hitCount = 0;
    if (skinType<100) {
      life = 2;
    } else {
      life = 100;
      if (skinType==103) {
        move01 = 0;
      }
    }
  }
  // void display() : about enemy's skin
  void display() {
    if (life>0||hitCount>0) {
      strokeWeight(5);
      if (skinType == 0) {
        fill(0);
        stroke(255, 255, 0);
        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
          hitCount--;
        }
        pushMatrix();
        translate(enemyX, enemyY);
        rotate(radians(count));
        line(-30, 0, 30, 0);
        ellipse(0, 0, 30, 30);
        if (life==0) {
          explode(10);
          sound[1].rewind();
          sound[1].play();
        }
        popMatrix();
      } else if (skinType==1) {
        fill(0);
        stroke(0, 255, 0);
        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
          hitCount--;
        }
        pushMatrix();
        translate(enemyX, enemyY);
        rotate(radians(count));
        line(-30, 0, 30, 0);
        ellipse(0, 0, 30, 30);
        if (life==0) {
          explode(10);
          sound[1].rewind();
          sound[1].play();
        }
        popMatrix();
      } else if (skinType==2) {
        fill(0);
        stroke(0, 0, 255);
        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
          hitCount--;
        }
        pushMatrix();
        translate(enemyX, enemyY);
        rotate(radians(count));
        line(-30, 0, 30, 0);
        ellipse(0, 0, 30, 30);
        if (life==0) {
          explode(10);
          sound[1].rewind();
          sound[1].play();
        }
        popMatrix();
      } else if (skinType==3) {
        fill(0);
        stroke(255, 0, 255);
        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
          hitCount--;
        }
        pushMatrix();
        translate(enemyX, enemyY);
        rotate(radians(count));
        line(-30, 0, 30, 0);
        ellipse(0, 0, 30, 30);
        if (life==0) {
          explode(10);
          sound[1].rewind();
          sound[1].play();
        }
        popMatrix();
      } else if (skinType==4) {
        fill(0);
        stroke(0, 255, 255);
        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
          hitCount--;
        }
        pushMatrix();
        translate(enemyX, enemyY);
        rotate(radians(count));
        line(-30, 0, 30, 0);
        ellipse(0, 0, 30, 30);
        if (life==0) {
          explode(10);
          sound[1].rewind();
          sound[1].play();
        }
        popMatrix();
      } else if (skinType==100) {
        fill(0);
        stroke(255, 255, 0);
        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
          hitCount--;
        }
        pushMatrix();
        translate(enemyX, enemyY);
        rotate(radians(count*2));
        line(-100, -100, 100, 100);
        line(-100, 100, 100, -100);
        ellipse(0, 0, 120, 120);
        if (life==0) {
          explode(50);
          sound[2].rewind();
          sound[2].play();
        }
        popMatrix();
        lifegage();
      } else if (skinType==101) {

        fill(0);
        stroke(255, 255, 0);
        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
          hitCount--;
        }
        pushMatrix();
        translate(enemyX, enemyY);
        line(-200, 0, 0, 0);
        ellipse(-200, 0, 50, 50);
        line(200, 0, 0, 0);
        ellipse(0, 0, 120, 120);
        ellipse(0, 0, 100, 100);
        ellipse(200, 0, 50, 50);
        if (life==0) {
          explode(50);
          sound[2].rewind();
          sound[2].play();
          clear = 1;
        }
        popMatrix();
        lifegage();
      } else if (skinType==102) {
        fill(0);
        stroke(0, 255, 0);
        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
          hitCount--;
        }
        pushMatrix();
        translate(enemyX, enemyY);
        rotate(radians(count*2));
        line(-100, -100, 100, 100);
        line(-100, 100, 100, -100);
        ellipse(0, 0, 120, 120);
        if (life==0) {
          explode(50);
          sound[2].rewind();
          sound[2].play();
        }
        popMatrix();
        lifegage();
      } else if (skinType==103) {
        fill(0);
        stroke(255, 0, 0);
        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
          hitCount--;
        }
        rect(140, 5, 80, 790);
        rect(380, 5, 80, 790);
        rect(5, 200, 590, 80);
        rect(5, 360, 590, 80);
        rect(5, 520, 590, 80);
        for (int i=0; i<3; i++) {
          for (int j=0; j<2; j++) {
            if (i==0) {
              stroke(0, 255, 0);
            } else if (i==1) {
              stroke(0, 0, 255);
            } else {
              stroke(255, 0, 255);
            }
            ellipse(50+j*500, 240+i*160, 30, 30);
          }
        }
        stroke(255, 255, 0);
        ellipse(180, 50, 30, 30);
        ellipse(420, 50, 30, 30);
        ellipse(180, 750, 30, 30);
        ellipse(420, 750, 30, 30);
        pushMatrix();
        translate(enemyX, enemyY);
        ellipse(0, 0, 120, 120);
        ellipse(0, 0, 100, 100);
        if (life==0) {
          explode(50);
          sound[2].rewind();
          sound[2].play();
          clear = 1;
        }
        popMatrix();
        lifegage();
      } else if (skinType==104) {
        fill(0);
        stroke(255, 0, 255);
        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
          hitCount--;
        }
        pushMatrix();
        translate(enemyX, enemyY);
        rotate(radians(count*2));
        line(-100, -100, 100, 100);
        line(-100, 100, 100, -100);
        ellipse(0, 0, 120, 120);
        if (life==0) {
          explode(50);
          sound[2].rewind();
          sound[2].play();
        }
        popMatrix();
        lifegage();
      } else if (skinType==105) {
        fill(0);
        stroke(100, 100, 100);
        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
          hitCount--;
        }
        pushMatrix();
        translate(enemyX, enemyY);

        for (int i=0; i<5; i++) {
          line(120*cos(radians(i*72 + count*2)), 120*sin(radians((i)*72 + count*2)), 120*cos(radians((i+1)*72 + count*2)), 120*sin(radians((i+1)*72 + count*2)));
        }

        ellipse(0, 0, 120, 120);
        ellipse(0, 0, 100, 100);

        for (int i=0; i<5; i++) {
          switch (i) {
          case 0:
            stroke(255, 255, 0);
            break;
          case 1:
            stroke(0, 255, 0);
            break;
          case 2:
            stroke(0, 0, 255);
            break;
          case 3:
            stroke(255, 0, 255);
            break;
          case 4:
            stroke(0, 255, 255);
            break;
          }
          ellipse(120*cos(radians(i*72 + count*2)), 120*sin(radians(i*72 + count*2)), 30, 30);
        }

        if (life==0) {
          explode(50);
          sound[2].rewind();
          sound[2].play();
          clear = 1;
        }

        popMatrix();
        lifegage();
      } else if (skinType==106) {
        fill(0);
        stroke(100, 100, 100);
        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
        }
        pushMatrix();
        translate(enemyX, enemyY);

        for (int i=0; i<5; i++) {
          line(180*cos(radians(i*72 + count)), 180*sin(radians((i)*72 + count)), 180*cos(radians((i+1)*72 + count)), 180*sin(radians((i+1)*72 + count)));
        }
        popMatrix();
        pushMatrix();
        translate(enemyX, enemyY);

        colorMode(HSB, 255);
        stroke(moveCount%255, 255, 255);
        colorMode(RGB, 255);

        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
        }

        for (int i=0; i<5; i++) {
          line(150*cos(radians(i*72 - count*2)), 150*sin(radians((i)*72 - count*2)), 150*cos(radians((i+1)*72 - count*2)), 150*sin(radians((i+1)*72 - count*2)));
        }
        popMatrix();
        pushMatrix();
        translate(enemyX, enemyY);

        stroke(100, 100, 100);

        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
        }

        for (int i=0; i<5; i++) {
          line(120*cos(radians(i*72 + count*4)), 120*sin(radians((i)*72 + count*4)), 120*cos(radians((i+1)*72 + count*4)), 120*sin(radians((i+1)*72 + count*4)));
        }

        if (hitCount>0) {
          stroke(255);
          strokeWeight(7);
          hitCount--;
        }

        ellipse(0, 0, 120, 120);

        colorMode(HSB, 255);
        fill(moveCount%255, 255, 255);
        colorMode(RGB, 255);

        ellipse(0, 0, 100, 100);
        fill(0);

        for (int i=0; i<5; i++) {
          switch (i) {
          case 0:
            stroke(255, 255, 0);
            break;
          case 1:
            stroke(0, 255, 0);
            break;
          case 2:
            stroke(0, 0, 255);
            break;
          case 3:
            stroke(255, 0, 255);
            break;
          case 4:
            stroke(0, 255, 255);
            break;
          }
          pushMatrix();
          translate(120*cos(radians(i*72 + count*4)), 120*sin(radians(i*72 + count*4)));
          rotate(radians(count*((100-life)/10)));

          for (int j=0; j<5; j++) {
            line(50*cos(radians(j*72 + count*4)), 50*sin(radians((j)*72 + count*4)), 50*cos(radians((j+1)*72 + count*4)), 50*sin(radians((j+1)*72 + count*4)));
          }
          ellipse(0, 0, 30, 30);
          popMatrix();
        }

        if (life==0) {
          explode(100);
          sound[2].rewind();
          sound[2].play();
          clear = 2;
        }

        popMatrix();

        //bit
        colorMode(HSB, 255);
        stroke((moveCount+128)%255, 255, 255);
        colorMode(RGB, 255);
        fill(0);
        pushMatrix();
        translate(enemyX + 300*cos(radians(count*3+180)), enemyY + 100*sin(radians(count*2+180)));
        rotate(radians(-count*4));
        line(-40, 0, 40, 0);
        ellipse(0, 0, 30, 30);
        popMatrix();

        pushMatrix();
        translate(enemyX + 300*cos(radians(count*3)), enemyY + 100*sin(radians(count*2)));
        rotate(radians(-count*4));
        line(-40, 0, 40, 0);
        ellipse(0, 0, 30, 30);
        popMatrix();

        lifegage();
      }
    }

    for (int i=0; i<shot.size (); i++) {
      shot.get(i).display();
      remover(i);
    }
  }
  void remover(int i) {
    if (shot.get(i).shotX<0||shot.get(i).shotX>width||shot.get(i).shotY<0||shot.get(i).shotY>height) {
      shot.remove(i);
    }
  }
  void lifegage() {
    if (skinType==100) {
      textSize(20);
      fill(255, 100, 100);
      text("Boss100", 20, 80);
      noStroke();
      fill(255, 100, 100);
      rect(120, 70, 4*life, 10);
    } else if (skinType==101) {
      textSize(20);
      fill(255, 100, 100);
      text("Boss101", 20, 80);
      noStroke();
      fill(255, 100, 100);
      rect(120, 70, 4*life, 10);
    } else if (skinType==102) {
      textSize(20);
      fill(255, 100, 100);
      text("Boss102", 20, 80);
      noStroke();
      fill(255, 100, 100);
      rect(120, 70, 4*life, 10);
    } else if (skinType==103) {
      textSize(20);
      fill(255, 100, 100);
      text("Boss103", 20, 80);
      noStroke();
      fill(255, 100, 100);
      rect(120, 70, 4*life, 10);
    } else if (skinType==104) {
      textSize(20);
      fill(255, 100, 100);
      text("Boss104", 20, 80);
      noStroke();
      fill(255, 100, 100);
      rect(120, 70, 4*life, 10);
    } else if (skinType==105) {
      textSize(20);
      fill(255, 100, 100);
      text("Boss105", 20, 80);
      noStroke();
      fill(255, 100, 100);
      rect(120, 70, 4*life, 10);
    } else if (skinType==106) {
      textSize(20);
      fill(255, 100, 100);
      text("Boss106", 20, 80);
      noStroke();
      fill(255, 100, 100);
      rect(120, 70, 4*life, 10);
    }
  }
  void move() {
    moveCount++;
    for (int i=0; i<shot.size (); i++) {
      shot.get(i).move();
    }
    if (life>0) {
      if (moveType==0) {
        enemyX += speedX;
        enemyY += speedY;
        speedX += accX;
        speedY += accY;
      } else if (moveType==1) {
        enemyX += speedX;
        enemyY += speedY;
        if (moveCount%100==0) {
          speedX = -speedX;
        }
      } else if (moveType==2) {
        enemyX += speedX;
        enemyY += speedY;
        if (moveCount%100==0) {
          speedY = -speedY;
        }
      } else if (moveType==3) {
        if (moveCount<100) {
          enemyX += speedX;
          enemyY += speedY;
        }
      } else if (moveType==4) {
        enemyX += speedX;
        enemyY += speedY;
        speedX += accX;
        speedY += accY;
      } else if (moveType==100) {

        enCount++;

        if (enCount<400) {
          enemyY++;
        }

        if (enemyX>p.playerX) {
          enemyX--;
        } else {
          enemyX++;
        }
      } else if (moveType==101) {
      } else if (moveType==102) {

        enCount++;

        if (enCount<400) {
          enemyY++;
        }

        if (enemyX>p.playerX) {
          enemyX--;
        } else {
          enemyX++;
        }
      } else if (moveType==103) {

        if (moveCount%100>=50) {
          if (move01==0) {
            enemyX += 4.8;
          } else if (move01==1) {
            enemyY -= 3.4;
          } else if (move01==2) {
            enemyX -= 4.8;
          } else if (move01==3) {
            enemyY += 3.4;
          } else if (move01==4) {
            enemyX += 4.8;
          } else if (move01==5) {
            enemyY += 3.4;
          } else if (move01==6) {
            enemyX -= 4.8;
          } else if (move01==7) {
            enemyY -= 3.4;
          }
          if (moveCount%100==99) {
            move01++;
          }
          if (move01==8) {
            move01=0;
          }
        }
      } else if (moveType==104) {

        enCount++;

        if (enCount<400) {
          enemyY++;
        }

        if (enemyX>p.playerX) {
          enemyX--;
        } else {
          enemyX++;
        }
      } else if (moveType==105) {
      } else if (moveType==106) {
      }
      if (enemyY>0&&enemyY<height&&enemyX>0&&enemyX<width) {

        if (shotType==0) {
          if (moveCount%50==0) {
            float dist = sqrt((p.playerX - enemyX) * (p.playerX - enemyX) + (p.playerY - enemyY) * (p.playerY - enemyY));
            float shotSpeed = 4;
            shot.add(new EnemyShot(enemyX, enemyY, (p.playerX-enemyX) * shotSpeed / dist, (p.playerY-enemyY) * shotSpeed / dist, 0, 0, 0));
          }
        } else if (shotType==1) {
          if (moveCount%50==0) {
            float dist = sqrt((p.playerX - enemyX) * (p.playerX - enemyX) + (p.playerY - enemyY) * (p.playerY - enemyY));
            float shotSpeed = 0.1;
            shot.add(new EnemyShot(enemyX, enemyY, 0, 0, (p.playerX-enemyX) * shotSpeed / dist, (p.playerY-enemyY) * shotSpeed / dist, 1));
          }
        } else if (shotType==2) {
          if (moveCount%50==0) {
            for (int i=0; i<18; i++) {
              shot.add(new EnemyShot(enemyX, enemyY, 1, 1, i*20, i*20, 2));
            }
          }
        } else if (shotType==3) {
          if (moveCount%50==0) {
            shot.add(new EnemyShot(enemyX, enemyY, 1, 1, 0, 0, 3));
          }
        } else if (shotType==4) {
          if (moveCount%50==0) {
            shot.add(new EnemyShot(enemyX, enemyY, 1, 1, 0, 0, 4));
          }
        } else if (shotType==100) {
          if (moveCount%100==10) {
            float shotPosX = enemyX + 141*cos(radians(moveCount*2));
            float shotPosY = enemyY + 141*sin(radians(moveCount*2));
            float shotSpeed = 8;
            shot.add(new EnemyShot(shotPosX, shotPosY, 0, shotSpeed, 0, 0));
          } else if (moveCount%100 == 30) {
            float shotPosX = enemyX + 141*cos(radians(moveCount*2 + 90));
            float shotPosY = enemyY + 141*sin(radians(moveCount*2 + 90));
            float shotSpeed = 8;
            shot.add(new EnemyShot(shotPosX, shotPosY, 0, shotSpeed, 0, 0));
          } else if (moveCount%100 == 50) {
            float shotPosX = enemyX + 141*cos(radians(moveCount*2 + 180));
            float shotPosY = enemyY + 141*sin(radians(moveCount*2 + 180));
            float shotSpeed = 8;
            shot.add(new EnemyShot(shotPosX, shotPosY, 0, shotSpeed, 0, 0));
          } else if (moveCount%100 == 70) {
            float shotPosX = enemyX + 141*cos(radians(moveCount*2 + 270));
            float shotPosY = enemyY + 141*sin(radians(moveCount*2 + 270));
            float shotSpeed = 8;
            shot.add(new EnemyShot(shotPosX, shotPosY, 0, shotSpeed, 0, 0));
          }
          //
        } else if (shotType==101) {
          if (moveCount%50==0||moveCount%50==5||moveCount%50==10) {
            float dist = sqrt((p.playerX - enemyX) * (p.playerX - enemyX) + (p.playerY - enemyY) * (p.playerY - enemyY));
            float shotSpeed = 4;
            shot.add(new EnemyShot(enemyX, enemyY, (p.playerX-enemyX) * shotSpeed / dist, (p.playerY-enemyY) * shotSpeed / dist, 0, 0));
          }
          if (moveCount%80==0) {
            for (int i=0; i<10; i++) {
              shot.add(new EnemyShot(enemyX+200, enemyY, 5*cos(radians(i*36+18)), 5*sin(radians(i*36+18)), 0, 0, 0));
            }
          }
          if (moveCount%80==40) {
            for (int i=0; i<10; i++) {
              shot.add(new EnemyShot(enemyX-200, enemyY, 5*cos(radians(i*36)), 5*sin(radians(i*36)), 0, 0, 0));
            }
          }
        } else if (shotType==102) {
          if (moveCount%40==5) {
            float shotPosX = enemyX + 141*cos(radians(moveCount*2));
            float shotPosY = enemyY + 141*sin(radians(moveCount*2));
            float shotSpeed = 0;
            shot.add(new EnemyShot(shotPosX, shotPosY, 0, shotSpeed, 0, 0.1, 1));
          } else if (moveCount%40 == 15) {
            float shotPosX = enemyX + 141*cos(radians(moveCount*2 + 90));
            float shotPosY = enemyY + 141*sin(radians(moveCount*2 + 90));
            float shotSpeed = 0;
            shot.add(new EnemyShot(shotPosX, shotPosY, 0, shotSpeed, 0, 0.1, 1));
          } else if (moveCount%40 == 25) {
            float shotPosX = enemyX + 141*cos(radians(moveCount*2 + 180));
            float shotPosY = enemyY + 141*sin(radians(moveCount*2 + 180));
            float shotSpeed = 0;
            shot.add(new EnemyShot(shotPosX, shotPosY, 0, shotSpeed, 0, 0.1, 1));
          } else if (moveCount%40 == 35) {
            float shotPosX = enemyX + 141*cos(radians(moveCount*2 + 270));
            float shotPosY = enemyY + 141*sin(radians(moveCount*2 + 270));
            float shotSpeed = 0;
            shot.add(new EnemyShot(shotPosX, shotPosY, 0, shotSpeed, 0, 0.1, 1));
          }
          //
        } else if (shotType==103) {

          if (moveCount%100==99) {
            float shotPosX = 0;
            float shotPosY = 0;
            float dist = sqrt((p.playerX - enemyX) * (p.playerX - enemyX) + (p.playerY - enemyY) * (p.playerY - enemyY));
            float shotSpeed = 4;
            shot.add(new EnemyShot(enemyX, enemyY, (p.playerX-enemyX) * shotSpeed / dist, (p.playerY-enemyY) * shotSpeed / dist, 0, 0));
            if (move01==0) {

              shotPosX = 180;
              shotPosY = 50;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 180;
              shotPosY = 750;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 50;
              shotPosY = 400;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 2));
              shotPosX = 550;
              shotPosY = 400;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 2));
            } else if (move01==1) {

              shotPosX = 420;
              shotPosY = 50;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 420;
              shotPosY = 750;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 50;
              shotPosY = 400;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 2));
              shotPosX = 550;
              shotPosY = 400;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 2));
            } else if (move01==2) {

              shotPosX = 420;
              shotPosY = 50;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 420;
              shotPosY = 750;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 50;
              shotPosY = 240;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 1));
              shotPosX = 550;
              shotPosY = 240;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 1));
            } else if (move01==3) {

              shotPosX = 180;
              shotPosY = 50;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 180;
              shotPosY = 750;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 50;
              shotPosY = 240;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 1));
              shotPosX = 550;
              shotPosY = 240;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 1));
            } else if (move01==4) {

              shotPosX = 180;
              shotPosY = 50;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 180;
              shotPosY = 750;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 50;
              shotPosY = 400;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 2));
              shotPosX = 550;
              shotPosY = 400;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 2));
            } else if (move01==5) {

              shotPosX = 420;
              shotPosY = 50;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 420;
              shotPosY = 750;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 50;
              shotPosY = 400;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 2));
              shotPosX = 550;
              shotPosY = 400;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 2));
            } else if (move01==6) {

              shotPosX = 420;
              shotPosY = 50;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 420;
              shotPosY = 750;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 50;
              shotPosY = 640;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 3));
              shotPosX = 550;
              shotPosY = 640;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 3));
            } else if (move01==7) {

              shotPosX = 180;
              shotPosY = 50;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 180;
              shotPosY = 750;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0));
              shotPosX = 50;
              shotPosY = 640;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 3));
              shotPosX = 550;
              shotPosY = 640;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, 3));
            }
          }
        } else if (shotType==104) {
          if (moveCount%50==10) {
            float shotPosX = enemyX + 141*cos(radians(moveCount*2));
            float shotPosY = enemyY + 141*sin(radians(moveCount*2));
            shot.add(new EnemyShot(shotPosX, shotPosY, 1, 1, 0, 0, 3));
            shotPosX = enemyX + 141*cos(radians(moveCount*2 + 90));
            shotPosY = enemyY + 141*sin(radians(moveCount*2 + 90));
            shot.add(new EnemyShot(shotPosX, shotPosY, 1, 1, 0, 0, 3));
            shotPosX = enemyX + 141*cos(radians(moveCount*2 + 180));
            shotPosY = enemyY + 141*sin(radians(moveCount*2 + 180));
            shot.add(new EnemyShot(shotPosX, shotPosY, 1, 1, 0, 0, 3));
            shotPosX = enemyX + 141*cos(radians(moveCount*2 + 270));
            shotPosY = enemyY + 141*sin(radians(moveCount*2 + 270));
            shot.add(new EnemyShot(shotPosX, shotPosY, 1, 1, 0, 0, 3));
          }
          //
        } else if (shotType==105) {
          if (moveCount%100==50) {
            float shotPosX;
            float shotPosY;
            float dist;
            float shotSpeed;
            for (int i=0; i<5; i++) {
              shotPosX = 120*cos(radians(i*72 + count*2)) + enemyX;
              shotPosY = 120*sin(radians(i*72 + count*2)) + enemyY;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              if (i!=1) {
                shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, i));
              } else {
                shot.add(new EnemyShot(shotPosX, shotPosY, 0, 0, (p.playerX-shotPosX) / dist, (p.playerY-shotPosY) / dist, i));
              }
            }
          }
          //
        } else if (shotType==106) {
          if (moveCount%120==60) {
            float shotPosX;
            float shotPosY;
            float dist;
            float shotSpeed;
            for (int i=0; i<5; i++) {
              shotPosX = 120*cos(radians(i*72 + count*4)) + enemyX;
              shotPosY = 120*sin(radians(i*72 + count*4)) + enemyY;
              dist = sqrt((p.playerX - shotPosX) * (p.playerX - shotPosX) + (p.playerY - shotPosY) * (p.playerY - shotPosY));
              shotSpeed = 4;
              if (i!=1) {
                shot.add(new EnemyShot(shotPosX, shotPosY, (p.playerX-shotPosX) * shotSpeed / dist, (p.playerY-shotPosY) * shotSpeed / dist, 0, 0, i));
              } else {
                shot.add(new EnemyShot(shotPosX, shotPosY, 0, 0, (p.playerX-shotPosX) / dist, (p.playerY-shotPosY) / dist, i));
              }
            }
          }

          //     translate(enemyX + 300*cos(radians(count*3+180)), enemyY + 100*sin(radians(count*2+180)));

          if (moveCount%40==20) {
            float shotPosX = enemyX + 300*cos(radians(count*3+180));
            float shotPosY = enemyY + 100*sin(radians(count*2+180));
            int randNum = int(random(5));
            switch (randNum) {
            case 0:
              shot.add(new EnemyShot(shotPosX, shotPosY, 0, 3, 0, 0, 0));
              break;
            case 1:
              shot.add(new EnemyShot(shotPosX, shotPosY, 0, 0, 0, 0.1, 1));
              break;
            case 2:
              shot.add(new EnemyShot(shotPosX, shotPosY, 0, 1, 0, 0, 2));
              break;
            case 3:
              shot.add(new EnemyShot(shotPosX, shotPosY, 0, 1, 0, 0, 3));
              break;
            case 4:
              shot.add(new EnemyShot(shotPosX, shotPosY, 0, 0, 0, 0, 4));
              break;
            }
            shotPosX = enemyX + 300*cos(radians(count*3));
            shotPosY = enemyY + 100*sin(radians(count*2));
            randNum = int(random(5));
            switch (randNum) {
            case 0:
              shot.add(new EnemyShot(shotPosX, shotPosY, 0, 3, 0, 0, 0));
              break;
            case 1:
              shot.add(new EnemyShot(shotPosX, shotPosY, 0, 0, 0, 0.1, 1));
              break;
            case 2:
              shot.add(new EnemyShot(shotPosX, shotPosY, 0, 1, 0, 0, 2));
              break;
            case 3:
              shot.add(new EnemyShot(shotPosX, shotPosY, 0, 1, 0, 0, 3));
              break;
            case 4:
              shot.add(new EnemyShot(shotPosX, shotPosY, 0, 0, 0, 0, 4));
              break;
            }
          }
          //
        }
        //enemyMode
      }
      //enemyOut
    }
  }
  void explode (int expCount) {
    noStroke();
    fill(255, 255-5*hitCount);
    ellipse(0, 0, (expCount-hitCount)*(expCount-hitCount), (expCount-hitCount)*(expCount-hitCount));
  }
  int hit(float x, float y) {
    if (skinType<100) {
      if (myDist(enemyX, enemyY, x, y)<20&&life>0) {
        point += 100;
        life --;
        if (life==0) {
          hitCount = 10;
        } else {
          hitCount = 1;
        }
        return 1;
      }
    } else {
      if (myDist(enemyX, enemyY, x, y)<60&&life>0) {
        point += 100;
        life --;
        //deb
        if (life==0) {
          point += 1000;
          int sizes = shot.size();
          for (int i=0; i<sizes; i++) {
            shot.remove(0);
          }
        }
        //deb
        if (life==0) {
          hitCount = 50;
        } else {
          hitCount = 1;
        }
        return 1;
      }
    }
    return 0;
  }
  void reset() {
    enemyX = defX;
    enemyY = defY;
    speedX = defSX;
    speedY = defSY;
  }
}

