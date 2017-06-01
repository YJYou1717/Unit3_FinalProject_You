class Money
{
  float Mx=0;
  float My=0;
  float MVy=7;
  float DTime;
  float reloadingTime;
  boolean drop;
  PShape m;
  float f2;

  PImage dollar;
  PImage trump1;
  PImage trumpFace;

  Money()
  {
    Mx=0;
    My=0;
    m = new PShape();
    m = createShape();
    m.beginShape();
    m.noStroke();
    m.vertex(0, 0);
    m.endShape(CLOSE);
    shape(m, Mx, My);
  }

  Money(float _Mx, float _My, float _MVy)
  {
    Mx=_Mx;
    My=_My;
    MVy=_MVy;
    Mx=0;
    My=0;
    DTime=0;
    reloadingTime=random(1000, 3000);
    dollar=loadImage("dollar.png");
    dollar.resize(100, 50);
    drop=true;
  }

  Money(float _Mx, float _My, float _MVy, float _f2)
  {
    Mx=_Mx;
    My=_My;
    MVy=_MVy;
    f2=_f2;
    Mx=0;
    My=0;
    DTime=0;
    reloadingTime=random(1000, 3000);
    trumpFace=loadImage("trumpFace.png");
    trumpFace.resize(100, 50);
    drop=true;
  }

  void Move()
  {
    image(dollar, Mx, My);
  }

  void Move2()
  {
    image(trumpFace, Mx, My);
  }


  void DMoney()
  {

    drop=true;
    if (drop==true)
    {
      My+=MVy;
      for (int i=0; i<8; i++)
      {
        if (My>=coinD[i].Dy)
        {
          drop=false;
        }
      }
    }
  }
  

 

  void DMoney2()
  {

    drop=true;
    if (drop==true)
    {
      My+=MVy;
      for (int i=0; i<8; i++)
      {
        if (My>=trumpD[i].Dy)
        {
          drop=false;
        }
      }
    }
  }
}