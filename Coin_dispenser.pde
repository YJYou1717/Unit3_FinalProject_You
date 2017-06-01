class CoinD
{
  float Dx;
  float Dy;
  float DVx;
  
  PShape d;
  
  CoinD()
  {
    Dx=random(0,width);
    Dy=100;
    DVx=15;
    
    fill(100);
    d = new PShape();
    d = createShape();
    d.beginShape();
    d.noStroke();
    d.vertex(-50,-25);
    d.vertex(50,-25);
    d.vertex(50,25);
    d.vertex(-50,25);
    d.endShape(CLOSE);
    shape(d, Dx, Dy);
  }
  
    CoinD(float _Dx, float _Dy, float _DVx)
  {
    Dx=_Dx;
    Dy=_Dy;
    DVx=_DVx;
    
    fill(100);
    d = new PShape();
    d = createShape();
    d.beginShape();
    d.noStroke();
    d.vertex(-50,-25);
    d.vertex(50,-25);
    d.vertex(50,25);
    d.vertex(-50,25);
    d.endShape(CLOSE);

  }
  
  void Move()
  {
    shape(d, Dx, Dy);    
    
    Dx-=DVx;
    
    if (Dx>width)
    {
      DVx*=-1;
    }
    
    if (Dx<0)
    {
      DVx*=-1;
    }
  } 
  
  
   
  
}