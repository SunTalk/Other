class point{
  float x,y;
  float size;
  boolean exist;
  point(float _x,float _y)
  {
    x=_x;
    y=_y;
    size=50;
    exist=true;
  }
  void hide()
  {
    exist=false;
  }
  void display()
  {
    if(exist==true)
    {
      fill(255,0,0);
      ellipse(x,y,size,size);
    }
  }
}