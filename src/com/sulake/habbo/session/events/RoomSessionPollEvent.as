package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_134:String = "RSPE_POLL_CONTENT";
      
      public static const const_120:String = "RSPE_POLL_OFFER";
      
      public static const const_67:String = "RSPE_POLL_ERROR";
       
      
      private var var_1005:Array = null;
      
      private var var_1178:String = "";
      
      private var var_1190:String;
      
      private var var_1179:String = "";
      
      private var var_1004:int = 0;
      
      private var _id:int = -1;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         _id = param3;
         super(param1,param2);
      }
      
      public function get questionArray() : Array
      {
         return var_1005;
      }
      
      public function get startMessage() : String
      {
         return var_1178;
      }
      
      public function get summary() : String
      {
         return var_1190;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1178 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_1004 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1190 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_1004;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1179 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1179;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_1005 = param1;
      }
   }
}
