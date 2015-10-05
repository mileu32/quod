//chkQd : check if there is quod, if yes : 0, no : 1;
//state
void state() {
  textAlign(RIGHT, CENTER);
  textSize(30);
  fill(0);
  text("server", width-60, 50);
  stroke(255);
  strokeWeight(3);
  if (myClient.active()==true) fill(0, 255, 0);
  else fill(255, 0, 0);
  ellipse(width-50, 50, 20, 20);
}
void chkQd(int aorb) {
  int i, j, k, l, m, n, x, y, z, w;
  int round=0;
  noStroke();
  for (i=1; i<12; i++) { //show block!
    for (j=1; j<12; j++) {
      if (blk[i][j]==1) {
        fill(103, 212, 136); 
        rect(204+i*57, -44+j*57, 44, 44);
      } else if (blk[i][j]==2) {
        fill(255, 0, 0);
        round=0;
        if (i==lastBlockX&&j==lastBlockY) round=44/4;
        rect(204+i*57, -44+j*57, 44, 44, round);
      } else if (blk[i][j]==3) {
        fill(0, 0, 255);
        round=0;
        if (i==lastBlockX&&j==lastBlockY) round=44/4;
        rect(204+i*57, -44+j*57, 44, 44, round);
      }
    }
  }

  if (aorb==0) {
    stroke(255, 0, 0);
  }
  if (aorb==1) {
    stroke(0, 0, 255);
  }

  strokeWeight(5);

  //check quod in player A
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (blk[i][j]==2) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// blk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              if (blk[k][l]==2&&blk[i-j+l][i+j-k]==2&&blk[l+k-j][l-k+i]==2) {
                line(226+i*57, -22+j*57, 226+k*57, -22+l*57);
                line(226+k*57, -22+l*57, 226+(l+k-j)*57, -22+(l-k+i)*57);
                line(226+(l+k-j)*57, -22+(l-k+i)*57, 226+(i-j+l)*57, -22+(i+j-k)*57);
                line(226+(i-j+l)*57, -22+(i+j-k)*57, 226+i*57, -22+j*57);
                gmod=aorb+5;//it ends here
              }
            }
          }
        }
      }
    }
  }

  //check quod in player B
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (blk[i][j]==3) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// blk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              if (blk[k][l]==3&&blk[i-j+l][i+j-k]==3&&blk[l+k-j][l-k+i]==3) {
                line(226+i*57, -22+j*57, 226+k*57, -22+l*57);
                line(226+k*57, -22+l*57, 226+(l+k-j)*57, -22+(l-k+i)*57);
                line(226+(l+k-j)*57, -22+(l-k+i)*57, 226+(i-j+l)*57, -22+(i+j-k)*57);
                line(226+(i-j+l)*57, -22+(i+j-k)*57, 226+i*57, -22+j*57);
                gmod=aorb+5;//it ends here, 5:A win, 6:B win
              }
            }
          }
        }
      }
    }
  }
}