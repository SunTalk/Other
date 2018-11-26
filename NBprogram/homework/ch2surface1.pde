class Surface {
  // We'll keep track of all of the surface points
  ArrayList<Vec2> surface;
  Body body;

  Surface() {
  

  }
  void makebody1()
  {
      surface=new ArrayList<Vec2>();
     ChainShape chain=new ChainShape();
     float theta=0;
     surface.add(new Vec2(-200,height-400));
     for(int x=500;x<900;x+=10)
     {
       float y=map(cos(theta),-1,1,0,height-400);
       theta+=0.15;
       surface.add(new Vec2(x,y));
     }
     surface.add(new Vec2(2400,height-400));
    Vec2[] vertices =new Vec2[surface.size()];
    for(int i=0;i<vertices.length;i++)
    {
      Vec2 edge=box2d.coordPixelsToWorld(surface.get(i));
      vertices[i]=edge;
    }
    chain.createChain(vertices,vertices.length);
  
    BodyDef bd=new BodyDef();
    bd.position.set(0.0f,0.0f);
    body=box2d.createBody(bd);
    body.createFixture(chain,1);
  }
  
  
  void makebody2()
  {
    surface=new ArrayList<Vec2>();
   ChainShape chain=new ChainShape();
   float theta=0;
   surface.add(new Vec2(-200,height+200));
   for(int x=600;x<1700;x+=10)
   {
     float y=map(cos(theta),-1,1,height,height+400);
     theta+=0.06;
     surface.add(new Vec2(x,y));
   }
   surface.add(new Vec2(2500,height+400));
  Vec2[] vertices =new Vec2[surface.size()];
  for(int i=0;i<vertices.length;i++)
  {
    Vec2 edge=box2d.coordPixelsToWorld(surface.get(i));
    vertices[i]=edge;
  }
  chain.createChain(vertices,vertices.length);
  
  BodyDef bd=new BodyDef();
  bd.position.set(0.0f,0.0f);
  body=box2d.createBody(bd);
  body.createFixture(chain,1);
  }

  // A simple function to just draw the edge chain as a series of vertex points
  void display() {
    strokeWeight(2);
    stroke(255);
    noFill();
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x,v.y);
    }
    endShape();
  }
  void killBody() {
    box2d.destroyBody(body);
  }

}