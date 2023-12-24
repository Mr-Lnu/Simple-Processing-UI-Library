public class UIManager {
  JSONObject file;
  String filename;
  
  public UIManager(String f){
    filename = f;
    file = loadJSONObject(filename);
  }
  
  public void create_profile(String profile_name){
    JSONArray new_profile = new JSONArray();
    JSONObject buffer_object = new JSONObject();
    file.setJSONArray(profile_name, new_profile);
    file.getJSONArray(profile_name).setJSONObject(0, buffer_object);
    saveJSONObject(file, filename);
  }
  public void create_preset(String preset_name, String[] attributes, int[] values, String profile_name){
    JSONObject new_preset = new JSONObject();
    for(int i = 0; i < attributes.length; i++){
      new_preset.setInt(attributes[i], values[i]);
    }
    file.getJSONArray(profile_name).getJSONObject(0).setJSONObject(preset_name, new_preset);
    saveJSONObject(file, filename);
  }
}
