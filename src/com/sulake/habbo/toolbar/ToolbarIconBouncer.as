package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1760:Number;
      
      private var var_576:Number = 0;
      
      private var var_1761:Number;
      
      private var var_577:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1760 = param1;
         var_1761 = param2;
      }
      
      public function update() : void
      {
         var_577 += var_1761;
         var_576 += var_577;
         if(var_576 > 0)
         {
            var_576 = 0;
            var_577 = var_1760 * -1 * var_577;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_577 = param1;
         var_576 = 0;
      }
      
      public function get location() : Number
      {
         return var_576;
      }
   }
}
