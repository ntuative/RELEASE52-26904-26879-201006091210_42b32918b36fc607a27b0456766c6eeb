package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_159:int;
      
      private var var_225:int = 0;
      
      private var _roomId:int;
      
      private var var_88:int = 0;
      
      private var _y:int = 0;
      
      private var var_1900:int;
      
      private var var_2193:String;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         var_159 = param1;
         var_1900 = param2;
         var_2193 = param3;
         var_88 = param4;
         _y = param5;
         var_225 = param6;
         _roomId = param7;
         _roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(var_1900)
         {
            case RoomObjectCategoryEnum.const_34:
               return [var_159 + " " + var_88 + " " + _y + " " + var_225];
            case RoomObjectCategoryEnum.const_32:
               return [var_159 + " " + var_2193];
            default:
               return [];
         }
      }
   }
}
