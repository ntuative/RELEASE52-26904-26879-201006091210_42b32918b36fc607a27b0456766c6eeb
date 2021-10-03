package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_432:String;
      
      private var var_1256:String;
      
      private var var_1259:String;
      
      private var var_1257:int;
      
      private var var_610:int;
      
      private var var_1258:String;
      
      private var _name:String;
      
      private var var_1204:Boolean;
      
      private var var_798:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_610 = param1.readInteger();
         this.var_798 = param1.readBoolean();
         this.var_1204 = param1.readBoolean();
         this.var_432 = param1.readString();
         this.var_1257 = param1.readInteger();
         this.var_1259 = param1.readString();
         this.var_1256 = param1.readString();
         this.var_1258 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_610;
      }
      
      public function get realName() : String
      {
         return var_1258;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1259;
      }
      
      public function get categoryId() : int
      {
         return var_1257;
      }
      
      public function get online() : Boolean
      {
         return var_798;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1204;
      }
      
      public function get lastAccess() : String
      {
         return var_1256;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_432;
      }
   }
}
