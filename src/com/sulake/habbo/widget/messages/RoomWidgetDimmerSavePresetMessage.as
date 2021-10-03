package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_648:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1777:int;
      
      private var var_1778:int;
      
      private var var_2047:Boolean;
      
      private var var_1140:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_648);
         var_1778 = param1;
         var_1777 = param2;
         _color = param3;
         var_1140 = param4;
         var_2047 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1777;
      }
      
      public function get presetNumber() : int
      {
         return var_1778;
      }
      
      public function get brightness() : int
      {
         return var_1140;
      }
      
      public function get apply() : Boolean
      {
         return var_2047;
      }
   }
}
