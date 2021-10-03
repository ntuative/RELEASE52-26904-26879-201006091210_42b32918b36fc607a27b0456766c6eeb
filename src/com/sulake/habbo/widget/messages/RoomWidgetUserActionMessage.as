package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_757:String = "RWUAM_RESPECT_USER";
      
      public static const const_643:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_676:String = "RWUAM_START_TRADING";
      
      public static const const_549:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_640:String = "RWUAM_WHISPER_USER";
      
      public static const const_739:String = "RWUAM_IGNORE_USER";
      
      public static const const_426:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_736:String = "RWUAM_BAN_USER";
      
      public static const const_635:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_511:String = "RWUAM_KICK_USER";
      
      public static const const_750:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_695:String = " RWUAM_RESPECT_PET";
      
      public static const const_495:String = "RWUAM_KICK_BOT";
      
      public static const const_1411:String = "RWUAM_TRAIN_PET";
      
      public static const const_618:String = "RWUAM_PICKUP_PET";
      
      public static const const_726:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_658:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
