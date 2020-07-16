
PFont font;
int hour, minute, second;
float x, y, extent;
float r, g, b;
String test;

void setup()
{
  size(800, 600);
  background(0);
  font = createFont("Monaco", 40, true);
  
}

void draw()
{
  //background(0);
  textFont(font, 40);
  textSize(120);
  fill(255);
  hour = hour();
  minute = minute();
  second = second();
  
 if (frameCount % 5 == 0)
 {
   background(0);
   noFill();
   strokeWeight(2);
   for (int i = 0; i <= 10; i++)
   {
     r = random(0, 255);
     g = random(0, 255);
     b = random(0, 255);
     x = random(0, 800);
     y = random(0, 600);
     extent = random(10, 40);
     stroke(r, g, b);
     square(x, y, extent);
     
   }
   
   thread("getWeather");
   
   if (minute < 10) 
   {
    text(hour + ":0" + minute + ":" + second, (width / 2) - 290, (height / 2) + 20);
   } else if (second < 10) 
   {
      text(hour + ":" + minute + ":0" + second, (width / 2) - 290, (height / 2) + 20);
   } else {
      text(hour + ":" + minute + ":" + second, (width / 2) - 290, (height / 2) + 20);
   }
   
   
   
 }
}

void getWeather() 
{
  String apiKey = "c90e326baa0f74708fce9458f554b4d8";
  String latitude = "36.169941";
  String longitude = "-115.139832";
  String url = "https://api.darksky.net/forecast/" + apiKey + "/" + latitude +"," + longitude;
  
  JSONObject json = loadJSONObject(url);
  
  //println(json);
  
  Float temp = json.getJSONObject("currently").getFloat("temperature");
  
  println(temp);
  
  stroke(255);
  text(temp, (width / 2) - 290, (height / 2) + 50);
  
}
