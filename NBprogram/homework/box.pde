class box{
  Body body;
  float w;
  float h;
  float x;
  float y;
  float restitution;
  float friction;
  boolean SORD;
  float density;
  box(float _x,float _y,float _w,float _h,float _restitution,float _friction,boolean sord,float den){
    x=_x;
    y=_y;
    w=_w;
    h=_h;
    density=den;
    SORD=sord;
    restitution=_restitution;
    friction=_friction;
    makebody();
  }
  void makebody()
  {
    PolygonShape sd=new PolygonShape();
    float box2dw=box2d.scalarPixelsToWorld(w/2);
    float box2dh=box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dw,box2dh);
    
    FixtureDef fd=new FixtureDef();
    fd.shape=sd;
    fd.friction=friction;
    fd.restitution=restitution;
    fd.density=density;
    BodyDef bd=new BodyDef();
    if(SORD==true)bd.type=BodyType.DYNAMIC;
    else bd.type=BodyType.STATIC;

    bd.position.set(box2d.coordPixelsToWorld(new Vec2(x,y)));
    
    body=box2d.createBody(bd);
    body.createFixture(fd);
  }
  void killBody() {
    box2d.destroyBody(body);
  }
  void display(){
    Vec2 pos=box2d.getBodyPixelCoord(body);
    float a=body.getAngle();
    
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    noStroke();
    fill(175,100,100);
    rect(0,0,w,h);
    popMatrix();
  }
  
  
}