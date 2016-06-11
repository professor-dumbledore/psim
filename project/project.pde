import controlP5.*;

ControlP5 cp5;

Slider s1, s2;
Button b;

float u = 100;
float t = 0;
float theta = 45;

boolean myflag=false;

void setup()
{
  size(700, 400);
  noStroke();
  background(0);
  displayGrid();
  cp5 = new ControlP5(this);

  s1=new Slider(cp5, "Initial Velocity")
    .setPosition(50, 50)
    .setRange(0, 100)
    .setSize(100, 19)
    .setLabel("Initial Velocity")
    .setColor(ControlP5.THEME_RED)
    ;

  s2=new Slider(cp5, "Theta")
    .setPosition(250, 50)
    .setRange(0, 90)
    .setSize(100, 19)
    .setLabel("Theta")
    .setColor(ControlP5.THEME_RED)
    ;

  b=new Button(cp5, "Start")
    .setPosition(400, 50)
    .setSize(100, 19)
    .setValue(200)
    .setColor(ControlP5.THEME_RED);

  b.addCallback(new CallbackListener()
  {
    public void controlEvent(CallbackEvent theEvent)
    {
      if (theEvent.getAction()==ControlP5.PRESS)
      {
        myflag=true;
        u=s1.getValue();
        theta=radians(s2.getValue());
      }
    }
  }
  );
}

void draw()
{
  if (myflag==true)
  {
    stroke(255);
    float x=u*t*cos(theta);
    float y=height-(u*t*sin(theta)-4.9*(t*(t=t+0.01)));
    point(x, y) ;
    t+=0.1;

    if (y>height)
    {
      myflag=false;
      t=0;
    }
  }
}

void displayGrid()
{
  for (int i=0; i<width; i+=100)
  {
    stroke(255,30);
    line(i, 0, i, height);
  }

  for (int j=0; j<height; j+=100)
  {
    stroke(255,30);
    line(0, j, width, j);
  }

  for (int i=0; i<width; i+=20)
  {
    stroke(255,20);
    line(i, 0, i, height);
  }

  for (int j=0; j<height; j+=20)
  {
    stroke(255,20);
    line(0, j, width, j);
  }
}