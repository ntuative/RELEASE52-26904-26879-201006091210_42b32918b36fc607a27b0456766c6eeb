package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_127;
         param1["bound_to_parent_rect"] = const_90;
         param1["child_window"] = const_882;
         param1["embedded_controller"] = const_313;
         param1["resize_to_accommodate_children"] = const_66;
         param1["input_event_processor"] = const_51;
         param1["internal_event_handling"] = const_535;
         param1["mouse_dragging_target"] = const_248;
         param1["mouse_dragging_trigger"] = const_306;
         param1["mouse_scaling_target"] = const_282;
         param1["mouse_scaling_trigger"] = const_509;
         param1["horizontal_mouse_scaling_trigger"] = const_236;
         param1["vertical_mouse_scaling_trigger"] = const_211;
         param1["observe_parent_input_events"] = const_870;
         param1["optimize_region_to_layout_size"] = const_502;
         param1["parent_window"] = const_945;
         param1["relative_horizontal_scale_center"] = const_172;
         param1["relative_horizontal_scale_fixed"] = const_143;
         param1["relative_horizontal_scale_move"] = const_314;
         param1["relative_horizontal_scale_strech"] = const_279;
         param1["relative_scale_center"] = const_836;
         param1["relative_scale_fixed"] = const_717;
         param1["relative_scale_move"] = const_855;
         param1["relative_scale_strech"] = const_1030;
         param1["relative_vertical_scale_center"] = const_179;
         param1["relative_vertical_scale_fixed"] = const_126;
         param1["relative_vertical_scale_move"] = const_308;
         param1["relative_vertical_scale_strech"] = const_295;
         param1["on_resize_align_left"] = const_600;
         param1["on_resize_align_right"] = const_496;
         param1["on_resize_align_center"] = const_436;
         param1["on_resize_align_top"] = const_567;
         param1["on_resize_align_bottom"] = const_403;
         param1["on_resize_align_middle"] = const_437;
         param1["on_accommodate_align_left"] = const_1048;
         param1["on_accommodate_align_right"] = const_402;
         param1["on_accommodate_align_center"] = const_633;
         param1["on_accommodate_align_top"] = const_1040;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_613;
         param1["route_input_events_to_parent"] = const_489;
         param1["use_parent_graphic_context"] = const_35;
         param1["draggable_with_mouse"] = const_886;
         param1["scalable_with_mouse"] = const_951;
         param1["reflect_horizontal_resize_to_parent"] = const_415;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_286;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
