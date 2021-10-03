package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_1659:int;
      
      private var var_2241:String;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_2241 = param1.readString();
         var_1659 = param1.readInteger();
      }
      
      public function get productItemTypeId() : int
      {
         return var_1659;
      }
      
      public function get productItemType() : String
      {
         return var_2241;
      }
   }
}
