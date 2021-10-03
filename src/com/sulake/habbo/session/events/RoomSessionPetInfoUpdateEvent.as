package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IPetInfo;
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPetInfoUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_151:String = "RSPIUE_PET_INFO";
       
      
      private var var_1810:IPetInfo;
      
      public function RoomSessionPetInfoUpdateEvent(param1:IRoomSession, param2:IPetInfo, param3:Boolean = false, param4:Boolean = false)
      {
         super(RoomSessionPetInfoUpdateEvent.const_151,param1,param3,param4);
         var_1810 = param2;
      }
      
      public function get petInfo() : IPetInfo
      {
         return var_1810;
      }
   }
}
