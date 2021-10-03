package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_242:String = "RWUIUE_PEER";
      
      public static const const_205:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1345:String = "BOT";
      
      public static const const_846:int = 2;
      
      public static const const_1364:int = 0;
      
      public static const const_831:int = 3;
       
      
      private var var_432:String = "";
      
      private var var_1259:String = "";
      
      private var var_2181:Boolean = false;
      
      private var var_1742:int = 0;
      
      private var var_2021:int = 0;
      
      private var var_2180:Boolean = false;
      
      private var var_1258:String = "";
      
      private var var_2176:Boolean = false;
      
      private var var_863:int = 0;
      
      private var var_2175:Boolean = true;
      
      private var var_1039:int = 0;
      
      private var var_2183:Boolean = false;
      
      private var var_1281:Boolean = false;
      
      private var var_2182:Boolean = false;
      
      private var var_2019:int = 0;
      
      private var var_2177:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_274:Array;
      
      private var var_1284:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1740:int = 0;
      
      private var var_2179:Boolean = false;
      
      private var var_2178:int = 0;
      
      private var var_2020:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_274 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_2021;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_2021 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2181;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2175;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2175 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2176 = param1;
      }
      
      public function get motto() : String
      {
         return var_1259;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2183 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1281;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1259 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2179;
      }
      
      public function get groupBadgeId() : String
      {
         return var_2020;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1281 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2177;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_2019 = param1;
      }
      
      public function get badges() : Array
      {
         return var_274;
      }
      
      public function get amIController() : Boolean
      {
         return var_2180;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2180 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2179 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2178 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_2020 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1258 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2176;
      }
      
      public function set figure(param1:String) : void
      {
         var_432 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_2019;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1284;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2183;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_863 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2178;
      }
      
      public function get realName() : String
      {
         return var_1258;
      }
      
      public function get figure() : String
      {
         return var_432;
      }
      
      public function set webID(param1:int) : void
      {
         var_1740 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_274 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2182 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2177 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_863;
      }
      
      public function get webID() : int
      {
         return var_1740;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1039 = param1;
      }
      
      public function get xp() : int
      {
         return var_1742;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2181 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1039;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2182;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1284 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         var_1742 = param1;
      }
   }
}
