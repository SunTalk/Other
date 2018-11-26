class Bridge{
  int totalb;
  ArrayList<Particle> particles;
  float len;
  float startx,starty;
  float fx,fy;
  float r;
  float bounce;
  Bridge(float x,float y,float x2,float y2,float radius,float _bounce)
  {
    bounce=_bounce;
    startx=x;
    starty=y;
    fx=x2;
    fy=y2;
    r=radius;
    len=dist(x,y,x2,y2);
    totalb=(int)(len/(radius*2));
    particles= new ArrayList();
    makebody();
  }
  void makebody()
  {
    float jointlen=len/totalb;
    float ox=(fx-startx)/totalb,oy=(fy-starty)/totalb;
    for(int i=0;i<totalb+1;i++)
    {
      Particle p=null;
      if(i==0 || i==totalb) p=new Particle(i*ox+startx,i*oy+starty,r,true,bounce,1);
      else p=new Particle(i*ox+startx,i*oy+starty,r,false,bounce,1);
      particles.add(p);
      
      if(i>0)
      {
        DistanceJointDef djd=new DistanceJointDef();
        Particle previous=particles.get(i-1);
        djd.bodyA =previous.body;
        djd.bodyB=p.body;
        djd.length=box2d.scalarPixelsToWorld(jointlen);
        djd.frequencyHz=0;
        djd.dampingRatio=0;
        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
      }
    }
  }
  void killBody() {
    for(Particle a:particles)
    {
      a.killBody();
    }
    
  }
  void display() {
    for (Particle p: particles) {
      p.display();
    }
  }
}