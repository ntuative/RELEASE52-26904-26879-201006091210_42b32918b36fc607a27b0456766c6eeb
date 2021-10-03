package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1750:int;
      
      private var var_1749:Boolean;
      
      private var var_2185:int;
      
      private var var_1446:String;
      
      private var var_2186:Boolean = false;
      
      private var var_1751:int;
      
      private var var_465:int;
      
      private var var_1109:String;
      
      private var var_1572:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1397:int;
      
      private var var_1753:Boolean;
      
      private var var_2187:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1750 = param1;
         var_1109 = param2;
         _objId = param3;
         var_1397 = param4;
         var_1446 = param5;
         var_1749 = param6;
         var_1753 = param7;
         var_1751 = param8;
         var_1572 = param9;
         var_2185 = param10;
         var_465 = -1;
      }
      
      public function get songId() : int
      {
         return var_2185;
      }
      
      public function get iconCallbackId() : int
      {
         return var_465;
      }
      
      public function get expiryTime() : int
      {
         return var_1751;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2187 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2186 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_465 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1753;
      }
      
      public function get slotId() : String
      {
         return var_1572;
      }
      
      public function get classId() : int
      {
         return var_1397;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1749;
      }
      
      public function get stuffData() : String
      {
         return var_1446;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1750;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2186;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2187;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1109;
      }
   }
}
