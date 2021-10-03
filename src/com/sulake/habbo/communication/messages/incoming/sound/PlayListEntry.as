package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_2185:int;
      
      private var var_2328:int = 0;
      
      private var var_2326:String;
      
      private var var_2327:int;
      
      private var var_2329:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_2185 = param1;
         var_2327 = param2;
         var_2329 = param3;
         var_2326 = param4;
      }
      
      public function get length() : int
      {
         return var_2327;
      }
      
      public function get name() : String
      {
         return var_2329;
      }
      
      public function get creator() : String
      {
         return var_2326;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_2328;
      }
      
      public function get id() : int
      {
         return var_2185;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_2328 = param1;
      }
   }
}
