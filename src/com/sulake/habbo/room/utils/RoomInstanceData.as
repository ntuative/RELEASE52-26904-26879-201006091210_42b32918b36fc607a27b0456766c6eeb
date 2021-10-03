package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_951:LegacyWallGeometry = null;
      
      private var var_635:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_636:TileHeightMap = null;
      
      private var var_2219:String = null;
      
      private var _roomId:int = 0;
      
      private var var_634:SelectedRoomObjectData = null;
      
      private var var_950:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_951 = new LegacyWallGeometry();
         var_950 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_635 != null)
         {
            var_635.dispose();
         }
         var_635 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_636 != null)
         {
            var_636.dispose();
         }
         var_636 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2219 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_951;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_634;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_950;
      }
      
      public function dispose() : void
      {
         if(var_636 != null)
         {
            var_636.dispose();
            var_636 = null;
         }
         if(var_951 != null)
         {
            var_951.dispose();
            var_951 = null;
         }
         if(var_950 != null)
         {
            var_950.dispose();
            var_950 = null;
         }
         if(var_635 != null)
         {
            var_635.dispose();
            var_635 = null;
         }
         if(var_634 != null)
         {
            var_634.dispose();
            var_634 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_636;
      }
      
      public function get worldType() : String
      {
         return var_2219;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_634 != null)
         {
            var_634.dispose();
         }
         var_634 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_635;
      }
   }
}
