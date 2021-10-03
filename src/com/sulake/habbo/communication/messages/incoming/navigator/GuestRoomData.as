package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1852:int;
      
      private var var_2297:String;
      
      private var var_2296:int;
      
      private var var_2295:int;
      
      private var var_740:Boolean;
      
      private var var_1844:Boolean;
      
      private var var_434:int;
      
      private var var_1243:String;
      
      private var var_1841:int;
      
      private var var_1257:int;
      
      private var _ownerName:String;
      
      private var var_698:String;
      
      private var var_2293:int;
      
      private var var_2294:RoomThumbnailData;
      
      private var var_2277:Boolean;
      
      private var var_665:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_665 = new Array();
         super();
         var_434 = param1.readInteger();
         var_740 = param1.readBoolean();
         var_698 = param1.readString();
         _ownerName = param1.readString();
         var_1841 = param1.readInteger();
         var_1852 = param1.readInteger();
         var_2293 = param1.readInteger();
         var_1243 = param1.readString();
         var_2296 = param1.readInteger();
         var_2277 = param1.readBoolean();
         var_2295 = param1.readInteger();
         var_1257 = param1.readInteger();
         var_2297 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_665.push(_loc4_);
            _loc3_++;
         }
         var_2294 = new RoomThumbnailData(param1);
         var_1844 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2293;
      }
      
      public function get roomName() : String
      {
         return var_698;
      }
      
      public function get userCount() : int
      {
         return var_1852;
      }
      
      public function get score() : int
      {
         return var_2295;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2297;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_2277;
      }
      
      public function get tags() : Array
      {
         return var_665;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1844;
      }
      
      public function get event() : Boolean
      {
         return var_740;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_665 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1257;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2296;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2294;
      }
      
      public function get doorMode() : int
      {
         return var_1841;
      }
      
      public function get flatId() : int
      {
         return var_434;
      }
      
      public function get description() : String
      {
         return var_1243;
      }
   }
}
