class Checkbox extends Component {
  boolean state;
  int posx, posy, wdth;
  
  final int KEY_BUTTON = 0b100;
  final int ICON_BUTTON = 0b010;
  final int TEXT_BUTTON = 0b001;
  int button_type;
  
  PImage icon;
  String button_text;
  char button_key;
  
  public Checkbox(boolean check, char a, int x, int y, int w, PImage i){
    button_type = ICON_BUTTON;
    button_key = a;
    icon = i;
    state = check;
    posx = x;
    posy = y;
    wdth = w;
  }
  
  public Checkbox(boolean check, char a, int x, int y, int w, String s){
    button_type = TEXT_BUTTON;
    button_key = a;
    state = check;
    posx = x;
    posy = y;
    wdth = w;
    button_text = s;
  }
  
  public Checkbox(boolean check, int x, int y, int w, PImage i){
    button_type = ICON_BUTTON;
    icon = i;
    state = check;
    posx = x;
    posy = y;
    wdth = w;
  }
  
  public Checkbox(boolean check, int x, int y, int w, String s){
    button_type = TEXT_BUTTON;
    state = check;
    posx = x;
    posy = y;
    wdth = w;
    button_text = s;
  }
  
  public Checkbox(boolean check){
    button_type = KEY_BUTTON;
    state = check;
  }

  public void show(){
    switch(button_type){
      case ICON_BUTTON:
        if(!state){
          tint(50);
          image(icon, posx, posy);
          noTint();
          return;
        }
          image(icon, posx, posy);
          break;
      case TEXT_BUTTON:
        if(!state){
          strokeWeight(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Checkbox").getInt("stroke_weight"));
          stroke(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Checkbox").getInt("stroke_colour"));
          rect(posx,posy,wdth,wdth);
          textSize(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Checkbox").getInt("text_size"));
          text(button_text, posx + wdth + 5, posy + wdth/2 + 5); 
          return;
        }
          fill(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Checkbox").getInt("fill_colour"));
          strokeWeight(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Checkbox").getInt("stroke_weight"));
          stroke(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Checkbox").getInt("stroke_colour"));
          rect(posx,posy,wdth,wdth);
          textSize(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Checkbox").getInt("text_size"));
          text(button_text, posx + wdth + 5, posy + wdth/2 + 5); 
          noFill();
          break;
      case KEY_BUTTON:
        return;
    }
  }
  
  public void check_mouse(){
    if(mouseX < posx + wdth && mouseY< posy + wdth && mouseX > posx && mouseY > posy - wdth){
      state = !state;
    }
  }
  
  public void check_key(){
    if(key == button_key){
      state = !state;
    }
  }
  
  public void set_profile(String profile_name){
    profile = profile_name;
  }
}
