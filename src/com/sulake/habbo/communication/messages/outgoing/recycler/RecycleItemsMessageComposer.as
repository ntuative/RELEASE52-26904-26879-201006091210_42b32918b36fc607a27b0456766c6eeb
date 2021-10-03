package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_921:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_921 = new Array();
         var_921.push(param1.length);
         var_921 = var_921.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_921;
      }
   }
}
