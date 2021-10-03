package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.sound.PlayListEntry;
   
   public class PlayListMessageParser implements IMessageParser
   {
       
      
      private var var_1587:Array;
      
      private var var_1354:int;
      
      public function PlayListMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_1354 = -1;
         var_1587 = [];
         return true;
      }
      
      public function get playList() : Array
      {
         return var_1587;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var_1354 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            _loc5_ = param1.readInteger();
            _loc6_ = param1.readString();
            _loc7_ = param1.readString();
            var_1587.push(new PlayListEntry(_loc4_,_loc5_,_loc6_,_loc7_));
            _loc3_++;
         }
         return true;
      }
      
      public function get synchronizationCount() : int
      {
         return var_1354;
      }
   }
}
