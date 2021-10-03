package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_87:Number = 0;
      
      private var _data:String = "";
      
      private var var_1518:int = 0;
      
      private var var_36:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_1986:Boolean = false;
      
      private var var_2444:String = "";
      
      private var _id:int = 0;
      
      private var var_203:Boolean = false;
      
      private var var_225:String = "";
      
      private var var_1985:int = 0;
      
      private var var_1987:int = 0;
      
      private var var_1713:int = 0;
      
      private var var_1711:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_1986 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_203)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_1986;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_203)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_225;
      }
      
      public function get state() : int
      {
         return var_36;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_203)
         {
            var_1713 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_203)
         {
            var_1985 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_203)
         {
            var_1987 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_203)
         {
            var_225 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_203)
         {
            var_1711 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_203)
         {
            var_36 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1713;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_203)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_1985;
      }
      
      public function get wallY() : Number
      {
         return var_1987;
      }
      
      public function get localY() : Number
      {
         return var_1711;
      }
      
      public function setReadOnly() : void
      {
         var_203 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_87;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_203)
         {
            var_87 = param1;
         }
      }
   }
}
