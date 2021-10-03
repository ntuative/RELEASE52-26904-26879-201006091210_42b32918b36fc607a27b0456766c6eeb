package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_141:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1241:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_141);
         var_1241 = param1;
      }
      
      public function get vote() : int
      {
         return var_1241;
      }
   }
}
