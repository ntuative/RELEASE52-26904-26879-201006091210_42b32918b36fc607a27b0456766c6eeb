package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PopularTagData
   {
       
      
      private var var_1852:int;
      
      private var var_2169:String;
      
      public function PopularTagData(param1:IMessageDataWrapper)
      {
         super();
         var_2169 = param1.readString();
         var_1852 = param1.readInteger();
      }
      
      public function get tagName() : String
      {
         return var_2169;
      }
      
      public function get userCount() : int
      {
         return var_1852;
      }
   }
}
