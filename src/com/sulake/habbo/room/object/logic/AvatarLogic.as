package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.events.warnings.AvatarWalkWarpingWarningEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarWaveUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class AvatarLogic extends MovingObjectLogic
   {
      
      private static const const_815:Number = 1.5;
       
      
      private var var_637:int = 0;
      
      private var var_1018:int = 0;
      
      private var var_695:int = 0;
      
      private var var_542:int = 0;
      
      private var var_1118:int = 0;
      
      private var var_1119:int = 0;
      
      private var var_347:Vector3d = null;
      
      private var var_1019:int = 0;
      
      private var var_952:int = 0;
      
      private var var_1383:int = 0;
      
      private var _selected:Boolean = false;
      
      public function AvatarLogic()
      {
         super();
         var_1383 = getTimer() + getBlinkInterval();
      }
      
      private function getTalkingPauseInterval() : int
      {
         return 100 + Math.random() * 200;
      }
      
      private function updateActions(param1:int, param2:IRoomObjectModelController) : void
      {
         if(var_1019 > 0)
         {
            if(param1 > var_1019)
            {
               param2.setNumber(RoomObjectVariableEnum.const_225,0);
               var_1019 = 0;
               var_542 = 0;
               var_637 = 0;
            }
            else if(var_637 == 0 && var_542 == 0)
            {
               var_542 = param1 + getTalkingPauseInterval();
               var_637 = var_542 + getTalkingPauseLength();
            }
            else if(var_542 > 0 && param1 > var_542)
            {
               param2.setNumber(RoomObjectVariableEnum.const_225,0);
               var_542 = 0;
            }
            else if(var_637 > 0 && param1 > var_637)
            {
               param2.setNumber(RoomObjectVariableEnum.const_225,1);
               var_637 = 0;
            }
         }
         if(var_695 > 0 && param1 > var_695)
         {
            param2.setNumber(RoomObjectVariableEnum.const_240,0);
            var_695 = 0;
         }
         if(var_1018 > 0 && param1 > var_1018)
         {
            param2.setNumber(RoomObjectVariableEnum.const_281,0);
            var_1018 = 0;
         }
         if(var_1118 > 0 && param1 > var_1118)
         {
            param2.setNumber(RoomObjectVariableEnum.const_938,0);
            var_1118 = 0;
         }
         if(var_952 > 0)
         {
            if(param1 > var_952)
            {
               param2.setNumber(RoomObjectVariableEnum.const_469,0);
               var_952 = 0;
            }
            else if((var_952 - param1) % 10000 < 1000)
            {
               param2.setNumber(RoomObjectVariableEnum.const_318,1);
            }
            else
            {
               param2.setNumber(RoomObjectVariableEnum.const_318,0);
            }
         }
         if(param1 > var_1383)
         {
            param2.setNumber(RoomObjectVariableEnum.const_594,1);
            var_1383 = param1 + getBlinkInterval();
            var_1119 = param1 + getBlinkLength();
         }
         if(var_1119 > 0 && param1 > var_1119)
         {
            param2.setNumber(RoomObjectVariableEnum.const_594,0);
            var_1119 = 0;
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.update(param1);
         if(_selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc2_ = object.getLocation();
               if(var_347 == null || var_347.x != _loc2_.x || var_347.y != _loc2_.y || var_347.z != _loc2_.z)
               {
                  if(var_347 == null)
                  {
                     var_347 = new Vector3d();
                  }
                  var_347.assign(_loc2_);
                  _loc3_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_439,object.getId(),object.getType());
                  eventDispatcher.dispatchEvent(_loc3_);
               }
            }
         }
         if(object != null && object.getModelController() != null)
         {
            updateActions(param1,object.getModelController());
         }
      }
      
      private function getBlinkInterval() : int
      {
         return 4500 + Math.random() * 1000;
      }
      
      private function getBlinkLength() : int
      {
         return 50 + Math.random() * 200;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         if(param1 == null || object == null)
         {
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc3_ = param1 as RoomObjectMoveUpdateMessage;
            if(_loc3_ != null && targetIsWarping(_loc3_.realTargetLoc))
            {
               Logger.log("Target warp warning!");
               _loc4_ = new AvatarWalkWarpingWarningEvent();
               eventDispatcher.dispatchEvent(_loc4_);
            }
         }
         super.processUpdateMessage(param1);
         var _loc2_:IRoomObjectModelController = object.getModelController();
         if(param1 is RoomObjectAvatarPostureUpdateMessage)
         {
            _loc5_ = param1 as RoomObjectAvatarPostureUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_377,_loc5_.postureType);
            _loc2_.setString(RoomObjectVariableEnum.const_694,_loc5_.parameter);
            return;
         }
         if(param1 is RoomObjectAvatarChatUpdateMessage)
         {
            _loc6_ = param1 as RoomObjectAvatarChatUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_225,1);
            var_1019 = getTimer() + _loc6_.numberOfWords * 1000;
            return;
         }
         if(param1 is RoomObjectAvatarTypingUpdateMessage)
         {
            _loc7_ = param1 as RoomObjectAvatarTypingUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_858,Number(_loc7_.isTyping));
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc8_ = param1 as RoomObjectAvatarUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_305,_loc8_.dirHead);
            return;
         }
         if(param1 is RoomObjectAvatarGestureUpdateMessage)
         {
            _loc9_ = param1 as RoomObjectAvatarGestureUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_281,_loc9_.gesture);
            var_1018 = getTimer() + 3000;
            return;
         }
         if(param1 is RoomObjectAvatarWaveUpdateMessage)
         {
            _loc10_ = param1 as RoomObjectAvatarWaveUpdateMessage;
            if(_loc10_.isWaving)
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_240,1);
               var_695 = getTimer() + 0;
            }
            else
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_240,0);
               var_695 = 0;
            }
            return;
         }
         if(param1 is RoomObjectAvatarDanceUpdateMessage)
         {
            _loc11_ = param1 as RoomObjectAvatarDanceUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_997,_loc11_.danceStyle);
            return;
         }
         if(param1 is RoomObjectAvatarSleepUpdateMessage)
         {
            _loc12_ = param1 as RoomObjectAvatarSleepUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_446,Number(_loc12_.isSleeping));
            return;
         }
         if(param1 is RoomObjectAvatarEffectUpdateMessage)
         {
            _loc13_ = param1 as RoomObjectAvatarEffectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.AVATAR_EFFECT,_loc13_.effect);
            return;
         }
         if(param1 is RoomObjectAvatarCarryObjectUpdateMessage)
         {
            _loc14_ = param1 as RoomObjectAvatarCarryObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_469,_loc14_.itemType);
            var_952 = getTimer() + 100000;
            return;
         }
         if(param1 is RoomObjectAvatarUseObjectUpdateMessage)
         {
            _loc15_ = param1 as RoomObjectAvatarUseObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_318,_loc15_.itemType);
            return;
         }
         if(param1 is RoomObjectAvatarSignUpdateMessage)
         {
            _loc16_ = param1 as RoomObjectAvatarSignUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_938,_loc16_.signType);
            var_1118 = getTimer() + 5000;
            return;
         }
         if(param1 is RoomObjectAvatarFlatControlUpdateMessage)
         {
            _loc17_ = param1 as RoomObjectAvatarFlatControlUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_665,_loc17_.rawData);
            _loc2_.setNumber(RoomObjectVariableEnum.const_1259,Number(_loc17_.isAdmin));
            return;
         }
         if(param1 is RoomObjectAvatarFigureUpdateMessage)
         {
            _loc18_ = param1 as RoomObjectAvatarFigureUpdateMessage;
            _loc19_ = _loc2_.getString(RoomObjectVariableEnum.const_162);
            _loc20_ = _loc18_.figure;
            _loc21_ = _loc18_.gender;
            if(_loc19_ != null && _loc19_.indexOf(".bds-") != -1)
            {
               _loc20_ += _loc19_.substr(_loc19_.indexOf(".bds-"));
            }
            _loc2_.setString(RoomObjectVariableEnum.const_162,_loc20_);
            _loc2_.setString(RoomObjectVariableEnum.const_873,_loc21_);
            return;
         }
         if(param1 is RoomObjectAvatarSelectedMessage)
         {
            _loc22_ = param1 as RoomObjectAvatarSelectedMessage;
            _selected = _loc22_.selected;
            var_347 = null;
            return;
         }
      }
      
      private function getTalkingPauseLength() : int
      {
         return 75 + Math.random() * 75;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(_selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc1_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_389,object.getId(),object.getType());
               eventDispatcher.dispatchEvent(_loc1_);
            }
         }
         super.dispose();
         var_347 = null;
      }
      
      override public function method_2(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(object == null || param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               _loc3_ = object.getId();
               _loc4_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc5_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_246,_loc3_,_loc4_);
                  eventDispatcher.dispatchEvent(_loc5_);
               }
         }
      }
      
      private function targetIsWarping(param1:IVector3d) : Boolean
      {
         var _loc2_:IVector3d = object.getLocation();
         if(param1 == null)
         {
            return false;
         }
         if(_loc2_.x == 0 && _loc2_.y == 0)
         {
            return false;
         }
         if(Math.abs(_loc2_.x - param1.x) > const_815 || Math.abs(_loc2_.y - param1.y) > const_815)
         {
            return true;
         }
         return false;
      }
   }
}
