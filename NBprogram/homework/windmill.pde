class Windmill{
  RevoluteJoint joint;
  BoxFWM box1;
  BoxFWM box2;
  Windmill(float x,float y,boolean motor,float power,float clo)
  {
    box1 = new BoxFWM(x, y, 240, 20, false); 
    box2 = new BoxFWM(x, y, 10, 10, true); 

    // Define joint as between two bodies
    RevoluteJointDef rjd = new RevoluteJointDef();

    //Vec2 offset = box2d.vectorPixelsToWorld(new Vec2(0, 60));

    rjd.initialize(box1.body, box2.body, box1.body.getWorldCenter());

    // Turning on a motor (optional)
    rjd.motorSpeed = PI*clo;// how fast?
    rjd.maxMotorTorque = power; // how powerful?
    rjd.enableMotor = motor;      // is it on?

    // There are many other properties you can set for a Revolute joint
    // For example, you can limit its angle between a minimum and a maximum
    // See box2d manual for more

      // Create the joint
    joint = (RevoluteJoint) box2d.world.createJoint(rjd);
  
  }
  void display() {
    box2.display();
    box1.display();

    // Draw anchor just for debug
    Vec2 anchor = box2d.coordWorldToPixels(box1.body.getWorldCenter());
    fill(255, 0, 0);
    stroke(0);
    ellipse(anchor.x, anchor.y, 4, 4);
  }
  void killbody()
  {
    box1.killBody();
    box2.killBody();
  }
  
  
  
}