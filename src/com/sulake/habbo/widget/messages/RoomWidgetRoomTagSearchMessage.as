package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_703:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1771:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_703);
         var_1771 = param1;
      }
      
      public function get tag() : String
      {
         return var_1771;
      }
   }
}
