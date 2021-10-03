package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_610:String;
      
      private var _id:int;
      
      private var var_1875:String = "";
      
      private var var_1877:int;
      
      private var var_1878:String;
      
      private var var_1876:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_1877 = parseInt(param1.@pattern);
         var_610 = String(param1.@gender);
         var_1876 = Boolean(parseInt(param1.@colorable));
         var_1875 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_1875;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1876;
      }
      
      public function get gender() : String
      {
         return var_610;
      }
      
      public function get patternId() : int
      {
         return var_1877;
      }
      
      public function get avatarFigureString() : String
      {
         return var_1878;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_1878 = param1;
      }
   }
}
