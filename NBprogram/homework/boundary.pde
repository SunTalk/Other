class boundary{
float x;
float y;
float w;
float h;
float restitution;
Body b;
boundary(float _x,float _y,float _w,float _h,float a,float _restitution)
{
  x=_x;
  y=_y;
  w=_w;
  h=_h;
  restitution=_restitution;
  PolygonShape sd=new PolygonShape(); 
  float box2dw=box2d.scalarPixelsToWorld(w/2);
  float box2dh=box2d.scalarPixelsToWorld(h/2);  
  sd.setAsBox(box2dw,box2dh);
  
  BodyDef bd=new BodyDef();
  bd.type=BodyType.STATIC;
  bd.angle=a;
  bd.position.set(box2d.coordPixelsToWorld(x,y));
  b = box2d.createBody(bd);
  FixtureDef fd = new FixtureDef();
  fd.shape=sd;
  fd.restitution=restitution;
  b.createFixture(fd);
}
  void display() {
    if(restitution<1) fill(255);
    else fill(0,255,0);
    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);

    float a = b.getAngle();

    pushMatrix();
    translate(x,y);
    rotate(-a);
    rect(0,0,w,h);
    popMatrix();
  }
  void killBody() {
    box2d.destroyBody(b);
  }
  float rrestitution()
  {
    return restitution;
  }
  


}