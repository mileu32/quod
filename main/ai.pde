//ai.. sorry this doesn't have any algorithm..
void ai1(int player, int level, double score) { //player 0 is person, 1 is computer
  int i, j, k, l, m, n, x, y, z, w;
  //check quod in player A
  if (level>2) {
    if (score>=aiScore) {
      aiScore=score;
      aiansX=aicacheX;
      aiansY=aicacheY;
    }
    return;
  }

  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (aiBlk[i][j]==2) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// aiBlk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              if (aiBlk[k][l]==2&&aiBlk[i-j+l][i+j-k]==2&&aiBlk[l+k-j][l-k+i]==2) {
                score-=1;
              }
            }
          }
        }
      }
    }
  }
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (aiBlk[i][j]==3) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// aiBlk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              if (aiBlk[k][l]==3&&aiBlk[i-j+l][i+j-k]==3&&aiBlk[l+k-j][l-k+i]==3) {
                score+=1;
              }
            }
          }
        }
      }
    }
  }
  for (i=1; i<=12; i++) {
    for (j=1; j<12; j++) {
      if (aiBlk[i][j]==1) {
        aiBlk[i][j]=3-player;
        level+=1;
        score*=2;
        ai1(1-player, level, score);
        level-=1;
        score/=2;
        aiBlk[i][j]=1;
      }
    }
  }
}




void ai() {
  int i, j, k, l, m, n, x, y, z, w;

  int colorblock = 1; // check if computer have left blocks
  int aiX[] = new int[100];
  int aiY[] = new int[100];
  m = 0; // number that maybe attacked next time

  aiScore=0;
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      aiBlk[i][j]=blk[i][j];
    }
  }



  //check quod in player A next time
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (blk[i][j]==2) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// blk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              if (blk[k][l]==2&&(blk[i-j+l][i+j-k]==2||blk[l+k-j][l-k+i]==2)) {
                if (blk[i-j+l][i+j-k]==2&&blk[l+k-j][l-k+i]==1) {
                  m+=1;
                  aiX[m]=l+k-j;
                  aiY[m]=l-k+i;
                }
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
              if (colorblock==1&&blk[k][l]==3&&(blk[i-j+l][i+j-k]==3||blk[l+k-j][l-k+i]==3)) {
                if (blk[i-j+l][i+j-k]==3&&blk[l+k-j][l-k+i]==1) {
                  aiansX=l+k-j;
                  aiansY=l-k+i;
                  colorblock-=1;
                  m=-1;
                }
              }
            }
          }
        }
      }
    }
  }


  if (m>0) {

    while (m>0) {

      if (quazB>=1&&blk[aiX[m+1]][aiY[m+1]]==1) {

        blk[aiX[m+1]][aiY[m+1]]=0;
        quazB=quazB-1;
      }
      m-=1;
    }
    if (colorblock==1) {
      aiansX=aiX[1];
      aiansY=aiY[1];
    }
    m=-1;
  } else if (m==0) {

    for (i=1; i<=12; i++) {
      for (j=1; j<12; j++) {
        if (aiBlk[i][j]==1) {
          double score=0;
          if (i>3&&i<9&&j>3&&j<9) score=0.1;
          aiBlk[i][j]=3;
          aicacheX=i;
          aicacheY=j;
          ai1(1, 0, score);
          aiBlk[i][j]=1;
        }
      }
    }
  }
  aiFinish=1;
}