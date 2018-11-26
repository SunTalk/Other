void ch3()
{
  boundaries.add(new boundary(0,0,10,2400,0,0.5));
  boundaries.add(new boundary(2400,0,10,2200,0,0.5));
  boundaries.add(new boundary(2400,-1100,4800,10,0,0.5));
  boundaries.add(new boundary(2400,1200,4800,10,0,0.5));
  boundaries.add(new boundary(130,15,260,10,0,0.5));
  boundaries.add(new boundary(4800,0,10,2400,0,0.5));
  boundaries.add(new boundary(2750,900,700,10,0,1200));
  boundaries.add(new boundary(2700,100,800,10,0.7,1000));
  windmills.add(new Windmill(360,0,true,800,2));
  windmills.add(new Windmill(1200,200,true,1200,4));
  boxes.add(new box(2200,200,400,30,0.3,200,false,1));
  boxes.add(new box(1600,400,300,30,0.3,200,false,1));
  boxes.add(new box(175,350,300,30,0.3,0.5,false,1));
  boxes.add(new box(3100,400,400,50,0.3,200,false,1));
  boxes.add(new box(3250,275,80,200,0,3,true,200));
  boxes.get(boxes.size()-1).body.m_flags=36;
  bridges.add(new Bridge(300,350,600,600,5,0));
  bridges.add(new Bridge(600,600,900,380,5,0));
  bridges.add(new Bridge(2400,200,1200,800,20,0));
  bridges.add(new Bridge(1200,800,400,800,20,0));
  bridges.add(new Bridge(4770,-300,3000,1150,15,0));
  points.add(new point(2300,160));
  points.add(new point(2250,160));
  points.add(new point(2200,160));
  points.add(new point(2150,160));
  points.add(new point(1500,360));
  points.add(new point(1550,360));
  points.add(new point(210,320));
  points.add(new point(260,320));
  points.add(new point(150,320));
  points.add(new point(80,320));
  points.add(new point(400,750));
  points.add(new point(500,780));
  points.add(new point(600,810));
  points.add(new point(700,1170));
  points.add(new point(500,1170));
  points.add(new point(300,1170));

  goalx=4400;
  goaly=1000;
}                                                                                                   