package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1038:String = "price_type_none";
      
      public static const const_454:String = "pricing_model_multi";
      
      public static const const_315:String = "price_type_credits";
      
      public static const const_388:String = "price_type_credits_and_pixels";
      
      public static const const_513:String = "pricing_model_bundle";
      
      public static const const_485:String = "pricing_model_single";
      
      public static const const_645:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1336:String = "pricing_model_unknown";
      
      public static const const_470:String = "price_type_pixels";
       
      
      private var var_2194:int;
      
      private var var_936:int;
      
      private var _offerId:int;
      
      private var var_937:int;
      
      private var var_446:String;
      
      private var var_625:String;
      
      private var var_437:ICatalogPage;
      
      private var var_447:IProductContainer;
      
      private var var_1369:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1369 = param1.localizationId;
         var_936 = param1.priceInCredits;
         var_937 = param1.priceInPixels;
         var_437 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_446;
      }
      
      public function get page() : ICatalogPage
      {
         return var_437;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2194 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_447;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_937;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1369 = "";
         var_936 = 0;
         var_937 = 0;
         var_437 = null;
         if(var_447 != null)
         {
            var_447.dispose();
            var_447 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return var_2194;
      }
      
      public function get priceInCredits() : int
      {
         return var_936;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_446 = const_485;
            }
            else
            {
               var_446 = const_454;
            }
         }
         else if(param1.length > 1)
         {
            var_446 = const_513;
         }
         else
         {
            var_446 = const_1336;
         }
      }
      
      public function get priceType() : String
      {
         return var_625;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_446)
         {
            case const_485:
               var_447 = new SingleProductContainer(this,param1);
               break;
            case const_454:
               var_447 = new MultiProductContainer(this,param1);
               break;
            case const_513:
               var_447 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_446);
         }
      }
      
      public function get localizationId() : String
      {
         return var_1369;
      }
      
      private function analyzePriceType() : void
      {
         if(var_936 > 0 && var_937 > 0)
         {
            var_625 = const_388;
         }
         else if(var_936 > 0)
         {
            var_625 = const_315;
         }
         else if(var_937 > 0)
         {
            var_625 = const_470;
         }
         else
         {
            var_625 = const_1038;
         }
      }
   }
}
