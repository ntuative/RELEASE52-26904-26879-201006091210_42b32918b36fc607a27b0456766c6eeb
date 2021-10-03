package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1565:int = 2;
      
      public static const const_1239:int = 4;
      
      public static const const_1378:int = 1;
      
      public static const const_1303:int = 3;
       
      
      private var var_1006:int = 0;
      
      private var var_814:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_1006;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1006 = param1.readInteger();
         if(var_1006 == 3)
         {
            var_814 = param1.readString();
         }
         else
         {
            var_814 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1006 = 0;
         var_814 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_814;
      }
   }
}
