package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1086:int = 80;
       
      
      private var var_488:Map;
      
      private var var_698:String = "";
      
      private var var_1203:Array;
      
      public function UserRegistry()
      {
         var_488 = new Map();
         var_1203 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_488.getValue(var_1203.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_698;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_488.getValue(param1) != null)
         {
            var_488.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_698);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_698 == "")
         {
            var_1203.push(param1);
         }
         var_488.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_488;
      }
      
      public function unregisterRoom() : void
      {
         var_698 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_488.length > const_1086)
         {
            _loc1_ = var_488.getKey(0);
            var_488.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_698 = param1;
         if(var_698 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
