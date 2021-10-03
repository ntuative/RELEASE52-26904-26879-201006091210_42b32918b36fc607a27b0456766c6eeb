package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MeMenuSettingsViewSlider
   {
       
      
      private var var_806:MeMenuSettingsView;
      
      private var var_2439:int;
      
      private var var_566:BitmapData;
      
      private var var_995:Number = 1.0;
      
      private var var_1448:int;
      
      private var var_676:Number = 0.0;
      
      private var _sliderContainer:IWindowContainer;
      
      private var var_567:BitmapData;
      
      public function MeMenuSettingsViewSlider(param1:MeMenuSettingsView, param2:IWindowContainer, param3:IAssetLibrary, param4:Number = 0.0, param5:Number = 1.0)
      {
         super();
         var_806 = param1;
         _sliderContainer = param2;
         var_676 = param4;
         var_995 = param5;
         storeAssets(param3);
         displaySlider();
      }
      
      private function buttonProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_493)
         {
            return;
         }
         var_806.saveVolume(getValue(param2.x),false);
      }
      
      private function displaySlider() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_sliderContainer == null)
         {
            return;
         }
         _loc2_ = _sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow;
         if(_loc2_ != null && var_567 != null)
         {
            _loc2_.bitmap = new BitmapData(var_567.width,var_567.height,true,16777215);
            _loc2_.bitmap.copyPixels(var_567,var_567.rect,new Point(0,0),null,null,true);
         }
         _loc1_ = _sliderContainer.findChildByName("slider_movement_area") as IWindowContainer;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.findChildByName("slider_button") as IBitmapWrapperWindow;
            if(_loc2_ != null && var_566 != null)
            {
               _loc2_.bitmap = new BitmapData(var_566.width,var_566.height,true,16777215);
               _loc2_.bitmap.copyPixels(var_566,var_566.rect,new Point(0,0),null,null,true);
               _loc2_.procedure = buttonProcedure;
               var_1448 = _loc1_.width - _loc2_.width;
            }
         }
      }
      
      private function storeAssets(param1:IAssetLibrary) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_base"));
         var_567 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_button"));
         var_566 = BitmapData(_loc2_.content);
      }
      
      public function set max(param1:Number) : void
      {
         var_995 = param1;
         setValue(var_806.volume);
      }
      
      public function dispose() : void
      {
         var_806 = null;
         _sliderContainer = null;
         var_567 = null;
         var_566 = null;
      }
      
      private function getSliderPosition(param1:Number) : int
      {
         return int(var_1448 * (Number(param1 - var_676) / (var_995 - var_676)));
      }
      
      public function set min(param1:Number) : void
      {
         var_676 = param1;
         setValue(var_806.volume);
      }
      
      public function setValue(param1:Number) : void
      {
         if(_sliderContainer == null)
         {
            return;
         }
         var _loc2_:IWindow = _sliderContainer.findChildByName("slider_button");
         if(_loc2_ != null)
         {
            _loc2_.x = getSliderPosition(param1);
         }
      }
      
      private function getValue(param1:Number) : Number
      {
         return param1 / var_1448 * (var_995 - var_676) + var_676;
      }
   }
}
