package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_691;
         param1["bitmap"] = const_610;
         param1["border"] = const_626;
         param1["border_notify"] = const_1414;
         param1["button"] = const_512;
         param1["button_thick"] = const_722;
         param1["button_icon"] = const_1210;
         param1["button_group_left"] = const_742;
         param1["button_group_center"] = const_719;
         param1["button_group_right"] = const_581;
         param1["canvas"] = const_541;
         param1["checkbox"] = const_587;
         param1["closebutton"] = const_1046;
         param1["container"] = const_339;
         param1["container_button"] = const_753;
         param1["display_object_wrapper"] = const_592;
         param1["dropmenu"] = const_393;
         param1["dropmenu_item"] = const_442;
         param1["frame"] = const_302;
         param1["frame_notify"] = const_1309;
         param1["header"] = const_764;
         param1["icon"] = const_911;
         param1["itemgrid"] = const_902;
         param1["itemgrid_horizontal"] = const_381;
         param1["itemgrid_vertical"] = const_547;
         param1["itemlist"] = const_1053;
         param1["itemlist_horizontal"] = const_356;
         param1["itemlist_vertical"] = const_322;
         param1["maximizebox"] = const_1285;
         param1["menu"] = WINDOW_TYPE_MENU;
         param1["menu_item"] = const_1283;
         param1["submenu"] = const_878;
         param1["minimizebox"] = const_1407;
         param1["notify"] = const_1356;
         param1["null"] = const_700;
         param1["password"] = const_621;
         param1["radiobutton"] = const_743;
         param1["region"] = const_465;
         param1["restorebox"] = const_1300;
         param1["scaler"] = const_664;
         param1["scaler_horizontal"] = const_1194;
         param1["scaler_vertical"] = const_1189;
         param1["scrollbar_horizontal"] = const_450;
         param1["scrollbar_vertical"] = const_690;
         param1["scrollbar_slider_button_up"] = const_1021;
         param1["scrollbar_slider_button_down"] = const_983;
         param1["scrollbar_slider_button_left"] = const_1000;
         param1["scrollbar_slider_button_right"] = const_1054;
         param1["scrollbar_slider_bar_horizontal"] = const_991;
         param1["scrollbar_slider_bar_vertical"] = const_900;
         param1["scrollbar_slider_track_horizontal"] = const_1052;
         param1["scrollbar_slider_track_vertical"] = const_925;
         param1["scrollable_itemlist"] = const_1394;
         param1["scrollable_itemlist_vertical"] = const_476;
         param1["scrollable_itemlist_horizontal"] = const_1039;
         param1["selector"] = const_531;
         param1["selector_list"] = const_748;
         param1["submenu"] = const_878;
         param1["tab_button"] = const_631;
         param1["tab_container_button"] = const_926;
         param1["tab_context"] = WINDOW_TYPE_TAB_CONTEXT;
         param1["tab_content"] = const_838;
         param1["tab_selector"] = const_627;
         param1["text"] = const_543;
         param1["input"] = const_619;
         param1["toolbar"] = const_1351;
         param1["tooltip"] = const_337;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
