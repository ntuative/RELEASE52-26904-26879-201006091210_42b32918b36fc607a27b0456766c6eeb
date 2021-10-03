package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1421:int;
      
      private var var_2052:int;
      
      private var var_2053:int = -1;
      
      private var var_150:int;
      
      private var var_1992:int;
      
      private var _offerId:int;
      
      private var var_1420:int;
      
      private var _furniId:int;
      
      private var var_1446:String;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         _offerId = param1;
         _furniId = param2;
         var_1992 = param3;
         var_1446 = param4;
         var_1421 = param5;
         var_150 = param6;
         var_2053 = param7;
         var_2052 = param8;
         var_1420 = param9;
      }
      
      public function get status() : int
      {
         return var_150;
      }
      
      public function get price() : int
      {
         return var_1421;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_2053;
      }
      
      public function get offerCount() : int
      {
         return var_1420;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1992;
      }
      
      public function get averagePrice() : int
      {
         return var_2052;
      }
      
      public function get furniId() : int
      {
         return _furniId;
      }
      
      public function get stuffData() : String
      {
         return var_1446;
      }
   }
}
