package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_434:int;
      
      private var var_1289:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function get flatId() : int
      {
         return var_434;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_434 = param1.readInteger();
         var_1289 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_434 = 0;
         var_1289 = 0;
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1289;
      }
   }
}
