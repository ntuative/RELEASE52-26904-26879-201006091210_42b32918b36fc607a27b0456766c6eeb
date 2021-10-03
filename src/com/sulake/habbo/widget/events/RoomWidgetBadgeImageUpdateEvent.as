package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_533:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2101:BitmapData;
      
      private var var_2102:String;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_533,param3,param4);
         var_2102 = param1;
         var_2101 = param2;
      }
      
      public function get badgeImage() : BitmapData
      {
         return var_2101;
      }
      
      public function get badgeID() : String
      {
         return var_2102;
      }
   }
}
