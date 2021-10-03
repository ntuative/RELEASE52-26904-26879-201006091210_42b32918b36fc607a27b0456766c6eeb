package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_271:String = "WE_CHILD_RESIZED";
      
      public static const const_1260:String = "WE_CLOSE";
      
      public static const const_1429:String = "WE_DESTROY";
      
      public static const const_119:String = "WE_CHANGE";
      
      public static const const_1348:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1550:String = "WE_PARENT_RESIZE";
      
      public static const const_95:String = "WE_UPDATE";
      
      public static const const_1326:String = "WE_MAXIMIZE";
      
      public static const const_391:String = "WE_DESTROYED";
      
      public static const const_915:String = "WE_UNSELECT";
      
      public static const const_1386:String = "WE_MAXIMIZED";
      
      public static const const_1677:String = "WE_UNLOCKED";
      
      public static const const_449:String = "WE_CHILD_REMOVED";
      
      public static const const_167:String = "WE_OK";
      
      public static const const_48:String = "WE_RESIZED";
      
      public static const const_1231:String = "WE_ACTIVATE";
      
      public static const const_261:String = "WE_ENABLED";
      
      public static const const_444:String = "WE_CHILD_RELOCATED";
      
      public static const const_1325:String = "WE_CREATE";
      
      public static const const_532:String = "WE_SELECT";
      
      public static const const_182:String = "";
      
      public static const const_1518:String = "WE_LOCKED";
      
      public static const const_1531:String = "WE_PARENT_RELOCATE";
      
      public static const const_1606:String = "WE_CHILD_REMOVE";
      
      public static const const_1497:String = "WE_CHILD_RELOCATE";
      
      public static const const_1635:String = "WE_LOCK";
      
      public static const const_238:String = "WE_FOCUSED";
      
      public static const const_680:String = "WE_UNSELECTED";
      
      public static const const_923:String = "WE_DEACTIVATED";
      
      public static const const_1216:String = "WE_MINIMIZED";
      
      public static const const_1492:String = "WE_ARRANGED";
      
      public static const const_1607:String = "WE_UNLOCK";
      
      public static const const_1610:String = "WE_ATTACH";
      
      public static const const_1296:String = "WE_OPEN";
      
      public static const const_1191:String = "WE_RESTORE";
      
      public static const const_1602:String = "WE_PARENT_RELOCATED";
      
      public static const const_1200:String = "WE_RELOCATE";
      
      public static const const_1675:String = "WE_CHILD_RESIZE";
      
      public static const const_1682:String = "WE_ARRANGE";
      
      public static const const_1380:String = "WE_OPENED";
      
      public static const const_1286:String = "WE_CLOSED";
      
      public static const const_1704:String = "WE_DETACHED";
      
      public static const const_1495:String = "WE_UPDATED";
      
      public static const const_1398:String = "WE_UNFOCUSED";
      
      public static const const_493:String = "WE_RELOCATED";
      
      public static const const_1423:String = "WE_DEACTIVATE";
      
      public static const const_247:String = "WE_DISABLED";
      
      public static const const_669:String = "WE_CANCEL";
      
      public static const const_629:String = "WE_ENABLE";
      
      public static const const_1305:String = "WE_ACTIVATED";
      
      public static const const_1412:String = "WE_FOCUS";
      
      public static const const_1694:String = "WE_DETACH";
      
      public static const const_1255:String = "WE_RESTORED";
      
      public static const const_1435:String = "WE_UNFOCUS";
      
      public static const const_62:String = "WE_SELECTED";
      
      public static const const_1223:String = "WE_PARENT_RESIZED";
      
      public static const const_1180:String = "WE_CREATED";
      
      public static const const_1553:String = "WE_ATTACHED";
      
      public static const const_1405:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1673:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1445:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1673 = param3;
         var_1445 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1445;
      }
      
      public function get related() : IWindow
      {
         return var_1673;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1445 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
