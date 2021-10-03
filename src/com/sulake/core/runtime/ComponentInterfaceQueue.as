package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1339:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_916:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1339 = param1;
         var_916 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_916;
      }
      
      public function get identifier() : IID
      {
         return var_1339;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1339 = null;
            while(false)
            {
               var_916.pop();
            }
            var_916 = null;
         }
      }
   }
}
