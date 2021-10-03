package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1623:int = -1;
      
      private var var_1392:Boolean;
      
      private var var_1391:String;
      
      private var var_2245:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_2245 = String(param1["set-type"]);
         var_1391 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1392 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1623 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1391;
      }
      
      public function get staticId() : int
      {
         return var_1623;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1623 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1392;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1392 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1391 = param1;
      }
      
      public function get setType() : String
      {
         return var_2245;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
