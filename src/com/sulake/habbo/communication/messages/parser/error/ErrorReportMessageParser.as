package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1405:int;
      
      private var var_1220:int;
      
      private var var_1406:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1405;
      }
      
      public function flush() : Boolean
      {
         var_1220 = 0;
         var_1405 = 0;
         var_1406 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1220;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1405 = param1.readInteger();
         var_1220 = param1.readInteger();
         var_1406 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1406;
      }
   }
}
