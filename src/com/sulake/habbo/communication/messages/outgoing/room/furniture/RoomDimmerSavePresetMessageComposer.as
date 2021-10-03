package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1777:int;
      
      private var var_1778:int;
      
      private var var_1775:Boolean;
      
      private var var_1776:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1779:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1778 = param1;
         var_1777 = param2;
         var_1776 = param3;
         var_1779 = param4;
         var_1775 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1778,var_1777,var_1776,var_1779,int(var_1775)];
      }
      
      public function dispose() : void
      {
      }
   }
}
