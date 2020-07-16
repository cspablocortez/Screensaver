
PFont font;
int hour, minute, second;

void setup()
{
  size(800, 600);
  background(0);
  font = createFont("Monaco", 40, true);
}

void draw()
{
  background(0);
  textFont(font, 40);
  textSize(120);
  fill(255);
  hour = hour();
  minute = minute();
  second = second();
  if (second < 10) 
  {
    text(hour + ":" + minute + ":0" + second, (width / 2) - 290, (height / 2) + 20);
  } else {
    text(hour + ":" + minute + ":" + second, (width / 2) - 290, (height / 2) + 20);
  }
}
