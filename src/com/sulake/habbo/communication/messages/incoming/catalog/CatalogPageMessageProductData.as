package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_208:String = "e";
      
      public static const const_82:String = "i";
      
      public static const const_83:String = "s";
       
      
      private var var_1146:String;
      
      private var var_1430:String;
      
      private var var_1429:int;
      
      private var var_2188:int;
      
      private var var_1145:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1430 = param1.readString();
         var_2188 = param1.readInteger();
         var_1146 = param1.readString();
         var_1145 = param1.readInteger();
         var_1429 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1145;
      }
      
      public function get productType() : String
      {
         return var_1430;
      }
      
      public function get expiration() : int
      {
         return var_1429;
      }
      
      public function get furniClassId() : int
      {
         return var_2188;
      }
      
      public function get extraParam() : String
      {
         return var_1146;
      }
   }
}
