package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1643:Array;
      
      private var var_2052:int;
      
      private var var_2247:int;
      
      private var var_2248:int;
      
      private var var_2246:int;
      
      private var _dayOffsets:Array;
      
      private var var_2249:int;
      
      private var var_1642:Array;
      
      public function MarketplaceItemStatsParser()
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
      
      public function get furniTypeId() : int
      {
         return var_2247;
      }
      
      public function get historyLength() : int
      {
         return var_2246;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_2248;
      }
      
      public function get offerCount() : int
      {
         return var_2249;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1642;
      }
      
      public function get averagePrice() : int
      {
         return var_2052;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_2052 = param1.readInteger();
         var_2249 = param1.readInteger();
         var_2246 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1643 = [];
         var_1642 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1643.push(param1.readInteger());
            var_1642.push(param1.readInteger());
            _loc3_++;
         }
         var_2248 = param1.readInteger();
         var_2247 = param1.readInteger();
         return true;
      }
   }
}
