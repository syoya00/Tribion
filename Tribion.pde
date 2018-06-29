//sound
import ddf.minim.*;
Minim minim;
AudioSnippet [] sound = new AudioSnippet [3];
AudioPlayer [] bgm = new AudioPlayer[3];

Player p;  // player
Back b;  // background
ArrayList <Enemy> e = new ArrayList <Enemy>();  // enemy
KeyController keyController;  // about key
int count = 0;  //some count
int point = 0;  //point (not use now)
int pose = 0;
int enCount = 0;
int clear = 0;
int clearCount = 0;
int lastCount = 0;

int stageNum;

int menu = 1;
int menuMode = 0;
int select = 0;
int mode = 0;

void setup() {
  minim = new Minim(this);
  for (int i=0; i<3; i++) {
    sound[i] = minim.loadFile("data/sound" + i + ".mp3");
  }
  for (int i=0; i<3; i++) {
    bgm[i] = minim.loadFile("data/bgm" + i + ".wav");
  }

  size(600, 800);
  keyController = new KeyController();
  p = new Player (300, 700);
  b = new Back();
  frameRate(60);

  stageNum = 0;
}

void draw() {
  keyController.draw(100, 100);

  if (menu==0) {
    allDisplay();
    if (pose==0) {

      count++;
      allMove();
      addEnemy();
    }
  } else {
    menuDisp();
  }

  if (clear == 1&&stageNum!=3) {
    clearCount++;
    if (clearCount>=100) {
      textSize(200);
      text("clear", 100, 400);
    }
  } else if (stageNum==3&&clear==2) {

    clearCount++;
    if (clearCount>=100) {
      textSize(200);
      text("clear", 100, 400);
    }
  }
}

void bgmStart() {
  if (stageNum<4) {
    bgm[stageNum-1].loop();
  }
}

float myDist(float x1,float y1,float x2,float y2){
    return sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
}

void menuDisp() {

  background(0);
  textSize(100);
  fill(255);
  text("Tribion", 120, 300);

  if (menuMode==0) {

    textSize(20);
    text("push start", 250, 600);
  } else if (menuMode==1) {
    textSize(20);
    if (select==0) {
      fill(255);
    } else {
      fill(100);
    }
    text("game start", 250, 550);
    if (select==1) {
      fill(255);
    } else {
      fill(100);
    }
    text("stage select", 250, 600);
    if (select==2) {
      fill(255);
    } else {
      fill(100);
    }
    text("credit", 250, 650);
  } else if (menuMode==2) {
    textSize(20);
    if (select==0) {
      fill(255);
    } else {
      fill(100);
    }
    text("stage1", 250, 550);
    if (select==1) {
      fill(255);
    } else {
      fill(100);
    }
    text("stage2", 250, 600);
    if (select==2) {
      fill(255);
    } else {
      fill(100);
    }
    text("stage3", 250, 650);
  } else if (menuMode==4) {
    background(0);
    textSize(80);
    text("Credit", 200, 100);
    textSize(40);
    text("program :", 100, 300);
    text("tkd_meiji", 320, 300);
    text("pvcresin", 320, 400);
    text("music:", 100, 500);
    text("BoBo", 320, 500);
    text("komoridaira", 320, 600);
    textSize(20);
    text("http://taira-komori.jpn.org/", 300, 650);
    text("push shift to back menu", 200, 700);
  }
}


void addEnemy() {
  switch (stageNum) {
  case 1:
    if (count==100) {
      e.add(new Enemy(100, -100, 0, 2, 0, 0, 0));
      e.add(new Enemy(100, -150, 0, 2, 0, 0, 0));
      e.add(new Enemy(100, -200, 0, 2, 0, 0, 0));
      e.add(new Enemy(100, -250, 0, 2, 0, 0, 0));
      e.add(new Enemy(100, -300, 0, 2, 0, 0, 0));
      e.add(new Enemy(100, -350, 0, 2, 0, 0, 0));
    }
    if (count==300) {
      e.add(new Enemy(500, -100, 0, 2, 0, 0, 0));
      e.add(new Enemy(500, -150, 0, 2, 0, 0, 0));
      e.add(new Enemy(500, -200, 0, 2, 0, 0, 0));
      e.add(new Enemy(500, -250, 0, 2, 0, 0, 0));
      e.add(new Enemy(500, -300, 0, 2, 0, 0, 0));
      e.add(new Enemy(500, -350, 0, 2, 0, 0, 0));
    }
    if (count==500) {
      e.add(new Enemy(-100, 100, 2, 0, 0, 0, 0));
      e.add(new Enemy(-150, 100, 2, 0, 0, 0, 0));
      e.add(new Enemy(-200, 100, 2, 0, 0, 0, 0));
      e.add(new Enemy(700, 100, -2, 0, 0, 0, 0));
      e.add(new Enemy(750, 100, -2, 0, 0, 0, 0));
      e.add(new Enemy(800, 100, -2, 0, 0, 0, 0));
    }
    if (count==1000) {
      e.add(new Enemy(200, -100, 0, 0, 0, 0.1, 0));
      e.add(new Enemy(400, -100, 0, 0, 0, 0.1, 0));
    }
    if (count==1050) {
      e.add(new Enemy(100, -100, 0, 0, 0, 0.1, 1, 0, 1));
      e.add(new Enemy(500, -100, 0, 0, 0, 0.1, 1, 0, 1));
    }
    if (count==1100) {
      e.add(new Enemy(100, -100, 0, 0, 0, 0.1, 0));
      e.add(new Enemy(500, -100, 0, 0, 0, 0.1, 0));
    }
    if (count==1200) {
      e.add(new Enemy(100, -100, 2, 2, 0, 0, 0, 1, 0));
      e.add(new Enemy(500, -100, -2, 2, 0, 0, 0, 1, 0));
    }
    if (count==1250) {
      e.add(new Enemy(100, -100, 2, 2, 0, 0, 0, 1, 0));
      e.add(new Enemy(500, -100, -2, 2, 0, 0, 0, 1, 0));
    }
    if (count==1300) {
      e.add(new Enemy(100, -100, 2, 2, 0, 0, 0, 1, 0));
      e.add(new Enemy(500, -100, -2, 2, 0, 0, 0, 1, 0));
    }
    if (count==1700) {
      e.add(new Enemy(100, -100, 0, 2, 0, 0, 2, 1, 2));
      e.add(new Enemy(500, -100, 0, 2, 0, 0, 2, 1, 2));
    }
    if (count==2000) {
      addBoss(0);
    }
    if (count==2100 + enCount) {
      e.add(new Enemy(-100, 100, 2, 0, 0, 0, 1, 0, 1));
      e.add(new Enemy(700, 100, -2, 0, 0, 0, 1, 0, 1));
    }
    if (count==2200 + enCount) {
      e.add(new Enemy(-100, 100, 2, 0, 0, 0, 2, 0, 2));
      e.add(new Enemy(700, 100, -2, 0, 0, 0, 2, 0, 2));
    }
    if (count==2300 + enCount) {
      e.add(new Enemy(-100, 100, 2, 0, 0, 0, 1, 0, 1));
      e.add(new Enemy(700, 100, -2, 0, 0, 0, 1, 0, 1));
    }
    if (count==2600 + enCount) {
      e.add(new Enemy(-100, 100, 2, 2, 0, 0, 1, 0, 1));
      e.add(new Enemy(700, 100, -2, 2, 0, 0, 1, 0, 1));
    }
    if (count==2800 + enCount) {
      e.add(new Enemy(-100, 100, 2, 2, 0, 0, 1, 2, 1));
      e.add(new Enemy(700, 100, -2, 2, 0, 0, 1, 2, 1));
    }
    if (count==3000 + enCount) {
      e.add(new Enemy(100, -100, 0, 2, 0, 0, 2, 0, 2));
      e.add(new Enemy(300, -100, 0, 2, 0, 0, 0, 0, 0));
    }
    if (count==3100 + enCount) {
      e.add(new Enemy(200, -100, 0, 2, 0, 0, 1, 0, 1));
      e.add(new Enemy(500, -100, 0, 2, 0, 0, 0, 0, 0));
    }
    if (count==3200 + enCount) {
      e.add(new Enemy(100, -100, 0, 2, 0, 0, 2, 0, 2));
      e.add(new Enemy(500, -100, 0, 2, 0, 0, 1, 0, 1));
    }
    if (count==3300 + enCount) {
      e.add(new Enemy(150, -100, 0, 2, 0, 0, 0, 0, 0));
      e.add(new Enemy(350, -100, 0, 2, 0, 0, 0, 0, 0));
    }
    if (count==3400 + enCount) {
      e.add(new Enemy(350, -100, 0, 2, 0, 0, 1, 0, 1));
      e.add(new Enemy(300, -100, 0, 2, 0, 0, 0, 0, 0));
    }
    if (count==3500 + enCount) {
      e.add(new Enemy(450, -100, 0, 2, 0, 0, 2, 0, 2));
      e.add(new Enemy(100, -100, 0, 2, 0, 0, 0, 0, 0));
    }
    if (count==3600 + enCount) {
      e.add(new Enemy(150, -100, 0, 2, 0, 0, 1, 0, 1));
      e.add(new Enemy(550, -100, 0, 2, 0, 0, 1, 0, 1));
    }
    if (count==3700 + enCount) {
      e.add(new Enemy(250, -100, 0, 2, 0, 0, 2, 0, 2));
      e.add(new Enemy(350, -100, 0, 2, 0, 0, 2, 0, 2));
    }
    if (count==4000 + enCount) {
      addBoss(1);
    }
    break;
  case 2:

    if (count==100) {
      e.add(new Enemy(100, -100, 0, 2, 0, 0, 0));
      e.add(new Enemy(100, -150, 0, 2, 0, 0, 1, 0, 1));
      e.add(new Enemy(100, -200, 0, 2, 0, 0, 0));
      e.add(new Enemy(100, -250, 0, 2, 0, 0, 2, 0, 2));
      e.add(new Enemy(500, -100, 0, 2, 0, 0, 0));
      e.add(new Enemy(500, -150, 0, 2, 0, 0, 1, 0, 1));
      e.add(new Enemy(500, -200, 0, 2, 0, 0, 0));
      e.add(new Enemy(500, -250, 0, 2, 0, 0, 2, 0, 2));
    }
    if (count==300) {
      e.add(new Enemy(-100, -100, 2, 2, 0, 0, 1, 0, 1));
      e.add(new Enemy(-150, -150, 2, 2, 0, 0, 1, 0, 1));
      e.add(new Enemy(-200, -200, 2, 2, 0, 0, 1, 0, 1));
      e.add(new Enemy(700, -100, -2, 2, 0, 0, 1, 0, 1));
      e.add(new Enemy(750, -150, -2, 2, 0, 0, 1, 0, 1));
      e.add(new Enemy(800, -200, -2, 2, 0, 0, 1, 0, 1));
    }
    if (count==500) {
      e.add(new Enemy(-100, 100, 2, 0, 0, 0, 2, 0, 2));
      e.add(new Enemy(700, 100, -2, 0, 0, 0, 2, 0, 2));
    }
    if (count==1000) {
      e.add(new Enemy(200, -100, 0, 3, 0, 0, 3, 0, 3));
      e.add(new Enemy(400, -100, 0, 3, 0, 0, 3, 0, 3));
    }
    if (count==1400) {
      e.add(new Enemy(-100, 600, 2, 0, 0, 0, 3, 0, 3));
      e.add(new Enemy(700, 600, -2, 0, 0, 0, 3, 0, 3));
    }
    if (count==1500) {
      e.add(new Enemy(-100, 600, 2, 0, 0, 0, 1, 0, 1));
      e.add(new Enemy(700, 600, -2, 0, 0, 0, 1, 0, 1));
    }
    if (count==2000) {
      addBoss(2);
    }
    if (count==2100 + enCount) {
      e.add(new Enemy(-100, 0, 10, 10, -0.1, -0.1, 1, 0, 1));
      e.add(new Enemy(700, 0, -10, 10, 0.1, -0.1, 1, 0, 1));
    }
    if (count==2200 + enCount) {
      e.add(new Enemy(-100, 0, 10, 10, -0.1, -0.1, 2, 0, 2));
      e.add(new Enemy(700, 0, -10, 10, 0.1, -0.1, 2, 0, 2));
    }
    if (count==2300 + enCount) {
      e.add(new Enemy(-100, 0, 10, 10, -0.1, -0.1, 1, 0, 1));
      e.add(new Enemy(700, 0, -10, 10, 0.1, -0.1, 1, 0, 1));
    }
    if (count==2400 + enCount) {
      e.add(new Enemy(-100, 0, 10, 10, -0.1, -0.1, 3, 0, 3));
      e.add(new Enemy(700, 0, -10, 10, 0.1, -0.1, 3, 0, 3));
    }
    if (count==2600 + enCount) {
      e.add(new Enemy(100, -100, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(500, -100, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(150, -150, 0, 3, 0, 0, 3, 0, 3));
      e.add(new Enemy(450, -150, 0, 3, 0, 0, 3, 0, 3));
      e.add(new Enemy(100, -200, 0, 3, 0, 0, 1, 0, 1));
      e.add(new Enemy(500, -200, 0, 3, 0, 0, 1, 0, 1));
      e.add(new Enemy(150, -250, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(450, -250, 0, 3, 0, 0, 0, 0, 0));
    }
    if (count==3000 + enCount) {
      e.add(new Enemy(-100, -200, 3, 3, 0, 0, 1, 0, 1));
      e.add(new Enemy(-150, -250, 3, 3, 0, 0, 1, 0, 1));
      e.add(new Enemy(700, -200, -3, 3, 0, 0, 1, 0, 1));
      e.add(new Enemy(750, -250, -3, 3, 0, 0, 1, 0, 1));
    }
    if (count==3200 + enCount) {
      e.add(new Enemy(100, -100, 0, 4, 0, 0, 3, 3, 3));
      e.add(new Enemy(500, -100, 0, 4, 0, 0, 3, 3, 3));
    }
    if (count==3300 + enCount) {
      e.add(new Enemy(200, -100, 0, 4, 0, 0, 2, 3, 2));
      e.add(new Enemy(400, -100, 0, 4, 0, 0, 2, 3, 2));
    }
    if (count==3400 + enCount) {
      e.add(new Enemy(150, -100, 0, 4, 0, 0, 1, 3, 1));
      e.add(new Enemy(450, -100, 0, 4, 0, 0, 1, 3, 1));
    }
    if (count==3500 + enCount) {
      e.add(new Enemy(50, -100, 0, 4, 0, 0, 0, 3, 0));
      e.add(new Enemy(550, -100, 0, 4, 0, 0, 0, 3, 0));
      e.add(new Enemy(250, -100, 0, 4, 0, 0, 0, 3, 0));
      e.add(new Enemy(350, -100, 0, 4, 0, 0, 0, 3, 0));
    }

    if (count==4000 + enCount) {
      addBoss(3);
    }
    break;
  case 3:

    if (count==100) {
      e.add(new Enemy(200, -100, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(400, -100, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(200, -150, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(400, -150, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(200, -200, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(400, -200, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(200, -250, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(400, -250, 0, 3, 0, 0, 0, 0, 0));

      e.add(new Enemy(100, -200, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(500, -200, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(100, -250, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(500, -250, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(100, -300, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(500, -300, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(100, -350, 0, 3, 0, 0, 0, 0, 0));
      e.add(new Enemy(500, -350, 0, 3, 0, 0, 0, 0, 0));
    }
    if (count==300) {
      e.add(new Enemy(100, -100, 0, 3, 0, 0, 1, 0, 1));
      e.add(new Enemy(500, -100, 0, 3, 0, 0, 1, 0, 1));
      e.add(new Enemy(100, -150, 0, 3, 0, 0, 1, 0, 1));
      e.add(new Enemy(500, -150, 0, 3, 0, 0, 1, 0, 1));
      e.add(new Enemy(100, -200, 0, 3, 0, 0, 1, 0, 1));
      e.add(new Enemy(500, -200, 0, 3, 0, 0, 1, 0, 1));
    }
    if (count==500) {
      e.add(new Enemy(-100, 100, 3, 3, 0, 0, 3, 2, 3));
      e.add(new Enemy(700, 100, -3, 3, 0, 0, 3, 2, 3));
      e.add(new Enemy(-100, 150, 3, 3, 0, 0, 2, 2, 2));
      e.add(new Enemy(700, 150, -3, 3, 0, 0, 2, 2, 2));
    }
    if (count==800) {
      e.add(new Enemy(300, -100, 0, 5, 0, 0, 4, 3, 4));
      e.add(new Enemy(-100, 200, 5, 0, 0, 0, 4, 3, 4));
      e.add(new Enemy(700, 200, -5, 0, 0, 0, 4, 3, 4));
    }
    if (count==1200) {
      e.add(new Enemy(-100, 200, 7, 0, -0.1, 0, 1, 0, 1));
      e.add(new Enemy(700, 200, -7, 0, 0.1, 0, 1, 0, 1));
    }
    if (count==1300) {
      e.add(new Enemy(-100, 300, 7, 0, -0.1, 0, 0, 0, 0));
      e.add(new Enemy(700, 300, -7, 0, 0.1, 0, 0, 0, 0));
    }
    if (count==1400) {
      e.add(new Enemy(-100, 400, 7, 0, -0.1, 0, 2, 0, 2));
      e.add(new Enemy(700, 400, -7, 0, 0.1, 0, 2, 0, 2));
    }
    if (count==1500) {
      e.add(new Enemy(-100, 500, 7, 0, -0.1, 0, 3, 0, 3));
      e.add(new Enemy(700, 500, -7, 0, 0.1, 0, 3, 0, 3));
    }
    if (count==1550) {
      e.add(new Enemy(-100, 400, 7, 0, -0.1, 0, 2, 0, 2));
      e.add(new Enemy(700, 400, -7, 0, 0.1, 0, 2, 0, 2));
    }
    if (count==1600) {
      e.add(new Enemy(-100, 300, 7, 0, -0.1, 0, 0, 0, 0));
      e.add(new Enemy(700, 300, -7, 0, 0.1, 0, 0, 0, 0));
    }
    if (count==1650) {
      e.add(new Enemy(-100, 200, 7, 0, -0.1, 0, 1, 0, 1));
      e.add(new Enemy(700, 200, -7, 0, 0.1, 0, 1, 0, 1));
    }
    if (count==2000) {
      addBoss(4);
    }
    if (count==2100 + enCount) {
      e.add(new Enemy(100, -100, 0, 6, 0, 0, 0, 0, 0));
      e.add(new Enemy(500, -100, 0, 6, 0, 0, 0, 0, 0));
      e.add(new Enemy(100, -200, 0, 6, 0, 0, 0, 0, 0));
      e.add(new Enemy(500, -200, 0, 6, 0, 0, 0, 0, 0));
      e.add(new Enemy(100, -300, 0, 6, 0, 0, 0, 0, 0));
      e.add(new Enemy(500, -300, 0, 6, 0, 0, 0, 0, 0));
      e.add(new Enemy(100, -400, 0, 6, 0, 0, 0, 0, 0));
      e.add(new Enemy(500, -400, 0, 6, 0, 0, 0, 0, 0));
    }
    if (count==2200 + enCount) {
      e.add(new Enemy(50, -100, 0, 6, 0, 0, 1, 0, 1));
      e.add(new Enemy(550, -100, 0, 6, 0, 0, 1, 0, 1));
      e.add(new Enemy(50, -200, 0, 6, 0, 0, 3, 0, 3));
      e.add(new Enemy(550, -200, 0, 6, 0, 0, 3, 0, 3));
    }
    if (count==2300 + enCount) {
      e.add(new Enemy(100, 900, 0, -4, 0, 0, 4, 0, 4));
      e.add(new Enemy(500, 900, 0, -4, 0, 0, 4, 0, 4));
      e.add(new Enemy(100, 950, 0, -4, 0, 0, 0, 0, 0));
      e.add(new Enemy(500, 950, 0, -4, 0, 0, 0, 0, 0));
      e.add(new Enemy(100, 1000, 0, -4, 0, 0, 2, 0, 2));
      e.add(new Enemy(500, 1000, 0, -4, 0, 0, 2, 0, 2));
      e.add(new Enemy(100, 1050, 0, -4, 0, 0, 1, 0, 1));
      e.add(new Enemy(500, 1050, 0, -4, 0, 0, 1, 0, 1));
    }

    if (count==2600 + enCount) {
      e.add(new Enemy(-100, -100, 10, 10, -0.1, -0.1, 0, 0, 0));
      e.add(new Enemy(0, -100, 10, 10, -0.1, -0.1, 0, 0, 0));
      e.add(new Enemy(100, -100, 10, 10, -0.1, -0.1, 0, 0, 0));

      e.add(new Enemy(700, -100, -10, 10, 0.1, -0.1, 0, 0, 0));
      e.add(new Enemy(600, -100, -10, 10, 0.1, -0.1, 0, 0, 0));
      e.add(new Enemy(500, -100, -10, 10, 0.1, -0.1, 0, 0, 0));
    }
    if (count==2800 + enCount) {
      e.add(new Enemy(-100, -100, 10, 10, -0.1, -0.1, 1, 0, 1));
      e.add(new Enemy(0, -100, 10, 10, -0.1, -0.1, 1, 0, 1));
      e.add(new Enemy(100, -100, 10, 10, -0.1, -0.1, 1, 0, 1));

      e.add(new Enemy(700, -100, -10, 10, 0.1, -0.1, 1, 0, 1));
      e.add(new Enemy(600, -100, -10, 10, 0.1, -0.1, 1, 0, 1));
      e.add(new Enemy(500, -100, -10, 10, 0.1, -0.1, 1, 0, 1));
    }
    if (count==3000 + enCount) {
      e.add(new Enemy(-100, -100, 10, 10, -0.1, -0.1, 2, 0, 2));
      e.add(new Enemy(0, -100, 10, 10, -0.1, -0.1, 2, 0, 2));
      e.add(new Enemy(100, -100, 10, 10, -0.1, -0.1, 2, 0, 2));

      e.add(new Enemy(700, -100, -10, 10, 0.1, -0.1, 2, 0, 2));
      e.add(new Enemy(600, -100, -10, 10, 0.1, -0.1, 2, 0, 2));
      e.add(new Enemy(500, -100, -10, 10, 0.1, -0.1, 2, 0, 2));
    }
    if (count==3200 + enCount) {
      e.add(new Enemy(-100, -100, 10, 10, -0.1, -0.1, 3, 0, 3));
      e.add(new Enemy(0, -100, 10, 10, -0.1, -0.1, 3, 0, 3));
      e.add(new Enemy(100, -100, 10, 10, -0.1, -0.1, 3, 0, 3));

      e.add(new Enemy(700, -100, -10, 10, 0.1, -0.1, 3, 0, 3));
      e.add(new Enemy(600, -100, -10, 10, 0.1, -0.1, 3, 0, 3));
      e.add(new Enemy(500, -100, -10, 10, 0.1, -0.1, 3, 0, 3));
    }
    if (count==3400 + enCount) {
      e.add(new Enemy(-100, -100, 10, 10, -0.1, -0.1, 4, 0, 4));
      e.add(new Enemy(0, -100, 10, 10, -0.1, -0.1, 4, 0, 4));
      e.add(new Enemy(100, -100, 10, 10, -0.1, -0.1, 4, 0, 4));

      e.add(new Enemy(700, -100, -10, 10, 0.1, -0.1, 4, 0, 4));
      e.add(new Enemy(600, -100, -10, 10, 0.1, -0.1, 4, 0, 4));
      e.add(new Enemy(500, -100, -10, 10, 0.1, -0.1, 4, 0, 4));
    }
    if (count==4000 + enCount) {
      addBoss(5);
    }

    if (clear==1) {
      lastCount++;
      if (lastCount==200) {
        addBoss(6);
      }
    }

    break;
  case 4:
    //debugStage
    break;
  }
}

void addBoss(int num) {
  if (num==0) {
    e.add(new Enemy(300, -200, 1, 0, 0, 0, 100, 100, 100));
  } else if (num==1) {
    e.add(new Enemy(300, 200, 0, 0, 0, 0, 101, 101, 101));
  } else if (num==2) {
    e.add(new Enemy(300, -200, 0, 0, 0, 0, 102, 102, 102));
  } else if (num==3) {
    e.add(new Enemy(180, 400, 0, 0, 0, 0, 103, 103, 103));
  } else if (num==4) {
    e.add(new Enemy(300, -200, 0, 0, 0, 0, 104, 104, 104));
  } else if (num==5) {
    e.add(new Enemy(300, 200, 0, 0, 0, 0, 105, 105, 105));
  } else if (num==6) {
    e.add(new Enemy(300, 200, 0, 0, 0, 0, 106, 106, 106));
  }
}

void allDisplay() {
  // about display something
  b.display();
  for (int i=0; i<e.size (); i++) {
    e.get(i).display();
  }
  p.display();
  //for debug
  fill(255);
  textSize(30);
  text("score", 10, 40);
  text(point, 500, 40);
}

void allMove() {
  // about move something
  for (int i=0; i<e.size (); i++) {
    e.get(i).move();
  }
}

void reset() {
  count = 0;
  pose = 0;
  enCount = 0;
  clear = 0;
  clearCount = 0;
  lastCount = 0;
  bgm[stageNum-1].close();
}

void stop() {
  for (int i=0; i<3; i++) {
    sound[i].close();
    bgm[i].close();
  }
  minim.stop();
  super.stop();
}

void keyPressed() {
  if (pose==0&&menu==0) {
    keyController.pressed(key, keyCode);
    if (keyCode==SHIFT) {
      p.move(6);
    }
    if (keyCode==ENTER) {
      if ((clear==1&&stageNum!=3)||(clear==2&&stageNum==3)) {
        if (mode==1) {
          reset();
          if (stageNum==3) {

            reset();
            menu=1;
            point = 0;
            menuMode=0;
          } else {
            stageNum++;
            bgmStart();
          }
        } else if (mode==2) {
          reset();
          menu=1;
          point = 0;
          menuMode=0;
        }
      }
    }
  }
  if (menu==1) {
    if (keyCode==ENTER) {
      if (menuMode==0) {
        menuMode++;
      } else if (menuMode==1) {
        if (select==0) {
          menu=0;
          stageNum=1;
          mode = 1;
          bgmStart();
        } else if (select==1) {
          menuMode++;
          select=0;
        } else if (select==2) {
          menuMode=4;
        }
      } else if (menuMode==2) {
        menu=0;
        mode = 2;
        if (select==0) {
          stageNum=1;
          bgmStart();
        } else if (select==1) {
          stageNum=2;
          bgmStart();
        } else if (select==2) {
          stageNum=3;
          bgmStart();
        }
      }
    }
    if (keyCode==SHIFT) {
      if (menuMode==4) {
        menuMode=1;
      } else {
        menuMode--;
        if (menuMode==-1) {
          menuMode=0;
        }
      }
    }
    if (keyCode==UP) {
      select--;
      if (select==-1) {
        select=2;
      }
    } else if (keyCode==DOWN) {
      select++;
      if (select==3) {
        select=0;
      }
    }
  }
}

void keyReleased() {
  if (pose==0&&menu==0) {
    keyController.released(key, keyCode);
    if (keyCode==SHIFT) {
      p.move(7);
    }
    p.shotWaitReset();
  }
}

void mousePressed() {
  if (menu==0) {
    pose = 1-pose;
  }
}

