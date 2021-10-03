package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1517:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1673:String = "ROE_MOUSE_ENTER";
      
      public static const const_487:String = "ROE_MOUSE_MOVE";
      
      public static const const_1652:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_246:String = "ROE_MOUSE_CLICK";
      
      public static const const_472:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1714:Boolean;
      
      private var var_1715:Boolean;
      
      private var var_1710:Boolean;
      
      private var var_1712:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1710 = param4;
         var_1712 = param5;
         var_1714 = param6;
         var_1715 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1715;
      }
      
      public function get altKey() : Boolean
      {
         return var_1710;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1712;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1714;
      }
   }
}
