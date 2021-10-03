package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_390:uint;
      
      private var var_996:IUnknown;
      
      private var var_1169:String;
      
      private var var_997:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_997 = param1;
         var_1169 = getQualifiedClassName(var_997);
         var_996 = param2;
         var_390 = 0;
      }
      
      public function get iid() : IID
      {
         return var_997;
      }
      
      public function get disposed() : Boolean
      {
         return var_996 == null;
      }
      
      public function get references() : uint
      {
         return var_390;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_390) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_996;
      }
      
      public function get iis() : String
      {
         return var_1169;
      }
      
      public function reserve() : uint
      {
         return ++var_390;
      }
      
      public function dispose() : void
      {
         var_997 = null;
         var_1169 = null;
         var_996 = null;
         var_390 = 0;
      }
   }
}
