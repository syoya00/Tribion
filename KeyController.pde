class KeyController {
  Key upKey, downKey, leftKey, rightKey, spcKey, shiftKey;
  Key[] keys; //key hairetu
  int keyWidth, keyHeight; //key size
  PFont keyFont; //keyFont
  int fontSize;

  KeyController() {
    keyWidth = 50;
    keyHeight = 50;
    fontSize = 10;
    keyFont = createFont("MS Gothic", fontSize);

    //make keyMark
    upKey    = new Key("UP", (char)CODED, UP);
    downKey  = new Key("DOWN", (char)CODED, DOWN);
    leftKey  = new Key("LEFT", (char)CODED, LEFT);
    rightKey = new Key("RIGHT", (char)CODED, RIGHT);
    spcKey   = new Key("SPC", ' ', 0);
    shiftKey = new Key("SHIFT", (char)CODED, SHIFT);

    keys = new Key[6];
    keys[0] = upKey;
    keys[1] = downKey;
    keys[2] = leftKey;
    keys[3] = rightKey;
    keys[4] = spcKey;
    keys[5] = shiftKey;
  }

  void pressed(char tempKey, int tempKeyCode) {
    for (int i = 0; i < keys.length; i++) {
      keys[i].pressed(tempKey, tempKeyCode);
    }
  }

  void released(char tempKey, int tempKeyCode) {
    for (int i = 0; i < keys.length; i++) {
      keys[i].released(tempKey, tempKeyCode);
    }
  }

  void draw(int left, int top) {
    upKey.draw(   2 * keyWidth + left, top, keyWidth, keyHeight, keyFont, fontSize);
    downKey.draw( 2 * keyWidth + left, keyHeight + top, keyWidth, keyHeight, keyFont, fontSize);
    leftKey.draw(     keyWidth + left, keyHeight + top, keyWidth, keyHeight, keyFont, fontSize);
    rightKey.draw(3 * keyWidth + left, keyHeight + top, keyWidth, keyHeight, keyFont, fontSize);
    spcKey.draw(                 left, keyHeight + top, keyWidth, keyHeight, keyFont, fontSize);
    shiftKey.draw(                 left, keyHeight + top, keyWidth, keyHeight, keyFont, fontSize);
  }
}

