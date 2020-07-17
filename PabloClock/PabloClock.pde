PFont font;
int hour, minute, second;
float x, y, extent;
float r, g, b;
String test;
Float temp;

void setup()
{
  size(800, 600);
  background(0);
  font = createFont("Monaco", 40, false);
  thread("getWeather");
}

void draw()
{
  textFont(font, 40);
  textSize(120);
  fill(255);
  hour = hour();
  minute = minute();
  second = second();
  
 if (frameCount % 5 == 0)
 {
   createBackgroundColor();
   generateSquares();
   displayHour();
   displayWeather();
 } 
 
}

void generateSquares()
{
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
}

void displayHour()
{
   if (hour < 10) 
   {
    text("0" + hour + ":" + minute + ":" + second, (width / 2) - 290, (height / 2) + 20);
   } 
   else if (minute < 10) 
   {
    text(hour + ":0" + minute + ":" + second, (width / 2) - 290, (height / 2) + 20);
   } 
   else if (second < 10) 
   {
      text(hour + ":" + minute + ":0" + second, (width / 2) - 290, (height / 2) + 20);
   } 
   else 
   {
      text(hour + ":" + minute + ":" + second, (width / 2) - 290, (height / 2) + 20);
   }
}

void displayWeather()
{
    if (temp != null)
   {
     textSize(30);
     temp = (float)floor(temp);
     text(temp + "F°", (width / 2) - 50, (height / 2) + 130);
   } 
   else 
   {
     textSize(30);
     text("Loading...", (width / 2) - 70, (height / 2) + 130);
   }
}

void getWeather() 
{
 
  //String apiKey = "c90e326baa0f74708fce9458f554b4d8";
  //String latitude = "36.169941";
  //String longitude = "-115.139832";
  //String url = "https://api.darksky.net/forecast/" + apiKey + "/" + latitude +"," + longitude;
  
  String apiKey = "334d173929684fc2e02a7bcf714dee2f";
  String cityId = "5506956";
  String url = "https://api.openweathermap.org/data/2.5/weather?id=" + cityId + "&units=imperial&appid=" + apiKey;
  
  
  JSONObject json = loadJSONObject(url);  
  //temp = json.getJSONObject("currently").getFloat("temperature");
  //println(temp);
  
  //println(json);
  temp = json.getJSONObject("main").getFloat("temp");

}

void createBackgroundColor()
{
  
  if (hour < 4 || hour > 21)
  {
    background(#1b262c); // dark black
  }
  else if (hour > 4 && hour < 6)
  {
    background(#0f4c75);
  }
  else if (hour > 6 && hour < 17)
  {
    background(#bbe1fa);
  }
  
  
}
