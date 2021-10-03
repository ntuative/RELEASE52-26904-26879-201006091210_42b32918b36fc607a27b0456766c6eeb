package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.utils.IBitmapDataContainer;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class BitmapWrapperController extends WindowController implements IBitmapWrapperWindow, IBitmapDataContainer
   {
      
      protected static const const_1444:String = null;
      
      protected static const const_1057:String = "handle_bitmap_disposing";
      
      protected static const const_1445:Boolean = true;
      
      protected static const const_1056:String = "bitmap_asset_name";
       
      
      protected var var_464:Boolean = true;
      
      protected var _bitmapData:BitmapData;
      
      protected var var_1156:String;
      
      public function BitmapWrapperController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function get disposesBitmap() : Boolean
      {
         return var_464;
      }
      
      public function set disposesBitmap(param1:Boolean) : void
      {
         var_464 = param1;
      }
      
      override public function clone() : IWindow
      {
         var _loc1_:BitmapWrapperController = super.clone() as BitmapWrapperController;
         _loc1_._bitmapData = _bitmapData;
         _loc1_.var_464 = var_464;
         _loc1_.var_1156 = var_1156;
         return _loc1_;
      }
      
      public function set bitmap(param1:BitmapData) : void
      {
         if(var_464 && _bitmapData && param1 != _bitmapData)
         {
            _bitmapData.dispose();
         }
         _bitmapData = param1;
         var_16.invalidate(this,var_8,WindowRedrawFlag.const_80);
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case const_1057:
                  var_464 = _loc2_.value as Boolean;
                  break;
               case const_1056:
                  var_1156 = _loc2_.value as String;
                  break;
            }
         }
         super.properties = param1;
      }
      
      override public function dispose() : void
      {
         if(_bitmapData)
         {
            if(var_464)
            {
               _bitmapData.dispose();
            }
            _bitmapData = null;
         }
         super.dispose();
      }
      
      public function get bitmap() : BitmapData
      {
         return _bitmapData;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         bitmap = param1;
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         _loc1_.push(new PropertyStruct(const_1057,var_464,PropertyStruct.const_64,var_464 != const_1445));
         _loc1_.push(new PropertyStruct(const_1056,var_1156,PropertyStruct.STRING,var_1156 != const_1444));
         return _loc1_;
      }
      
      public function get bitmapData() : BitmapData
      {
         return _bitmapData;
      }
   }
}
