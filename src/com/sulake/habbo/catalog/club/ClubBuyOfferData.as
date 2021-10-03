package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_1834:int;
      
      private var var_2077:Boolean = false;
      
      private var var_1835:int;
      
      private var var_1837:int;
      
      private var var_1832:int;
      
      private var var_1361:String;
      
      private var var_1421:int;
      
      private var _offerId:int;
      
      private var var_1836:int;
      
      private var var_1833:Boolean;
      
      private var var_1831:Boolean;
      
      private var var_437:ICatalogPage;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         _offerId = param1;
         var_1361 = param2;
         var_1421 = param3;
         var_1831 = param4;
         var_1833 = param5;
         var_1835 = param6;
         var_1832 = param7;
         var_1837 = param8;
         var_1834 = param9;
         var_1836 = param10;
      }
      
      public function get month() : int
      {
         return var_1834;
      }
      
      public function get page() : ICatalogPage
      {
         return var_437;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get vip() : Boolean
      {
         return var_1833;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         var_437 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get priceInPixels() : int
      {
         return 0;
      }
      
      public function get priceType() : String
      {
         return Offer.const_315;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1831;
      }
      
      public function get localizationId() : String
      {
         return var_1361;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1832;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return var_2077;
      }
      
      public function get day() : int
      {
         return var_1836;
      }
      
      public function get year() : int
      {
         return var_1837;
      }
      
      public function get price() : int
      {
         return var_1421;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         var_2077 = param1;
      }
      
      public function get periods() : int
      {
         return var_1835;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get priceInCredits() : int
      {
         return var_1421;
      }
      
      public function get productCode() : String
      {
         return var_1361;
      }
   }
}
