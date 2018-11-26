void ch1()
{
  points.add(new point(200,160));
  points.add(new point(300,160));
  points.add(new point(400,160));
  points.add(new point(500,160));
  points.add(new point(600,160));
  points.add(new point(700,160));
  points.add(new point(1500,700));
  points.add(new point(1400,160));
  points.add(new point(1800,500));
  points.add(new point(1900,600));
  boundaries.add(new boundary(width,0,2400,10,0,0.5));//top
  boundaries.add(new boundary(400,200,800,10,0,0.5));
  boundaries.add(new boundary(800,500,10,610,0.0,0.5));
  boundaries.add(new boundary(950,700,10,350,1,10));
  boundaries.add(new boundary(width,800,2400,10,0,0.5));//bottom
  boundaries.add(new boundary(1600,500,10,610,0.0,0.5));
  boundaries.add(new boundary(5,height/2,10,800,0.0,0.5));
  boundaries.add(new boundary(2400,height/2,10,800,0,0.5));
  bridges.add(new Bridge(1200,400,1600,200,10,0.8));
  goalx=2300;
  goaly=700;
}