package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_432:String;
      
      private var var_1917:int;
      
      private var var_2003:String;
      
      private var var_1068:int;
      
      private var var_1231:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1231;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1231 = param1.readInteger();
         var_2003 = param1.readString();
         var_1917 = param1.readInteger();
         var_432 = param1.readString();
         var_1068 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2003;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_432;
      }
      
      public function get petType() : int
      {
         return var_1068;
      }
      
      public function get level() : int
      {
         return var_1917;
      }
   }
}
