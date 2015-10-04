//aWin, bWin : show, A, B win
//showBlock : show gameboard
//menu
void menu() {
  noStroke();
  fill(230, 158, 122);
  rect(32, 18, width-64, height-36);
  fill(241, 232, 212);
  rect(48, 27, width-96, height-54);
  switch(escmod) {
  case 0:
    fill(255, 159, 113);
    rect(48, 27, width/4-24, 60);
    fill(255, 198, 117);
    rect(width/4+24, 27, width/4-24, 60);
    rect(width/2, 27, width/4-24, 60);
    rect(width/4*3-24, 27, width/4-24, 60);
    textSize(48);
    fill(0);
    text("info", width/8+36, 57);
    text("quod v0.4.0b2", width/2, 120);
    text("this software is by mileu", width/2, 192);
    text("OST by Lepellec dominique", width/2, 264);
    image(License, width/2, 350);
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
  if(blk[lastBlockX][lastBlockY]==2) fill(255, 0, 0);
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