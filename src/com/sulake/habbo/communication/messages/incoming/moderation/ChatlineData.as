package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1568:String;
      
      private var var_1880:int;
      
      private var var_1879:int;
      
      private var var_1882:int;
      
      private var var_1881:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1880 = param1.readInteger();
         var_1882 = param1.readInteger();
         var_1879 = param1.readInteger();
         var_1881 = param1.readString();
         var_1568 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1568;
      }
      
      public function get hour() : int
      {
         return var_1880;
      }
      
      public function get minute() : int
      {
         return var_1882;
      }
      
      public function get chatterName() : String
      {
         return var_1881;
      }
      
      public function get chatterId() : int
      {
         return var_1879;
      }
   }
}
