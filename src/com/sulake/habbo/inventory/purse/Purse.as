package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2028:Boolean = false;
      
      private var var_2029:int = 0;
      
      private var var_1532:int = 0;
      
      private var var_2027:int = 0;
      
      private var var_2013:Boolean = false;
      
      private var var_1545:int = 0;
      
      private var var_1531:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1545 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2029;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2028;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2028 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_2013;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2029 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1532 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1545;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_2013 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2027 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1532;
      }
      
      public function get pixelBalance() : int
      {
         return var_2027;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1531 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1531;
      }
   }
}
