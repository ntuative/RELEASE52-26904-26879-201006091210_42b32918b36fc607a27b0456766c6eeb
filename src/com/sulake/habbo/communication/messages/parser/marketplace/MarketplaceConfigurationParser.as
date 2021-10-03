package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1988:int;
      
      private var var_1647:int;
      
      private var var_1989:int;
      
      private var var_1990:int;
      
      private var var_1991:int;
      
      private var var_1648:int;
      
      private var var_1857:int;
      
      private var var_1320:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1988;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1647;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1857;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1990;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1991;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1648;
      }
      
      public function get commission() : int
      {
         return var_1989;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1320 = param1.readBoolean();
         var_1989 = param1.readInteger();
         var_1647 = param1.readInteger();
         var_1648 = param1.readInteger();
         var_1990 = param1.readInteger();
         var_1988 = param1.readInteger();
         var_1991 = param1.readInteger();
         var_1857 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1320;
      }
   }
}
