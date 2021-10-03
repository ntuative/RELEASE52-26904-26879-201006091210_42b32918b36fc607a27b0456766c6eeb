package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1834:int;
      
      private var var_1421:int;
      
      private var var_1835:int;
      
      private var _offerId:int;
      
      private var var_1837:int;
      
      private var var_1836:int;
      
      private var var_1833:Boolean;
      
      private var var_1832:int;
      
      private var var_1831:Boolean;
      
      private var var_1361:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1361 = param1.readString();
         var_1421 = param1.readInteger();
         var_1831 = param1.readBoolean();
         var_1833 = param1.readBoolean();
         var_1835 = param1.readInteger();
         var_1832 = param1.readInteger();
         var_1837 = param1.readInteger();
         var_1834 = param1.readInteger();
         var_1836 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_1837;
      }
      
      public function get month() : int
      {
         return var_1834;
      }
      
      public function get price() : int
      {
         return var_1421;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_1835;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1832;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1831;
      }
      
      public function get day() : int
      {
         return var_1836;
      }
      
      public function get vip() : Boolean
      {
         return var_1833;
      }
      
      public function get productCode() : String
      {
         return var_1361;
      }
   }
}
