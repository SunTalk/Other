int ellipsey=100;
int ellipsex=600;
void setting()
{
  fill(255);
  rectMode(CENTER);
  rect(800,100,600,100);
  rect(800,200,600,100);
  rect(800,300,600,100);
  rect(800,400,600,100);
  rect(800,500,600,100);
  rect(800,600,600,100);
  rect(800,700,600,100);
  textSize(40);
  text("point: "+point,0,60);
  text("gravity: "+gravity,60,200);
  text("jump high : "+jumphigh,60,300);
  text("jump cd: "+jumpcd/1000+" s",60,400);
  String temp=nf(mainbrestitution,1,3);
  text("restitution: "+temp,60,500);
  fill(0);
  textSize(50);
  ellipse(ellipsex,ellipsey,20,20);
  text("gravity-10",650,110);
  text("gravity+10",650,210);
  text("jumphigh+100",650,310);
  text("jumphigh-100",650,410);
  text("jumpcd-1",650,510);
  text("restitution+0.05",650,610);
  text("restitution-0.05",650,710);
  if(point==0) ifsetfin=true;
  box2d.setGravity(-gravity*sin(nowang), gravity*cos(nowang));
}
/*void mouseClicked()
{
  if(mouseX>=500 && mouseX<=1100 && mouseY>=50&& mouseY<=150)
  {
    point--;
    gravity-=10;
  }
  if(mouseX>=500 && mouseX<=1100 && mouseY>=150&& mouseY<=250)
  {
    point--;
    gravity+=10;
  }
  if(mouseX>=500 && mouseX<=1100 && mouseY>=250&& mouseY<=350)
  {
    point--;
    jumphigh+=100;
  }
  if(mouseX>=500 && mouseX<=1100 && mouseY>=350&& mouseY<=450)
  {
    point--;
    jumphigh-=100;
  }
  if(mouseX>=500 && mouseX<=1100 && mouseY>=450&& mouseY<=550)
  {
    point--;
    jumpcd-=100;
  }
  if(mouseX>=500 && mouseX<=1100 && mouseY>=550&& mouseY<=650)
  {
    if(mainbrestitution<0.9)
    {
      point--;
      mainbrestitution+=0.05;
    }
  }
  if(mouseX>=500 && mouseX<=1100 && mouseY>=650&& mouseY<=750)
  {
      if(mainbrestitution>0.16)
      {
        point--;
        mainbrestitution-=0.05;
      }
  }
}*/