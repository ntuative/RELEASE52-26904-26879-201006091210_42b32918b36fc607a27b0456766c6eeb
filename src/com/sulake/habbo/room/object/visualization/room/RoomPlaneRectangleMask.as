package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_1904:Number = 0.0;
      
      private var var_1906:Number = 0.0;
      
      private var var_1905:Number = 0.0;
      
      private var var_1907:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1906 = param1;
         var_1905 = param2;
         var_1904 = param3;
         var_1907 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1906;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1904;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1905;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1907;
      }
   }
}
