package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1109:String;
      
      private var var_1701:int;
      
      private var var_1979:int;
      
      private var var_1518:int;
      
      private var var_1983:int;
      
      private var _category:int;
      
      private var var_2443:int;
      
      private var var_1982:int;
      
      private var var_1980:int;
      
      private var var_1978:int;
      
      private var var_1981:int;
      
      private var var_1977:Boolean;
      
      private var var_1446:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1701 = param1;
         var_1109 = param2;
         var_1979 = param3;
         var_1978 = param4;
         _category = param5;
         var_1446 = param6;
         var_1518 = param7;
         var_1980 = param8;
         var_1982 = param9;
         var_1981 = param10;
         var_1983 = param11;
         var_1977 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1978;
      }
      
      public function get extra() : int
      {
         return var_1518;
      }
      
      public function get stuffData() : String
      {
         return var_1446;
      }
      
      public function get groupable() : Boolean
      {
         return var_1977;
      }
      
      public function get creationMonth() : int
      {
         return var_1981;
      }
      
      public function get roomItemID() : int
      {
         return var_1979;
      }
      
      public function get itemType() : String
      {
         return var_1109;
      }
      
      public function get itemID() : int
      {
         return var_1701;
      }
      
      public function get songID() : int
      {
         return var_1518;
      }
      
      public function get method_7() : int
      {
         return var_1980;
      }
      
      public function get creationYear() : int
      {
         return var_1983;
      }
      
      public function get creationDay() : int
      {
         return var_1982;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
