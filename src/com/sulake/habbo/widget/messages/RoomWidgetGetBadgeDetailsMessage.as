package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_608:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_1039:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_608);
         var_1039 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1039;
      }
   }
}
