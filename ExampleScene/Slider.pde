
class Slider extends Component {
  
  int posx, posy, wdth, hght;
  int buttonx, buttony;
  float min_value, max_value;
  float slider_value;
  int button_wdth = config.getJSONArray(profile).getJSONObject(0).getJSONObject("Slider").getInt("button_width");
  int button_hght = hght; //config.getJSONArray(profile).getJSONObject(0).getJSONObject("Slider").getInt("button_height");
  
  public Slider(int x, int y, int w, int h, float min, float max){
    posx = x;
    posy = y;
    wdth = w;
    hght = h;
    min_value = min;
    max_value = max;
    buttonx = x;
    buttony = y - (hght/2);
  }
  
  public void show(){
    strokeWeight(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Slider").getInt("line_stroke_weight"));
    stroke(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Slider").getInt("line_colour"));
    line(posx, posy, posx + wdth, posy);
    fill(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Slider").getInt("button_fill_colour"));
    rect(buttonx-(button_wdth/2), buttony, button_wdth, hght);
    noFill();
    textSize(config.getJSONArray(profile).getJSONObject(0).getJSONObject("Slider").getInt("text_size"));
    text(slider_value, posx, posy + config.getJSONArray(profile).getJSONObject(0).getJSONObject("Slider").getInt("text_offset"));
  }
  
  public void move_slider(){
    if(mouseX < posx+wdth && mouseY< posy + hght/2 && mouseX > posx && mouseY > posy - hght/2){
      buttonx = mouseX;
      slider_value = map(buttonx, posx, posx + wdth, min_value, max_value);
    }
  }
  public void set_profile(String profile_name){
    profile = profile_name;
  }
}
