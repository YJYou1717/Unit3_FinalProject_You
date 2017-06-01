class player
{
  float Px;
  float Py;
  float PVx;
  float PVy;

  boolean moveTF;
  boolean WBlock;
  boolean GForce;
  boolean upMove;
  PShape s;

  player()
  {
    Px=width/2;
    Py=height-170;
    fill(0); 
    ellipse(Px-11, Py+16, 10, 10);
    ellipse(Px+40, Py+16, 10, 10);
    fill(#2CE8FF);   
    s = new PShape();
    s = createShape();
    s.beginShape();
    s.noStroke();
    s.vertex(0, 0);
    s.vertex(0, -20);
    s.vertex(-15, -20);
    s.vertex(-22, 0);
    s.vertex(-22, 15);
    s.vertex(50, 15);
    s.vertex(50, 0);
    s.endShape(CLOSE);
    shape(s, Px, Py);
  } 

  player(float _PVx, float _PVy, boolean grav)
  {
    GForce=grav;
    PVx=_PVx;
    PVy=_PVy;
    Px=width/2;
    Py=height-170;
    s = new PShape();
    s = createShape();
    s.beginShape();
    s.noStroke();
    s.vertex(0, 0);
    s.vertex(0, -20);
    s.vertex(-15, -20);
    s.vertex(-22, 0);
    s.vertex(-22, 15);
    s.vertex(50, 15);
    s.vertex(50, 0);
    s.endShape(CLOSE);
    GForce=false;
  } 

  void render()
  {
    fill(#2CE8FF);  
    shape(s, Px, Py);
    fill(0); 
    ellipse(Px-11, Py+16, 10, 10);
    ellipse(Px+40, Py+16, 10, 10);
  }

  void Move()
  {
    if (keyPressed)
    {
      if (key==' ')
      {
        moveTF=false;
      } 
      
      else
      {
        moveTF=true;
      }
    }

    if (moveTF==true && WBlock==true)
    {
      if (key=='a')
      {
        Px-=PVx;
      }

      if (key=='d')
      {
        Px+=PVx;
      }
    }
  }

  void wallBlock()
  {
    if (Px<21)
    {
      WBlock=false;
      Px=22;
    } 
    
    else if (Px>width-49)
    {
      WBlock=false;
      Px=width-50;
    } 
    
    else
    {
      WBlock=true;
    }
  }

  void jump()
  {   
    if (Py>=height-170)
    {
      GForce=true;
    }


    if (key=='w' && GForce==true)
    {
      Py-=PVy;
    } 
    
    else if (GForce==false)
    {
      Py+=PVy;
    }    

    if (Py<=height-300)
    {
      GForce=false;
    }

    if (key=='a' && GForce==true)
    {
      GForce=false;
    }

    if (key=='d' && GForce==true)
    {
      GForce=false;
    }
  }
}