class Checkbox extends Component {
  boolean show;
  boolean state;
  boolean is_key_button;
  boolean is_icon_button;
  PImage icon;
  String button_text;
  char button_key;
  int posx, posy, wdth;
  
  public Checkbox(boolean visible, boolean check, int x, int y, int w, String s){
    show = visible;
    is_key_button = false;
    is_icon_button = false;
    //Set default state
    state = check;
    posx = x;
    posy = y;
    wdth = w;
    button_text = s;
  }
  
  public Checkbox(boolean type, boolean check, char a, int x, int y, int w, String s){
    show = type;
    is_key_button = true;
    is_icon_button = false;
    button_key = a;
    //Set default state
    state = check;
    posx = x;
    posy = y;
    wdth = w;
    button_text = s;
  }
  
  public Checkbox(boolean type, boolean check, char a, int x, int y, int w, PImage i){
    show = type;
    is_key_button = true;
    is_icon_button = true;
    button_key = a;
    icon = i;
    //Set default state
    state = check;
    posx = x;
    posy = y;
    wdth = w;
  }

  public Checkbox(boolean visible, boolean check, int x, int y, int w, PImage i){
    show = visible;
    is_key_button = false;
    is_icon_button = true;
    icon = i;
    //Set default state
    state = check;
    posx = x;
    posy = y;
    wdth = w;
  }
  
  public void show(){
    if(!show){
      return;
    }
    
    if(!is_icon_button){
    if(!state){
      noFill();
    } else fill(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Checkbox").getInt("fill_colour"));
    stroke(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Checkbox").getInt("stroke_colour"));
    strokeWeight(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Checkbox").getInt("stroke_weight"));
    rect(posx,posy,wdth,wdth);
    fill(0);
    textSize(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Checkbox").getInt("text_size"));
    text(button_text, posx + wdth + 5, posy + wdth/2 + 5); 
    return;
    }
    if(!state){
      image(icon, posx, posy);
      return;
    }
    tint(100);
    image(icon, posx, posy);
    noTint();
    
  }
  public void check_mouse(){
    if(mouseX < posx+wdth && mouseY< posy + wdth && mouseX > posx && mouseY > posy - wdth){
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
