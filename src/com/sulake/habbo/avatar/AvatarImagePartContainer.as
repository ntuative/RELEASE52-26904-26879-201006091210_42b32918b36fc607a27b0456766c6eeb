package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2261:int;
      
      private var var_2262:String;
      
      private var var_1468:IActionDefinition;
      
      private var var_2260:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2259:String;
      
      private var var_2264:String;
      
      private var var_1876:Boolean;
      
      private var var_2263:ColorTransform;
      
      private var var_1677:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2262 = param1;
         var_2259 = param2;
         var_2261 = param3;
         _color = param4;
         _frames = param5;
         var_1468 = param6;
         var_1876 = param7;
         var_1677 = param8;
         var_2264 = param9;
         var_2260 = param10;
         var_2263 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1876;
      }
      
      public function get partType() : String
      {
         return var_2259;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1677;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2260;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2261;
      }
      
      public function get flippedPartType() : String
      {
         return var_2264;
      }
      
      public function get bodyPartId() : String
      {
         return var_2262;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1468;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2263;
      }
   }
}
