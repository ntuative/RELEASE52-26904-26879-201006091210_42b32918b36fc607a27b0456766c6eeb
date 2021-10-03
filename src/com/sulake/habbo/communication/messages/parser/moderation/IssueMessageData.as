package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_158:int = 1;
      
      public static const const_1297:int = 3;
      
      public static const const_441:int = 2;
       
      
      private var var_2228:int;
      
      private var var_2041:int;
      
      private var var_2226:int;
      
      private var var_1790:int;
      
      private var var_36:int;
      
      private var var_434:int;
      
      private var var_1188:int;
      
      private var var_2073:int;
      
      private var var_1037:int;
      
      private var _roomResources:String;
      
      private var var_1767:int;
      
      private var var_2222:int;
      
      private var var_2224:String;
      
      private var var_2221:String;
      
      private var var_2220:int = 0;
      
      private var var_1239:String;
      
      private var _message:String;
      
      private var var_2227:int;
      
      private var var_2225:String;
      
      private var var_1257:int;
      
      private var var_698:String;
      
      private var var_2223:String;
      
      private var var_1542:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1037 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_2220 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_2222;
      }
      
      public function set roomName(param1:String) : void
      {
         var_698 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1767 = param1;
      }
      
      public function get state() : int
      {
         return var_36;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_698;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1790 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_36 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_2041;
      }
      
      public function get priority() : int
      {
         return var_2228 + var_2220;
      }
      
      public function set issueId(param1:int) : void
      {
         var_2073 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_2221;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1542) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1257;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_2222 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1188;
      }
      
      public function set flatType(param1:String) : void
      {
         var_2224 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1767;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1790;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_2223 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1239 = param1;
      }
      
      public function get issueId() : int
      {
         return var_2073;
      }
      
      public function set priority(param1:int) : void
      {
         var_2228 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_2041 = param1;
      }
      
      public function get flatType() : String
      {
         return var_2224;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_2226 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_2221 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_2227 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1239;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1188 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_2226;
      }
      
      public function set flatId(param1:int) : void
      {
         var_434 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1257 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1542 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_2227;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_2225 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1542;
      }
      
      public function get reportedUserId() : int
      {
         return var_1037;
      }
      
      public function get flatId() : int
      {
         return var_434;
      }
      
      public function get flatOwnerName() : String
      {
         return var_2223;
      }
      
      public function get reporterUserName() : String
      {
         return var_2225;
      }
   }
}
