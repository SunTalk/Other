import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;
import ddf.minim.*;
AudioPlayer player;//music
Minim minim;

Box2DProcessing box2d;
mainbParticle mainb;
float nowx=0;
float nowy=0;
float nowang=0;

float nowscale=0.2;
float mbr=20;
float mainbhp=1200;
boolean l=false, r=false, jum=false;
Vec2 pos;
ArrayList <boundary> boundaries;
ArrayList <Bridge> bridges;
ArrayList<Surface> surfaces;
ArrayList<box> boxes;
ArrayList<ParticleSystem> systems;
ArrayList<point> points;
ArrayList<Windmill> windmills;
ArrayList<Particle> particles;
float goalx=2300;
float goaly=700;
int ch=3;
boolean clear=true;
boolean big=false;
boolean small=false;
boolean die=false;
int score=0;

int point=5;
float mainbrestitution=0.2;
float jumpcd=1300;
float jumphigh=600;
float gravity=-60;
boolean ifsetfin=false;
float starttime=0;
float savetime=0;
boolean win=false;

float mainbsound=millis();//jump sound
void setup()
{
  size(1200, 800);
  minim = new Minim(this);
  boundaries=new ArrayList<boundary>();
  bridges=new ArrayList<Bridge>();
  surfaces=new ArrayList<Surface>();
  boxes=new ArrayList<box>();
  systems=new ArrayList<ParticleSystem> ();
  points=new ArrayList<point> ();
  windmills=new ArrayList<Windmill>();
  particles=new ArrayList<Particle>();
  box2d=new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(-gravity*sin(nowang), gravity*cos(nowang));
  mainb=new mainbParticle(80, 10, mbr, false, mainbrestitution,jumphigh);
}
void draw()
{
  background(0);
  if (die==true)
  {
    fill(255, 0, 0);
    textSize(50);
    text("LOSE", 500, 400);
  } 
  else if(win==true)
  {
    textSize(50);
    text("record: "+savetime/1000,350,400);
  }
  else if(ifsetfin==false)
  {
    setting();
  }
  else {
    ContactEdge listen=mainb.body.getContactList();
    for(;listen!=null;listen=listen.next)
    {
      Fixture f=listen.contact.getFixtureA();
      if(f.getRestitution()>=1 && millis()-mainbsound>800 && listen.contact.isTouching()==true)
      {
        mainbsound=millis();
        player = minim.loadFile("jump.mp3");
        player.play();
      }
    }
    


    textSize(50);
    text("HP",10,60);
    text("time: "+(millis()-starttime+savetime)/1000,10,750);
    fill(255, 0, 0);
    rectMode(CORNER);
    rect(10, 70, mainbhp/5, 20);
    //if(ifsetfin==true) mainbhp-=1;
    if (mainbhp<=0) die=true;
    scale(nowscale);
    if (ch==0 && clear==true)
    {
        starttime=millis();
        ch=1;
        mainb.killBody();
        mainb=new mainbParticle(80, 10, mbr, false, mainbrestitution,jumphigh);
        mainbhp=1200;
        ch1();
        clear=false;
        nowang=0;
    }
    if (ch==1 && clear==true)
    {
      starttime=millis();
      ch=2;
      mainb.killBody();
      mainb=new mainbParticle(80, 10, mbr, false, mainbrestitution,jumphigh);
      mainbhp=1200;
      ch2();
      clear=false;
      nowang=0;
    }
    if (ch==2 && clear==true)
    {
      starttime=millis();
      ch=3;
      mainb.killBody();
      mainb=new mainbParticle(80, 10, mbr, false, mainbrestitution,jumphigh);
      mainbhp=1200;
      ch3();
      clear=false;
      nowang=0;
    }
    if (ch==3 && clear==true)
    {
      starttime=millis();
      ch=4;
      mainb.killBody();
      mainb=new mainbParticle(80, 10, mbr, false, mainbrestitution,jumphigh);
      mainbhp=1200;
      ch4();
      clear=false;
      nowang=0;
    }
    box2d.step();
    //print(boxes.get(boxes.size()-1).body.m_flags);text ch2 final box flag
    pos=mainb.body.getPosition();
    if(ch==3 && -nowx<2400) boxes.get(boxes.size()-1).body.setAwake(false);//keep ch2 final box sleep
    if(ch==4 && -nowx<1200)
    {
      for(Particle a:particles)
      {
        a.body.setAwake(false);
      }
    }//keep ch3 final box sleep
    nowx=-(pos.x+60)*10;
    nowy=(pos.y+40)*10;
    translate(pos.x, pos.y);
    rotate(nowang);
    translate(-pos.x, -pos.y);

    translate((nowx+600)+1200*(1-nowscale), (nowy-300-800*sin(nowang))+(800*(1-nowscale)));



    if (jum==true)
    {
      if (millis()-mainb.njtime>jumpcd) mainb.canjump=true;
      mainb.jump();
    }
    if (l==true && nowang>-(PI/180)*30)
    {
      nowang-=PI/180;
      box2d.setGravity(-gravity*sin(nowang), gravity*cos(nowang));
    }
    if (r==true && nowang<(PI/180)*30)
    {
      nowang+=PI/180;
      box2d.setGravity(-gravity*sin(nowang), gravity*cos(nowang));
    }
    if (big==true && nowscale>0)
    {
      nowscale-=0.005;
    }
    if (small==true && nowscale<1)
    {
      nowscale+=0.005;
    }

    mainb.display();
    for (boundary a : boundaries)
    {
      a.display();
    }
    for (Bridge a : bridges)
    {
      a.display();
    }
    for (Surface a : surfaces)
    {
      a.display();
    }
    for (box a : boxes)
    {
      a.display();
    }
    for (ParticleSystem a : systems)
    {
      a.run();
      int n = (int) random(1, 3);
      a.addParticles(n);
    }
    for (point a : points)
    {
      a.display();
      if (dist(-nowx, 800-nowy, a.x, a.y)<=a.size/2+mbr && a.exist==true)
      {
        a.hide();
        score++;
        mainbhp+=100;
        point++;
      }
    }
    for(Windmill a:windmills)
    {
      a.display();
    }
    for(Particle a:particles)
    {
      a.display();
    }

    fill(255);
    ellipse(goalx, goaly, 50, 50);
    if (dist(goalx, goaly, -nowx, 800-nowy)<mbr+35) {
      clear=true;
      for (boundary a : boundaries)
      {
        a.killBody();
      }
      for (Bridge a : bridges)
      {
        a.killBody();
      }
      for (Surface a : surfaces)
      {
        a.killBody();
      }
      for (box a : boxes)
      {
        a.killBody();
      }
      for (ParticleSystem a : systems)
      {
        a.killBody();
      }
      for(Windmill a:windmills)
      {
        a.killbody();
      }
      for(Particle a:particles)
      {
        a.killBody();
      }
      boundaries.clear();
      bridges.clear();
      surfaces.clear();
      boxes.clear();
      systems.clear();
      points.clear();
      windmills.clear();
      ifsetfin=false;
      savetime=millis()-starttime+savetime;
      if(ch==3) win=true;
    }
  }
}

void keyPressed()
{
  if(ifsetfin==true)
  {
    if (key==' ') 
    {
      jum=true;
    }
    if (keyCode==LEFT ) 
    {
      l=true;
    }
    if (keyCode==RIGHT ) 
    {
      r=true;
    }
    if (key=='z')
    {
      big=true;
    }
    if (key=='x')
    {
      small=true;
    }
  }
  else{
    if(keyCode==LEFT) 
    {
      
      ellipsey-=100;
      if(ellipsey<100) ellipsey=700;
    }
    if(keyCode==RIGHT) 
    {
      ellipsey+=100;
      if(ellipsey>700) ellipsey=100;
    }
    
  }
}
void keyReleased()
{
  if (key==' ') 
  {
    jum=false;
  }
  if (keyCode==LEFT) 
  {
    l=false;
  }
  if (keyCode==RIGHT) 
  {
    r=false;
  }
  if (key=='z')
  {
    big=false;
  }
  if (key=='x')
  {
    small=false;
  }
  if(ifsetfin==false && key==' ')
  {
      if(ellipsey==100)
      {
        point--;
        gravity-=2;
      }
      if(ellipsey==200)
      {
        point--;
        gravity+=2;
      }
      if(ellipsey==300)
      {
        point--;
        jumphigh+=10;
      }
      if(ellipsey==400)
      {
        point--;
        jumphigh-=10;
      }
      if(ellipsey==500)
      {
        point--;
        jumpcd-=10;
      }
      if(ellipsey==600)
      {
        if(mainbrestitution<0.9)
        {
          point--;
          mainbrestitution+=0.05;
        }
      }
     if(ellipsey==700)
     {
         if(mainbrestitution>0.16)
         {
            point--;
            mainbrestitution-=0.05;
          }
      }
   }
}