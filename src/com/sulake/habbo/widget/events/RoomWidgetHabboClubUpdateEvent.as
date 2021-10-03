package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_220:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1798:Boolean = false;
      
      private var var_1801:int = 0;
      
      private var var_1802:int = 0;
      
      private var var_1799:int;
      
      private var var_1800:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_220,param6,param7);
         var_1800 = param1;
         var_1802 = param2;
         var_1801 = param3;
         var_1798 = param4;
         var_1799 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_1799;
      }
      
      public function get pastPeriods() : int
      {
         return var_1801;
      }
      
      public function get periodsLeft() : int
      {
         return var_1802;
      }
      
      public function get daysLeft() : int
      {
         return var_1800;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1798;
      }
   }
}
