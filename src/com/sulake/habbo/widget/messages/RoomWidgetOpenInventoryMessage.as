package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_1051:String = "inventory_badges";
      
      public static const const_1417:String = "inventory_clothes";
      
      public static const const_1190:String = "inventory_furniture";
      
      public static const const_678:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1043:String = "inventory_effects";
       
      
      private var var_2173:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_678);
         var_2173 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_2173;
      }
   }
}
