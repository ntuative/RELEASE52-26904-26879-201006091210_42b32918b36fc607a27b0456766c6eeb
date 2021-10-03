package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_1015:String = "select_outfit";
       
      
      private var var_2008:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_1015);
         var_2008 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2008;
      }
   }
}
