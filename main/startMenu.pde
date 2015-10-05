//statM : start menu
void statM() {
  statemod=1;
  if (clicked==0) {

    background(184, 241, 241);
    fill(23, 93, 126);
    textSize(120);
    textAlign(CENTER, CENTER);
    text("Quod", width/2, 120);
    textSize(48);
    fill(0);
    text("click to start", width/2, 600);
  } else if (clicked>=1) {

    clicked = 1;
    background(184, 241, 241);
    textSize(120);
    noStroke();
    fill(23, 93, 126);
    textAlign(CENTER, CENTER);
    text("Quod", width/2, 120);
    fill(255, 206, 160);
    rect(width/2-140, 300, 280, 70);
    rect(width/2-140, 380, 280, 70);
    rect(width/2-140, 460, 280, 70);
    fill(0);
    textSize(48);
    text("Local Play", width/2, 335);
    text("Online Play", width/2, 415);
    text("Help", width/2, 495);


    if (mouseX>(width/2-140)&&mouseX<(width/2+140)) {
      fill(241, 232, 212);
      if (mouseY>300&&mouseY<370) {
        rect(width/2-140, 300, 280, 70);
        if (click==-1) {
          gmod=1;
          click=0;
          clicked=2;
        }
      } else if (mouseY>380&&mouseY<450) {
        rect(width/2-140, 380, 280, 70);
        if (myClient.active()==false) {
          fill(255, 0, 0);
          textAlign(CENTER, CENTER);
          textSize(24);
          text("server connection fail", width/2, 415);
        } else if (click==-1) {
          gmod=2;
          click=0;
          clicked=2;
        }
      } else if (mouseY>460&&mouseY<530) {
        rect(width/2-140, 460, 280, 70);
      }
    }
  }
}