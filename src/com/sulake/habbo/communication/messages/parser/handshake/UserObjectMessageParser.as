package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_432:String;
      
      private var var_2384:String;
      
      private var var_2385:int;
      
      private var var_2383:int;
      
      private var var_615:String;
      
      private var var_1258:String;
      
      private var _name:String;
      
      private var var_498:int;
      
      private var var_863:int;
      
      private var var_2381:int;
      
      private var _respectTotal:int;
      
      private var var_2382:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2383;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1258;
      }
      
      public function get customData() : String
      {
         return this.var_2384;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_498;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2385;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2382;
      }
      
      public function get figure() : String
      {
         return this.var_432;
      }
      
      public function get respectTotal() : int
      {
         return this._respectTotal;
      }
      
      public function get sex() : String
      {
         return this.var_615;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_432 = param1.readString();
         this.var_615 = param1.readString();
         this.var_2384 = param1.readString();
         this.var_1258 = param1.readString();
         this.var_2381 = param1.readInteger();
         this.var_2382 = param1.readString();
         this.var_2385 = param1.readInteger();
         this.var_2383 = param1.readInteger();
         this._respectTotal = param1.readInteger();
         this.var_863 = param1.readInteger();
         this.var_498 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2381;
      }
      
      public function get respectLeft() : int
      {
         return this.var_863;
      }
   }
}
