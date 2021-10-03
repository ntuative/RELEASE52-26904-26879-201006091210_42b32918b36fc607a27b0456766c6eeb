package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_367:Number = 0.5;
      
      private static const const_789:int = 3;
      
      private static const const_1096:Number = 1;
       
      
      private var var_1966:Boolean = false;
      
      private var var_1971:Boolean = false;
      
      private var var_1043:int = 0;
      
      private var var_267:Vector3d = null;
      
      private var var_1968:int = 0;
      
      private var var_1972:int = 0;
      
      private var var_1967:Boolean = false;
      
      private var var_1973:int = -2;
      
      private var var_1970:Boolean = false;
      
      private var var_1975:int = 0;
      
      private var var_1974:int = -1;
      
      private var var_416:Vector3d = null;
      
      private var var_1969:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1968;
      }
      
      public function get targetId() : int
      {
         return var_1974;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1975 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1968 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1966 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1974 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1971 = param1;
      }
      
      public function dispose() : void
      {
         var_416 = null;
         var_267 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_416 == null)
         {
            var_416 = new Vector3d();
         }
         var_416.assign(param1);
         var_1043 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1973;
      }
      
      public function get screenHt() : int
      {
         return var_1969;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1972 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_267;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1969 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1975;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1966;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1971;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_416 != null && var_267 != null)
         {
            ++var_1043;
            _loc2_ = Vector3d.dif(var_416,var_267);
            if(_loc2_.length <= const_367)
            {
               var_267 = var_416;
               var_416 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_367 * (const_789 + 1))
               {
                  _loc2_.mul(const_367);
               }
               else if(var_1043 <= const_789)
               {
                  _loc2_.mul(const_367);
               }
               else
               {
                  _loc2_.mul(const_1096);
               }
               var_267 = Vector3d.sum(var_267,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1967 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1972;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1970 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1973 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_267 != null)
         {
            return;
         }
         var_267 = new Vector3d();
         var_267.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1967;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1970;
      }
   }
}
