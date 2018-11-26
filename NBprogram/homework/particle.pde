// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2012
// Box2DProcessing example

// A circular particle

class Particle {

  // We need to keep track of a Body and a radius
  Body body;
  float r;
  boolean canjump=true;
  float njtime;
  float jump=600;
  boolean sord=false;
  float bounce;
  float density;

  Particle(float x, float y, float r_,boolean _sord,float _bounce,float den) {
    r = r_;
    sord=_sord;
    bounce=_bounce;
    density=den;
    // This function puts the particle in the Box2d world
    makeBody(x,y,r);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  void jump()
  {
    if(canjump==true)
    {
      body.applyLinearImpulse(new Vec2(0, jump),body.getPosition(),false);
      njtime=millis();
      canjump=false;
    }
  }
  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }

  // 
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    // Let's add a line so we can see the rotation
    //line(0,0,r,0);
    popMatrix();
  }

  // Here's our function that adds the particle to the Box2D world
  void makeBody(float x, float y, float r) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x,y);
    if(sord==false) bd.type = BodyType.DYNAMIC;
    else bd.type = BodyType.STATIC;
    body = box2d.world.createBody(bd);
    
    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = density;
    fd.friction = 0.01;
    fd.restitution = bounce;
    
    // Attach fixture to body
    body.createFixture(fd);

    // Give it a random initial velocity (and angular velocity)
    body.setLinearVelocity(new Vec2(random(-10f,10f),random(5f,10f)));
    body.setAngularVelocity(random(-10,10));
  }






}