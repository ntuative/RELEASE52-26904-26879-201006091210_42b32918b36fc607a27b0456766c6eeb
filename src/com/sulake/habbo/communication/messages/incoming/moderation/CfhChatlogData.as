package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1767:int;
      
      private var var_1037:int;
      
      private var var_1766:int;
      
      private var var_1469:int;
      
      private var var_118:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1469 = param1.readInteger();
         var_1766 = param1.readInteger();
         var_1037 = param1.readInteger();
         var_1767 = param1.readInteger();
         var_118 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1469);
      }
      
      public function get chatRecordId() : int
      {
         return var_1767;
      }
      
      public function get reportedUserId() : int
      {
         return var_1037;
      }
      
      public function get callerUserId() : int
      {
         return var_1766;
      }
      
      public function get callId() : int
      {
         return var_1469;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_118;
      }
   }
}
