package com.sulake.core.utils
{
   import flash.events.Event;
   
   public class LibraryLoaderEvent extends Event
   {
      
      public static const LIBRARY_LOADER_EVENT_DEBUG:String = "LIBRARY_LOADER_EVENT_DEBUG";
      
      public static const LIBRARY_LOADER_EVENT_UNLOAD:String = "LIBRARY_LOADER_EVENT_UNLOAD";
      
      public static const LIBRARY_LOADER_EVENT_COMPLETE:String = "LIBRARY_LOADER_EVENT_COMPLETE";
      
      public static const LIBRARY_LOADER_EVENT_DISPOSE:String = "LIBRARY_LOADER_EVENT_DISPOSE";
      
      public static const LIBRARY_LOADER_EVENT_PROGRESS:String = "LIBRARY_LOADER_EVENT_PROGRESS";
      
      public static const LIBRARY_LOADER_EVENT_ERROR:String = "LIBRARY_LOADER_EVENT_ERROR";
      
      public static const LIBRARY_LOADER_EVENT_STATUS:String = "LIBRARY_LOADER_EVENT_STATUS";
       
      
      private var var_1692:uint;
      
      private var var_150:int;
      
      private var var_495:uint;
      
      private var _bytesTotal:uint;
      
      public function LibraryLoaderEvent(param1:String, param2:int, param3:uint, param4:uint, param5:uint)
      {
         var_150 = param2;
         _bytesTotal = param3;
         var_495 = param4;
         var_1692 = param5;
         super(param1,false,false);
      }
      
      public function get elapsedTime() : uint
      {
         return var_1692;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_495;
      }
      
      public function get status() : int
      {
         return var_150;
      }
      
      public function get bytesTotal() : uint
      {
         return _bytesTotal;
      }
      
      override public function clone() : Event
      {
         return new LibraryLoaderEvent(type,var_150,_bytesTotal,var_495,elapsedTime);
      }
   }
}
