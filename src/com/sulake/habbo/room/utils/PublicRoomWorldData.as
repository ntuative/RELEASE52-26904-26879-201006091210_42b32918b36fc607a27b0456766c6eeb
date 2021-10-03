package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1914:Number = 1.0;
      
      private var var_149:Number = 1.0;
      
      private var var_2219:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_2219 = param1;
         var_149 = param2;
         var_1914 = param3;
      }
      
      public function get scale() : Number
      {
         return var_149;
      }
      
      public function get heightScale() : Number
      {
         return var_1914;
      }
   }
}
