package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1504:GarbageMonitor = null;
      
      private var var_1234:int = 0;
      
      private var var_1167:Boolean = false;
      
      private var var_1695:String = "";
      
      private var var_1503:String = "";
      
      private var var_355:Number = 0;
      
      private var var_1237:int = 10;
      
      private var var_2375:Array;
      
      private var var_672:int = 0;
      
      private var var_1235:int = 60;
      
      private var var_1036:int = 0;
      
      private var var_1035:int = 0;
      
      private var var_1694:String = "";
      
      private var var_1928:Number = 0;
      
      private var var_1233:int = 1000;
      
      private var var_1930:Boolean = true;
      
      private var var_1929:Number = 0.15;
      
      private var var_128:IHabboConfigurationManager = null;
      
      private var var_1691:String = "";
      
      private var var_1236:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2375 = [];
         super();
         var_1503 = Capabilities.version;
         var_1695 = Capabilities.os;
         var_1167 = Capabilities.isDebugger;
         var_1691 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1504 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1234 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1504.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1504.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_355;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1235 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1503;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1035;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1233)
         {
            ++var_1036;
            _loc3_ = true;
         }
         else
         {
            ++var_672;
            if(var_672 <= 1)
            {
               var_355 = param1;
            }
            else
            {
               _loc4_ = Number(var_672);
               var_355 = var_355 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1234 > var_1235 * 1000 && var_1236 < var_1237)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_355);
            _loc5_ = true;
            if(var_1930 && var_1236 > 0)
            {
               _loc6_ = differenceInPercents(var_1928,var_355);
               if(_loc6_ < var_1929)
               {
                  _loc5_ = false;
               }
            }
            var_1234 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1928 = var_355;
               if(sendReport())
               {
                  ++var_1236;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1237 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1233 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1691,var_1503,var_1695,var_1694,var_1167,_loc4_,_loc3_,var_1035,var_355,var_1036);
            _connection.send(_loc1_);
            var_1035 = 0;
            var_355 = 0;
            var_672 = 0;
            var_1036 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_128 = param1;
         var_1235 = int(var_128.getKey("performancetest.interval","60"));
         var_1233 = int(var_128.getKey("performancetest.slowupdatelimit","1000"));
         var_1237 = int(var_128.getKey("performancetest.reportlimit","10"));
         var_1929 = Number(var_128.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1930 = Boolean(int(var_128.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
