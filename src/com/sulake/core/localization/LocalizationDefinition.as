package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1619:String;
      
      private var var_663:String;
      
      private var var_1620:String;
      
      private var var_1621:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1621 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1619 = _loc5_[0];
         var_1620 = _loc5_[1];
         _name = param2;
         var_663 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1619;
      }
      
      public function get languageCode() : String
      {
         return var_1621;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_663;
      }
      
      public function get encoding() : String
      {
         return var_1620;
      }
      
      public function get id() : String
      {
         return var_1621 + "_" + var_1619 + "." + var_1620;
      }
   }
}
