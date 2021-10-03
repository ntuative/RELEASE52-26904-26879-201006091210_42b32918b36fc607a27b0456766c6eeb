package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1036:int = 0;
      
      private var var_1167:int = 0;
      
      private var var_1695:String = "";
      
      private var var_1035:int = 0;
      
      private var var_1694:String = "";
      
      private var var_1690:int = 0;
      
      private var var_1503:String = "";
      
      private var var_1692:int = 0;
      
      private var var_1689:int = 0;
      
      private var var_1691:String = "";
      
      private var var_1693:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1692 = param1;
         var_1691 = param2;
         var_1503 = param3;
         var_1695 = param4;
         var_1694 = param5;
         if(param6)
         {
            var_1167 = 1;
         }
         else
         {
            var_1167 = 0;
         }
         var_1690 = param7;
         var_1689 = param8;
         var_1035 = param9;
         var_1693 = param10;
         var_1036 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1692,var_1691,var_1503,var_1695,var_1694,var_1167,var_1690,var_1689,var_1035,var_1693,var_1036];
      }
      
      public function dispose() : void
      {
      }
   }
}
