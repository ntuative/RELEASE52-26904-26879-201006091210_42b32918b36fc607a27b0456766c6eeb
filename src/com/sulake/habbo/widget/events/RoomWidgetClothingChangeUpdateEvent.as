package com.sulake.habbo.widget.events
{
   public class RoomWidgetClothingChangeUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_340:String = "RWCCUE_SHOW_GENDER_SELECTION";
      
      public static const const_1041:String = "RWCCUE_SHOW_CLOTHING_EDITOR";
      
      public static const const_358:String = "RWCCUE_HIDE_CLOTHING_EDITOR";
       
      
      private var _roomId:int = -1;
      
      private var var_159:int = -1;
      
      private var var_1900:int = -1;
      
      private var _roomCategory:int = -1;
      
      public function RoomWidgetClothingChangeUpdateEvent(param1:String, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_159 = param2;
         var_1900 = param3;
         _roomId = param4;
         _roomCategory = param5;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get objectId() : int
      {
         return var_159;
      }
      
      public function get objectCategory() : int
      {
         return var_1900;
      }
   }
}
