//package pUI;

class Frame extends Component {  
  
  boolean show;
  int posx, posy, wdth, hght;

  public Frame(boolean type, int x, int y, int w, int h){
    show = type;
    posx = x;
    posy = y;
    wdth = w;
    hght = h;
  }
  public void add_component(Component c){
    components.add(c);
  }
  public void show(){
    if(!show){
      return;
    }
    if(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Frame").getInt("stroke_weight") != 0){
      stroke(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Frame").getInt("stroke_colour"));
      strokeWeight(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Frame").getInt("stroke_weight"));
    }
    fill(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Frame").getInt("fill_colour"));
    
    rect(posx, posy, wdth, hght);
    
    for(Component c : components){
      c.show();
    }
  }
  
  public void set_stroke_weight(int size, String profile_name){
    config.getJSONArray(profile_name).getJSONObject(0).getJSONObject("Frame").setInt("stroke_weight", size);
  }
  public void set_stroke_colour(int colour, String profile_name){
    config.getJSONArray(profile_name).getJSONObject(0).getJSONObject("Frame").setInt("stroke_weight", colour);
  }
  public void set_fill_colour(int colour, String profile_name){
    config.getJSONArray(profile_name).getJSONObject(0).getJSONObject("Frame").setInt("stroke_weight", colour);
  }
  public void set_profile(String profile_name){
    profile = profile_name;
  }
}
