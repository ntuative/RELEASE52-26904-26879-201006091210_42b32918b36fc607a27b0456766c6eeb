package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2258:Date;
      
      private var var_1393:Boolean = false;
      
      private var _type:int;
      
      private var var_383:BitmapData;
      
      private var var_276:Boolean = false;
      
      private var var_1370:int;
      
      private var var_642:int = 1;
      
      private var var_1129:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_383;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_642;
         if(var_642 < 0)
         {
            var_642 = 0;
         }
         var_1129 = var_1370;
         var_276 = false;
         var_1393 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_1129 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_276;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_383 = param1;
      }
      
      public function get duration() : int
      {
         return var_1370;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1393;
      }
      
      public function get effectsInInventory() : int
      {
         return var_642;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_383;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_276)
         {
            var_2258 = new Date();
         }
         var_276 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_642 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_276)
         {
            _loc1_ = var_1129 - (new Date().valueOf() - var_2258.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_1129;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1393 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1370 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
