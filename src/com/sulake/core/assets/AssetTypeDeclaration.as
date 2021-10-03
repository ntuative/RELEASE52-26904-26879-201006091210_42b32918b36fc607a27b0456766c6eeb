package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2075:Class;
      
      private var var_2076:Class;
      
      private var var_2074:String;
      
      private var var_1298:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2074 = param1;
         var_2076 = param2;
         var_2075 = param3;
         if(rest == null)
         {
            var_1298 = new Array();
         }
         else
         {
            var_1298 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2075;
      }
      
      public function get assetClass() : Class
      {
         return var_2076;
      }
      
      public function get mimeType() : String
      {
         return var_2074;
      }
      
      public function get fileTypes() : Array
      {
         return var_1298;
      }
   }
}
