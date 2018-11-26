class circle{
  Body body;
  float r;
  circle(float _x,float _y)
  {
    r=random(1,30);
    makeBody(new Vec2(_x,_y),r);
  }
  void makeBody(Vec2 center,float r)
  {
    CircleShape circleshape=new CircleShape();
    float rr = box2d.scalarPixelsToWorld(r);
    circleshape.m_radius=rr;
    FixtureDef fd = new FixtureDef();
    fd.shape=circleshape;
    fd.density=1;
    fd.restitution=0.5;
    BodyDef bd=new BodyDef();
    bd.type=BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body=box2d.createBody(bd);
    body.createFixture(fd);
  }
  void display(){
    Vec2 pos=box2d.getBodyPixelCoord(body);
    float a=body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(0,0,255);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(0,0,r,r);
    popMatrix();
  }
};