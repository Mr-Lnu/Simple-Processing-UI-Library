//package pUI;

//import java.util.ArrayList;

abstract class Component{
  JSONObject config = loadJSONObject("config.json");
  String profile = "default";
  ArrayList<Component> components = new ArrayList<Component>();
  
  abstract void show();
}
