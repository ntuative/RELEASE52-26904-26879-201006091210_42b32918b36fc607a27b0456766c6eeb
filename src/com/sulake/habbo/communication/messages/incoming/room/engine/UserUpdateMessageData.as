package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_87:Number = 0;
      
      private var var_225:int = 0;
      
      private var var_2125:int = 0;
      
      private var var_2312:Number = 0;
      
      private var var_2314:Number = 0;
      
      private var var_2313:Number = 0;
      
      private var var_2311:Number = 0;
      
      private var var_2315:Boolean = false;
      
      private var var_88:Number = 0;
      
      private var _id:int = 0;
      
      private var var_231:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_231 = [];
         super();
         _id = param1;
         var_88 = param2;
         _y = param3;
         var_87 = param4;
         var_2311 = param5;
         var_225 = param6;
         var_2125 = param7;
         var_2312 = param8;
         var_2314 = param9;
         var_2313 = param10;
         var_2315 = param11;
         var_231 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_87;
      }
      
      public function get dir() : int
      {
         return var_225;
      }
      
      public function get localZ() : Number
      {
         return var_2311;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2315;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_2125;
      }
      
      public function get targetX() : Number
      {
         return var_2312;
      }
      
      public function get targetY() : Number
      {
         return var_2314;
      }
      
      public function get targetZ() : Number
      {
         return var_2313;
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      public function get actions() : Array
      {
         return var_231.slice();
      }
   }
}
