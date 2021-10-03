package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1704:String;
      
      private var var_814:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_1704 = param1;
         var_814 = param2;
      }
      
      public function get postureType() : String
      {
         return var_1704;
      }
      
      public function get parameter() : String
      {
         return var_814;
      }
   }
}
