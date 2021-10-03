package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SetClothingChangeDataMessageComposer implements IMessageComposer
   {
       
      
      private var var_610:String;
      
      private var var_159:int;
      
      private var var_2240:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function SetClothingChangeDataMessageComposer(param1:int, param2:String, param3:String = "", param4:int = 0, param5:int = 0)
      {
         super();
         var_159 = param1;
         var_610 = param2;
         var_2240 = param3;
         _roomId = param4;
         _roomCategory = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_159,var_610,var_2240];
      }
      
      public function dispose() : void
      {
      }
   }
}
