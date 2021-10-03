package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1381:String = "F";
      
      public static const const_1028:String = "M";
       
      
      private var var_88:Number = 0;
      
      private var var_432:String = "";
      
      private var var_2054:int = 0;
      
      private var var_1739:String = "";
      
      private var var_1738:int = 0;
      
      private var var_1742:int = 0;
      
      private var var_1741:String = "";
      
      private var var_615:String = "";
      
      private var _id:int = 0;
      
      private var var_203:Boolean = false;
      
      private var var_225:int = 0;
      
      private var var_2055:String = "";
      
      private var _name:String = "";
      
      private var var_1740:int = 0;
      
      private var _y:Number = 0;
      
      private var var_87:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_87;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_225;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_203)
         {
            var_225 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_203)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2054;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_203)
         {
            var_1738 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2055;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_203)
         {
            var_1741 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_203)
         {
            var_2055 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_203)
         {
            var_1742 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_203)
         {
            var_432 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_203)
         {
            var_2054 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_203)
         {
            var_615 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1738;
      }
      
      public function get groupID() : String
      {
         return var_1741;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_203)
         {
            var_1740 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_203)
         {
            var_1739 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_203 = true;
      }
      
      public function get sex() : String
      {
         return var_615;
      }
      
      public function get figure() : String
      {
         return var_432;
      }
      
      public function get webID() : int
      {
         return var_1740;
      }
      
      public function get custom() : String
      {
         return var_1739;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_203)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_203)
         {
            var_87 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_203)
         {
            var_88 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1742;
      }
   }
}
