player you1;
Money[] money = new Money[20];
CoinD[] coinD = new CoinD[20];
CoinD[] trumpD = new CoinD[20];
Money[] trumpF = new Money[20];

//catch falling money but avoid the fakemoney

int randomNumber1;
boolean dropM;

Money sampleMoney;
CoinD sampleCoinDispencer;
void setup()
{
  fullScreen();
  you1 = new player(9, 10, true);

  for (int i=0; i<20; i++)
  {
    coinD[i] = new CoinD(90*i+20, 100, random(20, 30));
    money[i] = new Money(coinD[i].Dx, coinD[i].Dy, 9);
  }


  for (int i=0; i<8; i++)
  {
    trumpD[i] = new CoinD(90*i+20, 100, random(20, 30));
    trumpF[i] = new Money(trumpD[i].Dx, trumpD[i].Dy, 9, 2);
  }
}

void draw()
{
  background(255, 255, 0);
  walls();

  you1.render();
  you1.Move();
  you1.wallBlock();
  you1.jump();

  for (int i=0; i<20; i++)
  {
    money[i].Move();
    money[i].DMoney();
    coinD[i].Move();
  }

  for (int i=0; i<8; i++)
  {
    trumpD[i].Move();
    trumpF[i].Move2();
    trumpF[i].DMoney2();
  }

  MoneyD();

  gotMoney();

  trumpD();
}

void gotMoney()
{
  for (int i=0; i<8; i++)
  {
    if (money[i].My > you1.Py-20 && money[i].Mx < you1.Px+50)
    {
      money[i].Mx=coinD[i].Dx;
      money[i].My=coinD[i].Dy;
    }
    
     else if (money[i].My > you1.Py-20 && money[i].Mx > you1.Px-15)
    {
      money[i].Mx=coinD[i].Dx;
      money[i].My=coinD[i].Dy;
    }
    
     else if (money[i].My < you1.Py+15 && money[i].Mx > you1.Px-15)
    {
      money[i].Mx=coinD[i].Dx;
      money[i].My=coinD[i].Dy;
    }
         
     else if (money[i].My < you1.Py+15 && money[i].Mx < you1.Px+50)
    {
      money[i].Mx=coinD[i].Dx;
      money[i].My=coinD[i].Dy;
    }
    
  }
}

void trumpD()
{
  for (int i=0; i<8; i++)
  {
    if (millis()-trumpF[i].DTime>trumpF[i].reloadingTime)
    {
      trumpF[i].Mx=trumpD[i].Dx;
      trumpF[i].My=trumpD[i].Dy;
      trumpF[i].DTime=millis();
      trumpF[i].drop=true;
    }
  }
}

void MoneyD()
{
  for (int i=0; i<20; i++)
  {
    if (millis()-money[i].DTime > money[i].reloadingTime)
    {
      money[i].Mx=coinD[i].Dx;
      money[i].My=coinD[i].Dy;
      money[i].DTime=millis();
      money[i].drop=true;
    }
  }
}

void walls()
{
  fill(0);
  rect(0, height-150, width, 150);
}