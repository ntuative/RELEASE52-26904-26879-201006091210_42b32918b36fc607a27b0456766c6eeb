package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_2213:int;
      
      private var var_1211:int;
      
      private var var_741:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1211 = param1.readInteger();
         var_2213 = param1.readInteger();
         var_741 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_741.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get probabilityDenominator() : int
      {
         return var_2213;
      }
      
      public function get prizes() : Array
      {
         return var_741;
      }
      
      public function get prizeLevelId() : int
      {
         return var_1211;
      }
   }
}
