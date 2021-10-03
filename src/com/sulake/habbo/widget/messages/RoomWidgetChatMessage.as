package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_135:int = 0;
      
      public static const const_124:int = 1;
      
      public static const const_110:int = 2;
      
      public static const const_614:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1385:int = 0;
      
      private var var_2063:String = "";
      
      private var var_202:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_202 = param2;
         var_1385 = param3;
         var_2063 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_2063;
      }
      
      public function get chatType() : int
      {
         return var_1385;
      }
      
      public function get text() : String
      {
         return var_202;
      }
   }
}
