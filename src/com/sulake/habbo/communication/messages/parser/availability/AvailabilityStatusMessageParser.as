package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1139:Boolean;
      
      private var var_1336:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1139 = param1.readInteger() > 0;
         var_1336 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_1139;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1336;
      }
      
      public function flush() : Boolean
      {
         var_1139 = false;
         var_1336 = false;
         return true;
      }
   }
}
