package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1884:int;
      
      private var var_1886:int;
      
      private var var_1887:int;
      
      private var _userName:String;
      
      private var var_1888:int;
      
      private var var_1883:int;
      
      private var var_1885:int;
      
      private var _userId:int;
      
      private var var_798:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1883 = param1.readInteger();
         var_1888 = param1.readInteger();
         var_798 = param1.readBoolean();
         var_1887 = param1.readInteger();
         var_1886 = param1.readInteger();
         var_1884 = param1.readInteger();
         var_1885 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1885;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_798;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1888;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1886;
      }
      
      public function get cautionCount() : int
      {
         return var_1884;
      }
      
      public function get cfhCount() : int
      {
         return var_1887;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1883;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
