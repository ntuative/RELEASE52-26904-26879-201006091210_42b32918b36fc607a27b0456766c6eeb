package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class FramerateTracker
   {
       
      
      private var var_672:int;
      
      private var var_1234:int;
      
      private var var_355:uint;
      
      private var var_2099:Boolean;
      
      private var var_2100:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         var_2100 = int(param1.getKey("tracking.framerate.reportInterval.seconds","60")) * 1000;
         var_2099 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++var_672;
         var _loc3_:int = getTimer();
         if(var_672 == 1)
         {
            var_355 = param1;
            var_1234 = _loc3_;
         }
         else
         {
            _loc4_ = Number(var_672);
            var_355 = var_355 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(var_2099 && _loc3_ - var_1234 >= var_2100)
         {
            _loc5_ = 1000 / var_355;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            var_1234 = _loc3_;
            var_672 = 0;
         }
      }
      
      function dispose() : void
      {
      }
   }
}
