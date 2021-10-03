package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1490:int = 9;
      
      public static const const_1590:int = 4;
      
      public static const const_1669:int = 1;
      
      public static const const_1337:int = 10;
      
      public static const const_1611:int = 2;
      
      public static const const_1280:int = 7;
      
      public static const const_1254:int = 11;
      
      public static const const_1632:int = 3;
      
      public static const const_1353:int = 8;
      
      public static const const_1307:int = 5;
      
      public static const const_1521:int = 6;
      
      public static const const_1256:int = 12;
       
      
      private var var_1955:String;
      
      private var _roomId:int;
      
      private var var_1220:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1955;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1220 = param1.readInteger();
         var_1955 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1220;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
