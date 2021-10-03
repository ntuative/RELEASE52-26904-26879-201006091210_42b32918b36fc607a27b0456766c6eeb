package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_122:DisplayObject;
      
      private var var_2406:uint;
      
      private var var_934:IWindowToolTipAgentService;
      
      private var var_933:IWindowMouseScalingService;
      
      private var var_229:IWindowContext;
      
      private var var_931:IWindowFocusManagerService;
      
      private var var_935:IWindowMouseListenerService;
      
      private var var_932:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2406 = 0;
         var_122 = param2;
         var_229 = param1;
         var_932 = new WindowMouseDragger(param2);
         var_933 = new WindowMouseScaler(param2);
         var_935 = new WindowMouseListener(param2);
         var_931 = new FocusManager(param2);
         var_934 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_933;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_931;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_934;
      }
      
      public function dispose() : void
      {
         if(var_932 != null)
         {
            var_932.dispose();
            var_932 = null;
         }
         if(var_933 != null)
         {
            var_933.dispose();
            var_933 = null;
         }
         if(var_935 != null)
         {
            var_935.dispose();
            var_935 = null;
         }
         if(var_931 != null)
         {
            var_931.dispose();
            var_931 = null;
         }
         if(var_934 != null)
         {
            var_934.dispose();
            var_934 = null;
         }
         var_229 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_935;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_932;
      }
   }
}
