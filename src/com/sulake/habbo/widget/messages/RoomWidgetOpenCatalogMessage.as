package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_1014:String = "RWOCM_CLUB_MAIN";
      
      public static const const_720:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1855:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_720);
         var_1855 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1855;
      }
   }
}
