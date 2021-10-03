package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_419:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_455:int = 0;
      
      public static const const_995:int = 2;
      
      public static const const_880:int = 1;
      
      public static const const_591:Boolean = false;
      
      public static const const_637:String = "";
      
      public static const const_380:int = 0;
      
      public static const const_413:int = 0;
      
      public static const const_508:int = 0;
       
      
      private var var_1769:int = 0;
      
      private var var_1771:String = "";
      
      private var var_1573:int = 0;
      
      private var var_1770:int = 0;
      
      private var var_1774:Number = 0;
      
      private var var_1773:int = 255;
      
      private var var_1772:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1769;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1573 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1774;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1770 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1769 = param1;
      }
      
      public function get tag() : String
      {
         return var_1771;
      }
      
      public function get alpha() : int
      {
         return var_1773;
      }
      
      public function get ink() : int
      {
         return var_1573;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1774 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1770;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1772 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1772;
      }
      
      public function set tag(param1:String) : void
      {
         var_1771 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1773 = param1;
      }
   }
}
