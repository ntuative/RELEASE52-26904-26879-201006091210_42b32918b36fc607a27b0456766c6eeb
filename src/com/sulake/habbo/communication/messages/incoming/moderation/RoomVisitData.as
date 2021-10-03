package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_698:String;
      
      private var var_1781:int;
      
      private var var_1553:Boolean;
      
      private var _roomId:int;
      
      private var var_1780:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1553 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_698 = param1.readString();
         var_1780 = param1.readInteger();
         var_1781 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1553;
      }
      
      public function get roomName() : String
      {
         return var_698;
      }
      
      public function get enterMinute() : int
      {
         return var_1781;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1780;
      }
   }
}
