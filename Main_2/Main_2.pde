//This file should only implement other classes where possible. 
String img_path = "Icons\\PlayIcon.png";
PImage img;
Frame frame;
Slider slider;
Checkbox checkbox;
UIManager UI;

//JSONArray defaults;
void setup(){
  size(1080, 720);
  background(0);
  //defaults = loadJSONArray("defaults.json");
  img = loadImage(img_path);
  frame = new Frame(true, 100, 300, 400, 300);
  UI = new UIManager("config.json");
  slider = new Slider(150, 320, 100, 10, 0, 100);
  checkbox = new Checkbox(true, 150, 355, 20, img);
  frame.add_component(slider);
  frame.add_component(checkbox);
}

void draw(){
  background(0);
  if(mousePressed){
    slider.move_slider();
  }
  
  frame.show();
  //slider.show();
  //noLoop();
}

void mouseClicked(){
  checkbox.check_mouse();
}

void keyPressed(){
  checkbox.check_key();
}
