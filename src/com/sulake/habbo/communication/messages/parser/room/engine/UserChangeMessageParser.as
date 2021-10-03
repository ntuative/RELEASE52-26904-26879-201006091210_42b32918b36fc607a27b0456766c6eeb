package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserChangeMessageParser implements IMessageParser
   {
       
      
      private var var_432:String;
      
      private var var_615:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _id:int;
      
      private var var_1335:String;
      
      public function UserChangeMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _id = param1.readInteger();
         var_432 = param1.readString();
         var_615 = param1.readString();
         var_1335 = param1.readString();
         if(var_615)
         {
            var_615 = var_615.toUpperCase();
         }
         return true;
      }
      
      public function get figure() : String
      {
         return var_432;
      }
      
      public function flush() : Boolean
      {
         _id = 0;
         var_432 = "";
         var_615 = "";
         var_1335 = "";
         return true;
      }
      
      public function get sex() : String
      {
         return var_615;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get customInfo() : String
      {
         return var_1335;
      }
   }
}
