package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LookToMessageComposer implements IMessageComposer
   {
       
      
      private var var_2217:int;
      
      private var var_2218:int;
      
      public function LookToMessageComposer(param1:int, param2:int)
      {
         super();
         var_2217 = param1;
         var_2218 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_2217,var_2218];
      }
   }
}
