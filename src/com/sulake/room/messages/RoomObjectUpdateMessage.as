package com.sulake.room.messages
{
   import com.sulake.room.utils.IVector3d;
   
   public class RoomObjectUpdateMessage
   {
       
      
      protected var var_72:IVector3d;
      
      protected var var_225:IVector3d;
      
      public function RoomObjectUpdateMessage(param1:IVector3d, param2:IVector3d)
      {
         super();
         var_72 = param1;
         var_225 = param2;
      }
      
      public function get loc() : IVector3d
      {
         return var_72;
      }
      
      public function get dir() : IVector3d
      {
         return var_225;
      }
   }
}
