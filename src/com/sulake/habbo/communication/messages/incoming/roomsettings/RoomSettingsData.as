package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_494:int = 0;
      
      public static const const_123:int = 2;
      
      public static const const_165:int = 1;
      
      public static const const_588:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_1840:Boolean;
      
      private var var_1842:Boolean;
      
      private var var_2135:int;
      
      private var var_1838:Array;
      
      private var var_2134:int;
      
      private var var_1844:Boolean;
      
      private var var_1243:String;
      
      private var var_1843:int;
      
      private var var_1839:Boolean;
      
      private var var_1841:int;
      
      private var var_1257:int;
      
      private var _roomId:int;
      
      private var var_665:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1843;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1843 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         var_1839 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_665;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1844;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_2134 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1838 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_665 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1840;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1842;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_2135;
      }
      
      public function get categoryId() : int
      {
         return var_1257;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1844 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return var_1839;
      }
      
      public function get controllerCount() : int
      {
         return var_2134;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1838;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1841 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1840 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1842 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_2135 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1841;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1257 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1243 = param1;
      }
      
      public function get description() : String
      {
         return var_1243;
      }
   }
}
