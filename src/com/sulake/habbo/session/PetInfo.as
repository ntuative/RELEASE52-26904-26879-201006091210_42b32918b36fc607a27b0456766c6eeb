package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1917:int;
      
      private var var_1915:int;
      
      private var var_1920:int;
      
      private var var_2069:int;
      
      private var _nutrition:int;
      
      private var var_1231:int;
      
      private var var_2068:int;
      
      private var var_2071:int;
      
      private var _energy:int;
      
      private var var_1921:int;
      
      private var var_2070:int;
      
      private var _ownerName:String;
      
      private var var_1919:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1917;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1915 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1917 = param1;
      }
      
      public function get petId() : int
      {
         return var_1231;
      }
      
      public function get experienceMax() : int
      {
         return var_2071;
      }
      
      public function get nutritionMax() : int
      {
         return var_2069;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_2068 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1919;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1231 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_2070;
      }
      
      public function get respect() : int
      {
         return var_1915;
      }
      
      public function get levelMax() : int
      {
         return var_2068;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_2071 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1920 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_2069 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1919 = param1;
      }
      
      public function get experience() : int
      {
         return var_1920;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_2070 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1921 = param1;
      }
      
      public function get age() : int
      {
         return var_1921;
      }
   }
}
