package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToWidth implements BinarySearchTest
   {
       
      
      private var var_444:int;
      
      private var var_173:String;
      
      private var var_202:ITextWindow;
      
      public function CutToWidth()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_173 = param1;
         var_202 = param2;
         var_444 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_202.text = var_173.substring(0,param1) + "...";
         return var_202.textWidth > var_444;
      }
   }
}
