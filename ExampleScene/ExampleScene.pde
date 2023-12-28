//To add elements to your scene initialise objects of the types you need as global variable so that they can be used in draw
Frame frame;
Slider slider;
Checkbox checkbox;

void setup(){
  size(1080, 720);
  background(1);
  
  //Pass in parameters for each element to place it in your scene
  frame = new Frame(true, 50, 100, 400, 300);
  slider = new Slider(100, 120, 100, 10, 0, 100);
  checkbox = new Checkbox(true, 100, 150, 20, "Test box");
  
  //Optionally some elements can contain others 
  frame.add_component(slider);
  frame.add_component(checkbox);
}

void draw(){
  background(0);
  
  //Check for continuous events like the mouse moving a slider
  if(mousePressed){
    slider.move_slider();
  }
  
  //Draw your UI to the screen
  frame.show();
}

void mouseClicked(){
  checkbox.check_mouse();
}

void keyPressed(){
  checkbox.check_key();
}
