package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1656:int;
      
      private var var_1655:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1656;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1656 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1656 = this.var_1656;
         _loc1_.var_1655 = this.var_1655;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1655 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1655;
      }
   }
}
