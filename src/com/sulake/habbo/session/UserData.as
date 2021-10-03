package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_432:String = "";
      
      private var var_1739:String = "";
      
      private var var_1738:int = 0;
      
      private var var_1742:int = 0;
      
      private var _type:int = 0;
      
      private var var_1741:String = "";
      
      private var var_615:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_1740:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_1738 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_1741 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_432 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_615 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_1738;
      }
      
      public function set webID(param1:int) : void
      {
         var_1740 = param1;
      }
      
      public function get groupID() : String
      {
         return var_1741;
      }
      
      public function set custom(param1:String) : void
      {
         var_1739 = param1;
      }
      
      public function get figure() : String
      {
         return var_432;
      }
      
      public function get sex() : String
      {
         return var_615;
      }
      
      public function get custom() : String
      {
         return var_1739;
      }
      
      public function get webID() : int
      {
         return var_1740;
      }
      
      public function set xp(param1:int) : void
      {
         var_1742 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_1742;
      }
   }
}
