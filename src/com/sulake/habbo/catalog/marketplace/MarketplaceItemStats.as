package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1643:Array;
      
      private var var_2052:int;
      
      private var var_2247:int;
      
      private var var_2246:int;
      
      private var var_2248:int;
      
      private var _dayOffsets:Array;
      
      private var var_2249:int;
      
      private var var_1642:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1643;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1643 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_2247;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1642 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_2052 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_2246;
      }
      
      public function get furniCategoryId() : int
      {
         return var_2248;
      }
      
      public function get offerCount() : int
      {
         return var_2249;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_2249 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1642;
      }
      
      public function get averagePrice() : int
      {
         return var_2052;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_2248 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_2246 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_2247 = param1;
      }
   }
}
