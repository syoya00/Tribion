class Key {
  String name; //name of key
  char key; //num of key
  int keyCode; //num of keyCode
  boolean isPressed; //pushed?

  Key(String tempName, char tempKey, int tempKeyCode) {
    name = tempName;
    key = tempKey;
    keyCode = tempKeyCode;
    isPressed = false;
  }
  boolean equals(char tempKey, int tempKeyCode) {
    if (tempKey != CODED) { 
      if (key == tempKey) {
        return true;
      } else {
        return false;
      }
    } else {
      if (keyCode == tempKeyCode) {
        return true;
      } else {
        return false;
      }
    }
  }
  //pushed setted key
  void pressed(char tempKey, int tempKeyCode) {
    if (equals(tempKey, tempKeyCode) == true) {
      isPressed = true;
    }
  }

  //released setted key
  void released(char tempKey, int tempKeyCode) {
    if (equals(tempKey, tempKeyCode) == true) {
      isPressed = false;
    }
  }
  //draw key
  void draw(int xOffset, int yOffset, int width, int height, PFont font, int fontSize) {
    int textColor, backgroundColor;

    if (isPressed == true) {
      //textColor = 255;
      //backgroundColor = 0;
      if (name == "UP") {
        p.move(3);
      } else if (name == "DOWN") {
        p.move(4);
      } else if (name == "RIGHT") {
        p.move(1);
      } else if (name == "LEFT") {
        p.move(2);
      } else if (name == "SPC") {
        p.move(5);
      } else if (name == "SHIFT") {
        //p.move(6);
      }
    } else {
      //textColor = 0;
      //backgroundColor = 255;
    }
    /*
    stroke(0);
     
     fill(backgroundColor);
     rect(xOffset, yOffset, width, height);
     
     textAlign(CENTER);
     textFont(font);
     fill(textColor);
     text(name, xOffset + width / 2, yOffset + height / 2 + fontSize / 2);
     */
  }
}

