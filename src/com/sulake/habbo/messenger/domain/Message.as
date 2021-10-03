package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_670:int = 2;
      
      public static const const_952:int = 6;
      
      public static const const_677:int = 1;
      
      public static const const_552:int = 3;
      
      public static const const_956:int = 4;
      
      public static const const_575:int = 5;
       
      
      private var var_2232:String;
      
      private var var_1121:int;
      
      private var var_1976:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1121 = param2;
         var_1976 = param3;
         var_2232 = param4;
      }
      
      public function get time() : String
      {
         return var_2232;
      }
      
      public function get senderId() : int
      {
         return var_1121;
      }
      
      public function get messageText() : String
      {
         return var_1976;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
