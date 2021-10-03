package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1210:Array;
      
      private var var_2132:String;
      
      private var var_2131:String;
      
      private var var_2133:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1210 = param1;
         var_2132 = param2;
         var_2131 = param3;
         var_2133 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1210;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_2132;
      }
      
      public function get colourAssetName() : String
      {
         return var_2131;
      }
      
      public function get chosenColourAssetName() : String
      {
         return var_2133;
      }
   }
}
