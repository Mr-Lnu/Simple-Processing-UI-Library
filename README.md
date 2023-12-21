A basic Processing UI library. 
To use:-
- Add the class for your desired components
- Add the component class and a config file.

Currently available classes include:-
- Component (The most barebones element of the library that all others inherit from with some exceptions such as UIManager)
- Frame (Basic frame structure mostly intended to display rectangles and house other elements)
- Checkbox (Simple check box with some options for reacting to keypresses and showing icons)
- Slider (Simple slider made to scale mostly consistently with size and output both an internal variable showing its value as well as text containing said value)
- UIManager (Used to make changes to the config file from the editor)

An example  menu made with the library might contain a frame to house the actual menu, a slider for volume or brightness and a check box for different modes.
```java
Frame frame;
Slider slider;
Checkbox checkbox;

void setup(){
  size(1080, 720);
  background(0);
  frame = new Frame(true, 50, 100, 400, 300);
  slider = new Slider(100, 120, 100, 10, 0, 100);
  checkbox = new Checkbox(true, true, 100, 150, 20, "Test box");
  
  frame.add_component(slider);
  frame.add_component(checkbox);
}

void draw(){
  background(0);
  if(mousePressed){
    slider.move_slider();
  }
  
  frame.show();
}

void mouseClicked(){
  checkbox.check_mouse();
}

void keyPressed(){
  checkbox.check_key();
}
```
![alt text](https://github.com/Mr-Lnu/ProcessingUILibrary/blob/main/example.png?raw=true)
