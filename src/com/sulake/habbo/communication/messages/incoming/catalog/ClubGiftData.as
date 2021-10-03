package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_1827:int;
      
      private var var_1826:Boolean;
      
      private var _offerId:int;
      
      private var var_1825:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1826 = param1.readBoolean();
         var_1827 = param1.readInteger();
         var_1825 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1825;
      }
      
      public function get monthsRequired() : int
      {
         return var_1827;
      }
      
      public function get isVip() : Boolean
      {
         return var_1826;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
