//aWin, bWin : show, A, B win
//showBlock : show gameboard
//menu
void menu() {
  statemod=0;
  noStroke();
  fill(230, 158, 122);
  rect(32, 18, width-64, height-36);
  fill(241, 232, 212);
  rect(48, 27, width-96, height-54);
  switch(menuKind) {
  case 0:
    fill(255, 159, 113);
    rect(48, 27, width/4-24, 60);
    fill(255, 198, 117);
    rect(width/4+24, 27, width/4-24, 60);
    rect(width/2, 27, width/4-24, 60);
    rect(width/4*3-24, 27, width/4-24, 60);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0);
    text("info", width/8+36, 57);
    text("quod v0.4.0b2", width/2, 120);
    image(mileuIcon, width/2, 220, 130, 130);
    text("this software is by mileu", width/2, 310);
    image(musicAlbum, width/2, 400, 130, 130);
    text("OST by Lepellec dominique", width/2, 490);
    image(License, width/2, 560, 361, 145);
    upmenuButton();
    break;

  case 1:
    fill(255, 159, 113);
    rect(width/4+24, 27, width/4-24, 60);
    fill(255, 198, 117);
    rect(48, 27, width/4-24, 60);
    rect(width/2, 27, width/4-24, 60);
    rect(width/4*3-24, 27, width/4-24, 60);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0);
    text("display", width*3/8+12, 57);
    
    upmenuButton();
    break;

  case 2:
    fill(255, 159, 113);
    rect(width/2, 27, width/4-24, 60);
    fill(255, 198, 117);
    rect(48, 27, width/4-24, 60);
    rect(width/4+24, 27, width/4-24, 60);
    rect(width/4*3-24, 27, width/4-24, 60);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0);
    text("sound", width*5/8-12, 57);
    
    upmenuButton();
    break;

  case 3:
    fill(255, 159, 113);
    rect(width/4*3-24, 27, width/4-24, 60);
    fill(255, 198, 117);
    rect(48, 27, width/4-24, 60);
    rect(width/4+24, 27, width/4-24, 60);
    rect(width/2, 27, width/4-24, 60);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0);
    text("network", width*7/8-36, 57);
    upmenuButton();
    break;
  }
}

void upmenuButton() {
  if (mouseY<=87&&mouseY>=27) {
    if (mouseX>=48&&mouseX<=width/4+24) {
      fill(0);
      text("info", width/8+36, 57);
      if (click==1) menuKind=0;
    } else if (mouseX>=width/4+24&&mouseX<=width/2) {
      fill(0);
      text("display", width*3/8+12, 57);
      if (click==1) menuKind=1;
    } else if (mouseX>=width/2&&mouseX<=width*3/4-24) {
      fill(0);
      text("sound", width*5/8-12, 57);
      if (click==1) menuKind=2;
    } else if (mouseX>=width*3/4-24&&mouseX<width-48) {
      fill(0);
      text("network", width*7/8-36, 57);
      if (click==1) menuKind=3;
    }
  }
}

void showBlock() {
  int i, j, round=0;
  fill(255);
  noStroke();
  rect(248, 0, 640, 640); //game display
  for (i=1; i<12; i++) { //show block!
    for (j=1; j<12; j++) {
      fill(255);
      if (blk[i][j]==1) fill(103, 212, 136); 
      else if (blk[i][j]==2) fill(255, 0, 0);
      else if (blk[i][j]==3) fill(0, 0, 255);
      rect(204+i*57, -44+j*57, 44, 44);
    }
  }
  fill(255);
  rect(204+lastBlockX*57, -44+lastBlockY*57, 44, 44);
  if (blk[lastBlockX][lastBlockY]==2) fill(255, 0, 0);
  else fill(0, 0, 255);
  rect(204+lastBlockX*57, -44+lastBlockY*57, 44, 44, 11);
}

void aWin() {

  fill(255);
  noStroke();
  rect(0, 0, 248, 640);
  fill(255, 0, 0);
  text("A win!!", 124, 300);

  fill(193, 243, 214);     
  rect(0, 540, 248, 100); 
  textSize(60);
  fill(0);     
  text("Replay?", 124, 590);

  if (click==1&&mouseX<248&&mouseY>540) {
    gmod=0;
    reset();
  }
}

void bWin() {

  fill(255);
  noStroke();
  rect(888, 0, 248, 640);
  fill(0, 0, 255);
  text("B win!!", 1012, 300);


  fill(193, 243, 214);     
  rect(888, 540, 248, 100);
  textSize(60);
  fill(0);     
  text("Replay?", 1012, 590);

  if (click==1&&mouseX>888&&mouseY>540) {
    gmod=0;
    reset();
  }
}

void reset() {
  statemod=1;
  //block setting
  int i, j;
  for (i=1; i<12; i++)
    for (j=1; j<12; j++)
      blk[i][j]=1;
  // 4 corner of quod is blank
  blk[1][1]=0;
  blk[1][11]=0;
  blk[11][1]=0;
  blk[11][11]=0;


  //time left pannel x,y-coordinate
  timeAx=124;
  timeAy=130;
  timeBx=1012;
  timeBy=130;

  timeCache=0;//time cache, for click delay

  quazA=6;
  quazB=6;
  click=0;
  gmod=0;
  turn=-1;
}

void readText(){
  int i=0;
  int readableCache=1;
  while(readableCache==1){
    
    try {
    Settings[i] = reader.readLine();
  } catch (IOException e) {
    e.printStackTrace();
    Settings[i] = null;
  }
  if(Settings[i] == null) readableCache=0;
  i++;
  }
  
}

void indexText(){
  int i=0;
  while(Settings[i]!=null){
    String indexTextCache[] = split(Settings[i], ":");
    Settings[i]=trim(indexTextCache[1]);
    i++;
  }

}