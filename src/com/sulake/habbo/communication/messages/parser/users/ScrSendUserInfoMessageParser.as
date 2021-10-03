package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1177:int = 2;
      
      public static const const_1585:int = 1;
       
      
      private var var_2253:int;
      
      private var var_2254:int;
      
      private var var_2013:Boolean;
      
      private var var_2252:int;
      
      private var var_1373:String;
      
      private var var_2255:Boolean;
      
      private var var_2015:int;
      
      private var var_2251:int;
      
      private var var_2016:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2254;
      }
      
      public function get isVIP() : Boolean
      {
         return var_2013;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2251;
      }
      
      public function get memberPeriods() : int
      {
         return var_2252;
      }
      
      public function get productName() : String
      {
         return var_1373;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2255;
      }
      
      public function get responseType() : int
      {
         return var_2253;
      }
      
      public function get pastClubDays() : int
      {
         return var_2016;
      }
      
      public function get pastVipDays() : int
      {
         return var_2015;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1373 = param1.readString();
         var_2254 = param1.readInteger();
         var_2252 = param1.readInteger();
         var_2251 = param1.readInteger();
         var_2253 = param1.readInteger();
         var_2255 = param1.readBoolean();
         var_2013 = param1.readBoolean();
         var_2016 = param1.readInteger();
         var_2015 = param1.readInteger();
         return true;
      }
   }
}
