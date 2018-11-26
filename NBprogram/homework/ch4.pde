void ch4()
{
  boundaries.add(new boundary(0,0,10,2400,0,0.5));
  boundaries.add(new boundary(2400,-1100,4800,10,0,0.5));
  boundaries.add(new boundary(2400,1200,4800,10,0,0.5));
  boundaries.add(new boundary(4800,0,10,2400,0,0.5));
  //boundaries.add(new boundary(400,300,800,10,0,0.5));
 // boundaries.add(new boundary(800,750,10,900,0,0.5));
  boundaries.add(new boundary(4200,300,1200,10,0,0.5));
  boundaries.add(new boundary(3600,750,10,900,0,0.5));
  boundaries.add(new boundary(1500,-200,3000,10,0,0.5));
  boundaries.add(new boundary(1000,1000,400,10,-0.6,1.5));
  boundaries.add(new boundary(1800,1000,10,800,1.11,0));
  boundaries.add(new boundary(600,-600,800,10,0,0));
  boundaries.add(new boundary(100,-300,200,10,0,6));
  bridges.add(new Bridge(1000,-600,1200,-200,20,0));
  particles.add(new Particle(1900,700,180,false,0,600));
  boxes.add(new box(2600,900,650,650,0.0,2,true,200));
  particles.add(new Particle(4600,-200,400,false,0,600));
  
  
  goalx=100;
  goaly=-800;
  
  
  
  
}