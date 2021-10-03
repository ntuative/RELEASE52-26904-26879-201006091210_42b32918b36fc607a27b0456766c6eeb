package com.sulake.habbo.notifications
{
   import com.sulake.core.utils.Map;
   import flash.display.BitmapData;
   
   public class HabboNotificationItemStyle
   {
       
      
      private var var_2168:String;
      
      private var _icon:BitmapData;
      
      private var var_1351:Array;
      
      public function HabboNotificationItemStyle(param1:Map)
      {
         super();
         if(param1 == null)
         {
            var_1351 = [];
            _icon = null;
         }
         else
         {
            var_1351 = param1["uilinks"];
            _icon = param1["icon"];
         }
      }
      
      public function get iconSrc() : String
      {
         return var_2168;
      }
      
      public function set icon(param1:BitmapData) : void
      {
         _icon = param1;
      }
      
      public function get icon() : BitmapData
      {
         return _icon;
      }
      
      public function get componentLinks() : Array
      {
         return var_1351;
      }
      
      public function set iconSrc(param1:String) : void
      {
         var_2168 = param1;
      }
   }
}
