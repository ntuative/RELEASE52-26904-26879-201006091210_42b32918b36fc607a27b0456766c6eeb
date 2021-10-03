package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NewConsoleMessageMessageParser implements IMessageParser
   {
       
      
      private var var_1976:String;
      
      private var var_1121:int;
      
      public function NewConsoleMessageMessageParser()
      {
         super();
      }
      
      public function get senderId() : int
      {
         return this.var_1121;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1121 = param1.readInteger();
         this.var_1976 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get messageText() : String
      {
         return this.var_1976;
      }
   }
}
