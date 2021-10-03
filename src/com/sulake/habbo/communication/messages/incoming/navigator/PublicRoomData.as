package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2041:int;
      
      private var var_2040:String;
      
      private var var_1790:int;
      
      private var _disposed:Boolean;
      
      private var var_2039:int;
      
      private var var_2042:String;
      
      private var var_1289:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_2042 = param1.readString();
         var_2041 = param1.readInteger();
         var_1790 = param1.readInteger();
         var_2040 = param1.readString();
         var_2039 = param1.readInteger();
         var_1289 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2039;
      }
      
      public function get worldId() : int
      {
         return var_1790;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_2042;
      }
      
      public function get unitPort() : int
      {
         return var_2041;
      }
      
      public function get castLibs() : String
      {
         return var_2040;
      }
      
      public function get nodeId() : int
      {
         return var_1289;
      }
   }
}
