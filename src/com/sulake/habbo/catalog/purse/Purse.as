package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_2014:int = 0;
      
      private var var_1532:int = 0;
      
      private var var_2013:Boolean = false;
      
      private var var_1768:int = 0;
      
      private var var_2015:int = 0;
      
      private var var_1531:int = 0;
      
      private var var_2016:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubDays() : int
      {
         return var_1532;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1532 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_2013 = param1;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         var_2016 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1532 > 0 || var_1531 > 0;
      }
      
      public function get credits() : int
      {
         return var_1768;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         var_2015 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1531;
      }
      
      public function get isVIP() : Boolean
      {
         return var_2013;
      }
      
      public function get pastClubDays() : int
      {
         return var_2016;
      }
      
      public function get pastVipDays() : int
      {
         return var_2015;
      }
      
      public function set pixels(param1:int) : void
      {
         var_2014 = param1;
      }
      
      public function get pixels() : int
      {
         return var_2014;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1531 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1768 = param1;
      }
   }
}
