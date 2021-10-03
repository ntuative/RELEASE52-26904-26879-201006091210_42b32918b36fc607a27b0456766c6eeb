package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1824:Boolean;
      
      private var var_1825:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1824 = Boolean(parseInt(param1.@club));
         var_1825 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1824;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1825;
      }
   }
}
