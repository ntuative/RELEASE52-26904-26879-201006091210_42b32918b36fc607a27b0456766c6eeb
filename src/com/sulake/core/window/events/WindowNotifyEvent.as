package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1388:String = "WN_CREATED";
      
      public static const const_916:String = "WN_DISABLE";
      
      public static const const_877:String = "WN_DEACTIVATED";
      
      public static const const_1036:String = "WN_OPENED";
      
      public static const const_947:String = "WN_CLOSED";
      
      public static const const_848:String = "WN_DESTROY";
      
      public static const const_1494:String = "WN_ARRANGED";
      
      public static const const_428:String = "WN_PARENT_RESIZED";
      
      public static const const_868:String = "WN_ENABLE";
      
      public static const const_1031:String = "WN_RELOCATE";
      
      public static const const_1045:String = "WN_FOCUS";
      
      public static const const_993:String = "WN_PARENT_RELOCATED";
      
      public static const const_504:String = "WN_PARAM_UPDATED";
      
      public static const const_693:String = "WN_PARENT_ACTIVATED";
      
      public static const const_185:String = "WN_RESIZED";
      
      public static const const_1042:String = "WN_CLOSE";
      
      public static const const_904:String = "WN_PARENT_REMOVED";
      
      public static const const_296:String = "WN_CHILD_RELOCATED";
      
      public static const const_689:String = "WN_ENABLED";
      
      public static const const_253:String = "WN_CHILD_RESIZED";
      
      public static const const_958:String = "WN_MINIMIZED";
      
      public static const const_609:String = "WN_DISABLED";
      
      public static const const_228:String = "WN_CHILD_ACTIVATED";
      
      public static const const_416:String = "WN_STATE_UPDATED";
      
      public static const const_598:String = "WN_UNSELECTED";
      
      public static const const_492:String = "WN_STYLE_UPDATED";
      
      public static const const_1653:String = "WN_UPDATE";
      
      public static const const_420:String = "WN_PARENT_ADDED";
      
      public static const const_606:String = "WN_RESIZE";
      
      public static const const_697:String = "WN_CHILD_REMOVED";
      
      public static const const_1582:String = "";
      
      public static const const_990:String = "WN_RESTORED";
      
      public static const const_304:String = "WN_SELECTED";
      
      public static const const_980:String = "WN_MINIMIZE";
      
      public static const const_1033:String = "WN_FOCUSED";
      
      public static const const_1237:String = "WN_LOCK";
      
      public static const const_362:String = "WN_CHILD_ADDED";
      
      public static const const_1013:String = "WN_UNFOCUSED";
      
      public static const const_440:String = "WN_RELOCATED";
      
      public static const const_918:String = "WN_DEACTIVATE";
      
      public static const const_1437:String = "WN_CRETAE";
      
      public static const const_876:String = "WN_RESTORE";
      
      public static const const_325:String = "WN_ACTVATED";
      
      public static const const_1203:String = "WN_LOCKED";
      
      public static const const_422:String = "WN_SELECT";
      
      public static const const_901:String = "WN_MAXIMIZE";
      
      public static const const_968:String = "WN_OPEN";
      
      public static const const_751:String = "WN_UNSELECT";
      
      public static const const_1491:String = "WN_ARRANGE";
      
      public static const const_1428:String = "WN_UNLOCKED";
      
      public static const const_1570:String = "WN_UPDATED";
      
      public static const const_1034:String = "WN_ACTIVATE";
      
      public static const const_1436:String = "WN_UNLOCK";
      
      public static const const_1006:String = "WN_MAXIMIZED";
      
      public static const const_854:String = "WN_DESTROYED";
      
      public static const const_974:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1673,cancelable);
      }
   }
}
