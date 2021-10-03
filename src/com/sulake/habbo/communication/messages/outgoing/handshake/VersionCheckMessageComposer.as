package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2268:String;
      
      private var var_1294:String;
      
      private var var_2267:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2267 = param1;
         var_1294 = param2;
         var_2268 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2267,var_1294,var_2268];
      }
      
      public function dispose() : void
      {
      }
   }
}
