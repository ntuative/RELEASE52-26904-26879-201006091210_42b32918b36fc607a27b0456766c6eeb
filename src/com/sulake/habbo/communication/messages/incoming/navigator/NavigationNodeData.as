package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1289:int;
      
      private var var_1610:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1289 = param1;
         var_1610 = param2;
         Logger.log("READ NODE: " + var_1289 + ", " + var_1610);
      }
      
      public function get nodeName() : String
      {
         return var_1610;
      }
      
      public function get nodeId() : int
      {
         return var_1289;
      }
   }
}
