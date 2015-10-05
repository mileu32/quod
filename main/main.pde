//v0.4.0b2
//beware for singleAI in ai check time.
void draw() {
  //  println(frameRate);
  println(escmod);
  if (myClient.available()>0) recieveServer();
  if (escmod == 0) menu();
  else switch(gmod) {
  case 0:
    statM();
    break;

  case 1:
    snglP();
    break;

  case 2:
    onL();
    break;

  case 3:
    onlL();
    break;

  case -3:
    onlLR();
    break;

  case 10:
    onlLVSBefore();
    break;

  case 4:
    onlS();
    break;

  case 5:
    aWin();
    break;

  case 6:
    bWin();
    break;
  }
  if (statemod==1) state();

  click=0;
}

void mouseReleased() {
  if (clicked==1) click=-1;
  else click=1;

  clicked+=1;
}

void keyPressed() {
  if (key == TAB) {
    if (escmod == -1) escmod=gmod;
    else escmod=-1;
  } else if ((key >= 'A' && key <= 'z') || ( key>= '0' && key <= '9')) {
    if (loginCache==0&&loginID.length()<8) {
      loginID = loginID + key;
      loginID = trim(loginID);
    } else if (loginCache==1&&loginPD.length()<8) {
      loginPD = loginPD + key;
      loginPD = trim(loginPD);
    }
  } else if (key==ENTER) {
    if (loginCache==-1||loginCache==0||loginCache==1) {
      loginCache=-1;
      gmod= -3;
      click=0;
    }
  } else if (key == DELETE||key == BACKSPACE) {
    if (loginCache==0&&loginID.length()>0) loginID = loginID.substring(0, loginID.length()-1);
    if (loginCache==1&&loginPD.length()>0) loginPD = loginPD.substring(0, loginPD.length()-1);
  }
}

void recieveServer() {
  String ServerRead = myClient.readString();
  String lineRead[] = split(ServerRead, "::");

  println(lineRead[0]);
  println(loginCache);

  for (int i=0; i<lineRead.length; i++) {
    String lineCache[] = split(lineRead[i], ":");
    //about login
    if (loginCache==3) {
      if (lineCache[0].equals("1")) {
        if (lineCache[1].equals(DeviceID)&&lineCache[2].equals(loginID)&&lineCache[3].equals("true")) {
          myClient.write("2"+":"+DeviceID+":"+loginID+":"+loginPD+"::");
        }
      } else if (lineCache[0].equals("2")) {
        if (lineCache[1].equals(DeviceID)&&lineCache[2].equals(loginID)&&lineCache[3].equals("true")) {
          loginCache=4;
          gmod=10;
        } else {
          loginCache=-1;
          gmod=3;
          invalidIDPD=1;
        }
      }
    }
    //end login
    //world join available
    if (lineCache[0].equals("w")) worldValid=parseInt(lineCache[1]);
    //world join available end
  }
}